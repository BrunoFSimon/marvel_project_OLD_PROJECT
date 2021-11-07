import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_project/features/characters/domain/entities/character_details.dart';
import 'package:marvel_project/features/characters/domain/errors/failure.dart';
import 'package:marvel_project/features/characters/domain/repositories/characters_repository.dart';

mixin GetCharactersDetailsById {
  Future<Either<Failure, CharacterDetails>> call(int characterId);
}

@Injectable(singleton: false)
class GetCharacterDetailsByIdImpl implements GetCharactersDetailsById {
  final CharactersRepository repository;

  GetCharacterDetailsByIdImpl(this.repository);

  @override
  Future<Either<Failure, CharacterDetails>> call(int id) async {
    if (id < 0) {
      left(InvalidCharacterIdFailure());
    }
    var option = optionOf(id);

    return option.fold(() => left(CharactersAPIFailure()), (v) async {
      return await repository.getCharacterDetailsById(id);
    });
  }
}
