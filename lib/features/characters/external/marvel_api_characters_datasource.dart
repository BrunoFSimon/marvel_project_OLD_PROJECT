import 'package:marvel_project/features/characters/external/models/character_data_eraper.dart';
import 'package:marvel_project/features/characters/external/utils/build_thumbnail_path.dart';
import 'package:marvel_project/features/characters/infra/http_client/http_client.dart';
import 'package:marvel_project/features/characters/infra/datasources/characters_datasource.dart';
import 'package:marvel_project/features/characters/infra/models/character_details_model.dart';
import 'package:marvel_project/features/characters/infra/models/character_model.dart';

class MarvelAPICharactersDatasource implements CharactersDataSource {
  final HttpClient client;
  final BuildThumbailPath buildThumbailPath;

  MarvelAPICharactersDatasource(this.client, this.buildThumbailPath);

  @override
  Future<List<CharacterModel>> getByRange(int skip, int take) async {
    var result = await client.get('characters?limit=$take&offset=$skip');
    var dataWraper = CharacterDataWraper.fromJson(result);

    return dataWraper.data.results
        .map(
          (e) => CharacterModel(
            e.name,
            e.thumbnail.path +
                '/portrait_incredible' +
                '.' +
                e.thumbnail.extension,
            e.id,
          ),
        )
        .toList();
  }

  @override
  Future<CharacterDetailsModel> getDetailsById(int characterId) async {
    var result = await client.get('characters/$characterId');
    var dataWraper = CharacterDataWraper.fromJson(result);

    return dataWraper.data.results
        .map(
          (e) => CharacterDetailsModel(
            e.name,
            buildThumbailPath.call(e.thumbnail.path, e.thumbnail.extension),
            e.description,
            e.id,
          ),
        )
        .first;
  }
}
