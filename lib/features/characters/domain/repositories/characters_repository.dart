import 'package:dartz/dartz.dart';
import 'package:marvel_project/features/characters/domain/entities/character.dart';
import 'package:marvel_project/features/characters/domain/entities/character_details.dart';
import 'package:marvel_project/features/characters/domain/errors/failure.dart';

abstract class CharactersRepository {
  Future<Either<Failure, List<Character>>> getCharactersByRange(
      int skip, int take);

  Future<Either<Failure, CharacterDetails>> getCharacterDetailsById(int id);
}
