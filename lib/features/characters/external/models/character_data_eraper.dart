import 'package:json_annotation/json_annotation.dart';
import 'package:marvel_project/features/characters/external/models/character_data_container.dart';

part 'character_data_eraper.g.dart';

@JsonSerializable()
class CharacterDataWraper {
  final CharacterDataContainer data;

  factory CharacterDataWraper.fromJson(Map<String, dynamic> json) =>
      _$CharacterDataWraperFromJson(json);

  CharacterDataWraper(this.data);
  Map<String, dynamic> toJson() => _$CharacterDataWraperToJson(this);
}
