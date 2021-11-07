import 'package:json_annotation/json_annotation.dart';

part 'character_data_comic_item.g.dart';

@JsonSerializable()
class CharacterDataComicItem {
  final String name;

  CharacterDataComicItem(this.name);

  factory CharacterDataComicItem.fromJson(Map<String, dynamic> json) =>
      _$CharacterDataComicItemFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterDataComicItemToJson(this);
}
