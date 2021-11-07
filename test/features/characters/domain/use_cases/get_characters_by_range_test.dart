import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_project/features/characters/domain/entities/character.dart';
import 'package:marvel_project/features/characters/domain/errors/failure.dart';
import 'package:marvel_project/features/characters/domain/repositories/characters_repository.dart';
import 'package:marvel_project/features/characters/domain/use_cases/get_characters_by_range.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_characters_by_range_test.mocks.dart';

@GenerateMocks([CharactersRepository])
void main() {
  final repository = MockCharactersRepository();
  final useCase = GetCharactersByRangeImpl(repository);

  test('Must return a characters list', () async {
    int skip = 0;
    int take = 10;

    when(repository.getCharactersByRange(skip, take))
        .thenAnswer((_) async => right(<Character>[]));

    var result = await useCase(skip, take);

    expect(result, isA<Right<Failure, List<Character>>>());
  });

  test('Must return a InvalidCharactersRange if skip < 0', () async {
    int skip = -1;
    int take = 10;

    when(repository.getCharactersByRange(skip, take))
        .thenAnswer((_) async => left(InvalidCharactersRange()));

    var result = await useCase(skip, take);

    result.foldLeft((a) => {expect(a, InvalidCharactersRange)}, (b, c) => {});
  });

  test('Must return a InvalidCharactersRange if take <= 0', () async {
    int skip = 10;
    int take = 0;

    when(repository.getCharactersByRange(skip, take))
        .thenAnswer((_) async => left(InvalidCharactersRange()));

    var result = await useCase(skip, take);

    result.foldLeft((a) => {expect(a, InvalidCharactersRange)}, (b, c) => {});
  });
}
