import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_project/features/characters/domain/use_cases/get_character_details_by_id.dart';
import 'package:marvel_project/features/characters/domain/use_cases/get_characters_by_range.dart';
import 'package:marvel_project/features/characters/external/marvel_api_characters_datasource.dart';
import 'package:marvel_project/features/characters/external/utils/build_thumbnail_path.dart';
import 'package:marvel_project/features/characters/infra/http_client/http_client.dart';
import 'package:marvel_project/features/characters/infra/repositories/characters_repository.dart';
import 'package:marvel_project/features/characters/infra/utils/md5_generator.dart';
import 'package:marvel_project/features/characters/presenter/characters_details/character_details_store.dart';
import 'package:marvel_project/features/characters/presenter/characters_details/characters_details_page.dart';
import 'package:marvel_project/features/characters/presenter/characters_list/characters_list_page.dart';
import 'package:marvel_project/features/characters/presenter/characters_list/characters_list_store.dart';
import 'package:marvel_project/modular/routes.dart';
import 'package:uuid/uuid.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => GetCharactersByRangeImpl(i())),
        Bind((i) => GetCharacterDetailsByIdImpl(i())),
        Bind((i) => MarvelAPICharactersDatasource(i(), i())),
        Bind((i) => DioClient(i(), i(), i())),
        Bind((i) => CharactersRepositoryImpl(i())),
        Bind((i) => MD5Generator()),
        Bind((i) => const Uuid()),
        Bind((i) => Dio(BaseOptions())),
        Bind((i) => DioClient(i(), i(), i())),
        Bind.singleton((i) => BuildThumbailPath()),
        Bind.singleton((i) => CharactersListStore(i())),
        Bind.factory((i) => CharactersDetailsStore(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Routes.characterList,
            child: (context, args) => const CharactersListPage()),
        ChildRoute(Routes.characterDetails,
            child: (context, args) => CharactersDetailsPage(
                  id: args.data,
                )),
      ];
}
