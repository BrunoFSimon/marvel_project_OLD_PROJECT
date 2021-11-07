import 'package:json_annotation/json_annotation.dart';
import 'package:marvel_project/features/characters/external/models/character_data_thumbail.dart';

part 'character_data_model.g.dart';

@JsonSerializable()
class CharacterDataModel {
  final String name;
  final CharacterDataThumbnail thumbnail;
  final int id;
  final String description;

  factory CharacterDataModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterDataModelFromJson(json);

  CharacterDataModel(this.name, this.thumbnail, this.id, this.description);
  Map<String, dynamic> toJson() => _$CharacterDataModelToJson(this);
}
