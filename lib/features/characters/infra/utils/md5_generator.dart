import 'dart:convert';
import 'package:crypto/crypto.dart';

class MD5Generator {
  String call(List<String> values) {
    return md5.convert(utf8.encode(values.join(''))).toString();
  }
}
