import 'package:flutter/material.dart';
import 'package:marvel_project/features/characters/presenter/constants/images/images_paths.dart';

class MarvelAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MarvelAppBar({Key? key}) : super(key: key);

  @override
  _MarvelAppBarState createState() => _MarvelAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MarvelAppBarState extends State<MarvelAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 130),
        child: Image.asset(
          ImagesPaths.marvelLogoNoBackground,
        ),
      ),
    );
  }
}
