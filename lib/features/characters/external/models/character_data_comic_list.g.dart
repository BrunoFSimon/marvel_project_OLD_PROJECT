// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_data_comic_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterDataComicList _$CharacterDataComicListFromJson(
        Map<String, dynamic> json) =>
    CharacterDataComicList(
      (json['items'] as List<dynamic>)
          .map(
              (e) => CharacterDataComicItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharacterDataComicListToJson(
        CharacterDataComicList instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
