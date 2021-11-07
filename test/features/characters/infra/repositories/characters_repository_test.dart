import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_project/features/characters/domain/errors/failure.dart';
import 'package:marvel_project/features/characters/infra/datasources/characters_datasource.dart';
import 'package:marvel_project/features/characters/infra/models/character_details_model.dart';
import 'package:marvel_project/features/characters/infra/models/character_model.dart';
import 'package:marvel_project/features/characters/infra/repositories/characters_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'characters_repository_test.mocks.dart';

@GenerateMocks([CharactersDataSource])
void main() {
  final dataSopurce = MockCharactersDataSource();
  final repository = CharactersRepositoryImpl(dataSopurce);

  test('Must retorn a List<CharacterModel>', () async {
    int skip = 0;
    int take = 10;

    when(dataSopurce.getByRange(skip, take))
        .thenAnswer((_) async => <CharacterModel>[]);

    var result = await repository.getCharactersByRange(skip, take);

    result.fold((l) => throw Exception(),
        (r) => expect(r, isA<List<CharacterModel>>()));
  });

  test('Must return a CharactersRepositoryFailure', () async {
    when(dataSopurce.getByRange(any, any)).thenThrow(Exception());

    var result = await repository.getCharactersByRange(10, 10);

    result.fold((l) => expect(l, isA<Exception>()), (r) => {});
  });

  test('Should return a CharacterDetailModel', () async {
    when(dataSopurce.getDetailsById(any)).thenAnswer((_) async =>
        CharacterDetailsModel('name', 'imgUrl', 'description', 0, []));

    var result = await repository.getCharacterDetailsById(1);

    result.foldRight(
        null, (r, previous) => expect(r, isA<CharacterDetailsModel>()));
  });
}
