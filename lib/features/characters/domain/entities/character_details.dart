import 'package:marvel_project/features/characters/domain/entities/character.dart';

class CharacterDetails extends Character {
  final String description;

  CharacterDetails(String name, String imgUrl, this.description)
      : super(name, imgUrl);
}
