import 'package:json_annotation/json_annotation.dart';
import 'package:marvel_project/features/characters/domain/entities/character_details.dart';

part 'character_details_model.g.dart';

@JsonSerializable()
class CharacterDetailsModel extends CharacterDetails {
  CharacterDetailsModel(String name, String imgUrl, String description, int id,
      List<String> comicsNames)
      : super(name, imgUrl, description, id, comicsNames);

  factory CharacterDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterDetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterDetailsModelToJson(this);
}
