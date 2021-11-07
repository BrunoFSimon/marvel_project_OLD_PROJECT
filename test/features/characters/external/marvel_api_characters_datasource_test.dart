import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_project/features/characters/external/data_sources/marvel_api_characters_datasource.dart';
import 'package:marvel_project/features/characters/external/utils/build_thumbnail_path.dart';
import 'package:marvel_project/features/characters/infra/http_client/http_client.dart';
import 'package:marvel_project/features/characters/infra/models/character_details_model.dart';
import 'package:marvel_project/features/characters/infra/models/character_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'json_responses/json_responses.dart';
import 'marvel_api_characters_datasource_test.mocks.dart';

@GenerateMocks([HttpClient])
void main() {
  var httpClient = MockHttpClient();
  var dataSopurce =
      MarvelAPICharactersDatasource(httpClient, BuildThumbailPath());

  test('Must retorn a List<CharacterModel>', () async {
    when(httpClient.get(any)).thenAnswer(
        (_) async => jsonDecode(JsonResponses().charactersListResponse));

    var result = await dataSopurce.getByRange(0, 10);

    expect(result, isA<List<CharacterModel>>());
  });

  test('Must retorn a CharacterDetailsModel', () async {
    when(httpClient.get(any)).thenAnswer(
        (_) async => jsonDecode(JsonResponses().characterDetailsResponse));

    var result = await dataSopurce.getDetailsById(1);

    expect(result, isA<CharacterDetailsModel>());
  });
}
