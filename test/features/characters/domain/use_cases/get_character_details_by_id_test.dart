import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_project/features/characters/domain/entities/character_details.dart';
import 'package:marvel_project/features/characters/domain/errors/failure.dart';
import 'package:marvel_project/features/characters/domain/repositories/characters_repository.dart';
import 'package:marvel_project/features/characters/domain/use_cases/get_character_details_by_id.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_character_details_by_id_test.mocks.dart';

@GenerateMocks([CharactersRepository])
void main() {
  final repository = MockCharactersRepository();
  final useCase = GetCharacterDetailsByIdImpl(repository);

  test('Must return a character detail', () async {
    when(repository.getCharacterDetailsById(any)).thenAnswer((_) async =>
        right(CharacterDetails('name', 'imgUrl', 'description', 0)));

    var result = await useCase.call(1);

    result.foldRight(null, (r, previous) => expect(r, isA<CharacterDetails>()));
  });

  test('Must return a CharactersAPIFailure', () async {
    when(repository.getCharacterDetailsById(any))
        .thenAnswer((_) async => left(CharactersAPIFailure()));

    var result = await useCase.call(1);

    result.foldLeft(null, (previous, r) => isA<CharactersAPIFailure>());
  });
}
