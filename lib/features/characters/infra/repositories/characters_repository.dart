import 'package:marvel_project/features/characters/domain/entities/character_details.dart';
import 'package:marvel_project/features/characters/domain/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:marvel_project/features/characters/domain/repositories/characters_repository.dart';
import 'package:marvel_project/features/characters/infra/datasources/characters_datasource.dart';
import 'package:marvel_project/features/characters/infra/models/character_details_model.dart';
import 'package:marvel_project/features/characters/infra/models/character_model.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  final CharactersDataSource dataSource;

  CharactersRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<CharacterModel>>> getCharactersByRange(
      int skip, int take) async {
    List<CharacterModel> result;

    try {
      result = await dataSource.getByRange(skip, take);
    } on Exception catch (e) {
      return left(CharactersRepositoryFailure(e));
    }

    return right(result);
  }

  @override
  Future<Either<Failure, CharacterDetails>> getCharacterDetailsById(
      int characterId) async {
    CharacterDetailsModel result;

    try {
      result = await dataSource.getDetailsById(characterId);
    } on Exception catch (e) {
      return left(CharactersRepositoryFailure(e));
    }

    return right(result);
  }
}
