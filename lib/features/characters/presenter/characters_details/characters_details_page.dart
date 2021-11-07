import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_project/features/characters/presenter/characters_details/character_details_store.dart';

import 'package:marvel_project/features/characters/presenter/constants/images/images_paths.dart';

class CharactersDetailsPage extends StatefulWidget {
  final int characterId;

  const CharactersDetailsPage({
    required this.characterId,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CharactersDetailsPage();
}

class _CharactersDetailsPage
    extends ModularState<CharactersDetailsPage, CharactersDetailsStore>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Container(
            padding: const EdgeInsets.symmetric(horizontal: 130),
            child: Image.asset(
              ImagesPaths.marvelLogoNoBackground,
            ),
          ),
        ),
        body: Stack(),
      ),
    );
  }
}
