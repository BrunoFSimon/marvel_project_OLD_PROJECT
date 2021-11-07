import 'package:dio/dio.dart';
import 'package:marvel_project/features/characters/infra/utils/md5_generator.dart';
import 'package:uuid/uuid.dart';

abstract class HttpClient {
  Future<dynamic> get(String url);
  Future<dynamic> post(String url, Map<String, dynamic> data);
}

class DioClient implements HttpClient {
  final Dio dio;
  final MD5Generator md5Generator;
  final Uuid uuid;

  final String publicKey = '1a1ff9664cf86f19efe41906896049ff';
  final String privateKey = '9ba640e3e559f1817151c162b40669861745e310';

  DioClient(this.dio, this.md5Generator, this.uuid) {
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      options.path =
          resolveToken(options.path, uuid.v4(), publicKey, privateKey);

      return handler.next(options);
    }, onResponse: (response, handler) {
      if (response.statusCode != 200) {
        handler.reject(DioError(requestOptions: response.requestOptions));
      }
      return handler.next(response);
    }, onError: (DioError e, handler) {
      // TODO return error message inside exception
      return handler.next(e);
    }));

    dio.options.baseUrl = 'https://gateway.marvel.com:443/v1/public/';
  }

  String resolveToken(
      String path, String ts, String publicKey, String privateKey) {
    var md5 = md5Generator([
      ts,
      privateKey,
      publicKey,
    ]);
    var token = 'ts=$ts&apikey=$publicKey&hash=$md5';
    path = path.contains('?') ? '$path&$token' : '$path?$token';
    return path;
  }

  @override
  Future get(String url) async {
    return (await dio.get(url)).data;
  }

  @override
  Future post(String url, Map<String, dynamic> data) async {
    return (await dio.post(url, data: data)).data;
  }
}
