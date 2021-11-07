import 'package:marvel_project/features/characters/infra/models/character_details_model.dart';
import 'package:marvel_project/features/characters/infra/models/character_model.dart';

abstract class CharactersDataSource {
  Future<List<CharacterModel>> getByRange(int skip, int take);
  Future<CharacterDetailsModel> getDetailsById(int characterId);
}
