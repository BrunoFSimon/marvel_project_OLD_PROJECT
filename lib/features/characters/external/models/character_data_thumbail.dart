import 'package:json_annotation/json_annotation.dart';

part 'character_data_thumbail.g.dart';

@JsonSerializable()
class CharacterDataThumbnail {
  final String path;
  final String extension;

  factory CharacterDataThumbnail.fromJson(Map<String, dynamic> json) =>
      _$CharacterDataThumbnailFromJson(json);

  CharacterDataThumbnail(this.path, this.extension);
  Map<String, dynamic> toJson() => _$CharacterDataThumbnailToJson(this);
}
