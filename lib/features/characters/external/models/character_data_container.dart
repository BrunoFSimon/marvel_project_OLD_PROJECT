import 'package:json_annotation/json_annotation.dart';
import 'package:marvel_project/features/characters/external/models/character_data_model.dart';

part 'character_data_container.g.dart';

@JsonSerializable()
class CharacterDataContainer {
  final List<CharacterDataModel> results;

  factory CharacterDataContainer.fromJson(Map<String, dynamic> json) =>
      _$CharacterDataContainerFromJson(json);

  CharacterDataContainer(this.results);
  Map<String, dynamic> toJson() => _$CharacterDataContainerToJson(this);
}
