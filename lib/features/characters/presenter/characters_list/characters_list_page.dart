import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_project/features/characters/presenter/characters_list/characters_list_store.dart';
import 'package:marvel_project/features/characters/presenter/constants/images/images_paths.dart';

class CharactersListPage extends StatefulWidget {
  const CharactersListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CharactersListPage();
}

class _CharactersListPage
    extends ModularState<CharactersListPage, CharactersListStore>
    with SingleTickerProviderStateMixin {
  Widget _buildBackgroundImage(String imagePath) {
    return Image.asset(
      imagePath,
      fit: BoxFit.cover,
      width: 99999,
    );
  }

  Widget _buildBackgroundCarousel() {
    return Stack(
      children: [
        CarouselSlider(
          items: [
            _buildBackgroundImage(ImagesPaths.spiderman),
            _buildBackgroundImage(ImagesPaths.batman),
            _buildBackgroundImage(ImagesPaths.superman),
            _buildBackgroundImage(ImagesPaths.darkSpider),
          ],
          options: CarouselOptions(
            autoPlay: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 5000),
            autoPlayInterval: const Duration(seconds: 6),
            autoPlayCurve: Curves.linear,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            viewportFraction: 1.2,
            height: MediaQuery.of(context).size.height,
            enlargeCenterPage: true,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.black.withOpacity(0.5),
              Colors.black.withOpacity(0.1),
              Colors.black.withOpacity(0.9),
            ], tileMode: TileMode.repeated),
          ),
        ),
      ],
    );
  }

  Widget _buildLoading() {
    var animationController = AnimationController(
      vsync: this,
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
        body: Stack(
          children: [
            _buildBackgroundCarousel(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Observer(
                builder: (c) {
                  if (controller.characters.isEmpty) {
                    _buildLoading();
                  }

                  return ListView.separated(
                      itemCount: controller.characters.length,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (c, i) {
                        var item = controller.characters[i];
                        return Padding(
                          padding: const EdgeInsets.only(right: 30.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white.withOpacity(0.2),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FadeInImage(
                                    height: 150,
                                    width: 110,
                                    alignment: Alignment.centerLeft,
                                    placeholder: Image.asset(
                                      ImagesPaths.marvelLogo,
                                      height: 50,
                                    ).image,
                                    image: Image.network(item.imgUrl).image),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      item.name,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
