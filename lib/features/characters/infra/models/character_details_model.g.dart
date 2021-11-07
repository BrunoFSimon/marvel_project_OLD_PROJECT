// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterDetailsModel _$CharacterDetailsModelFromJson(
        Map<String, dynamic> json) =>
    CharacterDetailsModel(
      json['name'] as String,
      json['imgUrl'] as String,
      json['description'] as String,
      json['id'] as int,
      (json['comicsNames'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CharacterDetailsModelToJson(
        CharacterDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imgUrl': instance.imgUrl,
      'description': instance.description,
      'comicsNames': instance.comicsNames,
    };
