import 'package:flutter/material.dart';
import 'package:marvel_project/features/characters/presenter/constants/images/images_paths.dart';

class MarvelLoading extends StatelessWidget {
  final TickerProvider vsync;

  const MarvelLoading({required this.vsync, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildLoading() {
      var animationController = AnimationController(
        vsync: vsync,
        duration: const Duration(milliseconds: 1000),
      );

      animationController.addListener(() {
        if (animationController.isCompleted) {
          animationController.reverse();
        } else if (animationController.isDismissed) {
          animationController.forward();
        }
      });

      var animation = Tween(
        begin: 0.0,
        end: 1.0,
      ).animate(animationController);

      animationController.forward();

      return FadeTransition(
        opacity: animation,
        child: Center(child: Image.asset(ImagesPaths.marvelLogo, width: 200)),
      );
    }

    return _buildLoading();
  }
}
