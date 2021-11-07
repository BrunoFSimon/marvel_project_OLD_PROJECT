import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_project/features/characters/domain/entities/character.dart';
import 'package:marvel_project/features/characters/domain/errors/failure.dart';
import 'package:marvel_project/features/characters/domain/repositories/characters_repository.dart';

mixin GetCharactersByRange {
  Future<Either<Failure, List<Character>>> call(int skip, int take);
}

@Injectable(singleton: false)
class GetCharactersByRangeImpl implements GetCharactersByRange {
  final CharactersRepository repository;

  GetCharactersByRangeImpl(this.repository);

  @override
  Future<Either<Failure, List<Character>>> call(int skip, int take) async {
    if (skip < 0 || take <= 0) {
      return left(InvalidCharactersRange());
    }

    var options = optionOf(tuple2(skip, take));

    return options.fold(() => left(CharactersAPIFailure()), (v) async {
      return await repository.getCharactersByRange(v.value1, v.value2);
    });
  }
}
