import 'package:marvel_project/features/characters/domain/entities/character.dart';

class CharacterDetails extends Character {
  final String description;
  final List<String> comicsNames;

  CharacterDetails(
      String name, String imgUrl, this.description, int id, this.comicsNames)
      : super(name, imgUrl, id);
}
