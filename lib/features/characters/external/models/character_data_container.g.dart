// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_data_container.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterDataContainer _$CharacterDataContainerFromJson(
        Map<String, dynamic> json) =>
    CharacterDataContainer(
      (json['results'] as List<dynamic>)
          .map((e) => CharacterDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharacterDataContainerToJson(
        CharacterDataContainer instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
