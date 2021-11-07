import 'package:flutter/material.dart';
import 'package:marvel_project/features/characters/presenter/characters_list/characters_list_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const CharactersListPage(),
    );
  }
}
