import 'package:marvel_project/features/characters/external/models/character_data_comic_item.dart';

import 'package:json_annotation/json_annotation.dart';

part 'character_data_comic_list.g.dart';

@JsonSerializable()
class CharacterDataComicList {
  final List<CharacterDataComicItem> items;

  factory CharacterDataComicList.fromJson(Map<String, dynamic> json) =>
      _$CharacterDataComicListFromJson(json);

  CharacterDataComicList(this.items);
  Map<String, dynamic> toJson() => _$CharacterDataComicListToJson(this);
}
