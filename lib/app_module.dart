import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_project/app_widget.dart';
import 'package:marvel_project/features/characters/domain/use_cases/get_characters_by_range.dart';
import 'package:marvel_project/features/characters/infra/utils/md5_generator.dart';
import 'package:marvel_project/features/characters/external/marvel_api_characters_datasource.dart';
import 'package:marvel_project/features/characters/infra/http_client/http_client.dart';
import 'package:marvel_project/features/characters/infra/repositories/characters_repository.dart';
import 'package:marvel_project/features/characters/presenter/characters_list/characters_list_page.dart';
import 'package:marvel_project/features/characters/presenter/characters_list/characters_list_store.dart';
import 'package:uuid/uuid.dart';

import 'features/characters/external/utils/build_thumbnail_path.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => const [];

  @override
  List<Bind> get binds => [
        Bind((i) => GetCharactersByRangeImpl(i())),
        Bind((i) => MarvelAPICharactersDatasource(i(), i())),
        Bind((i) => DioClient(i(), i(), i())),
        Bind((i) => CharactersRepositoryImpl(i())),
        Bind((i) => MD5Generator()),
        Bind((i) => const Uuid()),
        Bind((i) => Dio(BaseOptions())),
        Bind((i) => DioClient(i(), i(), i())),
        Bind.singleton((i) => BuildThumbailPath()),
        Bind.singleton((i) => CharactersListStore(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const AppWidget()),
        ChildRoute('/charactersList',
            child: (context, args) => const CharactersListPage()),
      ];
}
