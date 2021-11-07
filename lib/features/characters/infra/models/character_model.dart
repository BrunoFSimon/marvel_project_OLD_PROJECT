import 'package:json_annotation/json_annotation.dart';
import 'package:marvel_project/features/characters/domain/entities/character.dart';

part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel extends Character {
  CharacterModel(String name, String imgUrl, int id) : super(name, imgUrl, id);

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}
