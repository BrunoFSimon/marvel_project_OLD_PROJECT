import 'package:flutter/material.dart';

class MarvelTitle extends StatelessWidget {
  final String text;

  const MarvelTitle({Key? key, required this.text}) : super(key: key);

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
