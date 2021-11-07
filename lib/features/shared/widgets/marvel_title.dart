import 'package:flutter/material.dart';

class MarvelTitleBlack extends StatelessWidget {
  final String text;

  const MarvelTitleBlack({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 20,
      ),
    );
  }
}

class MarvelTitleWhite extends StatelessWidget {
  final String text;

  const MarvelTitleWhite({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}
