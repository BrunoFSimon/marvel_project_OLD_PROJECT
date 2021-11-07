import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_project/features/characters/presenter/characters_details/character_details_store.dart';

import 'package:marvel_project/features/characters/presenter/constants/images/images_paths.dart';
import 'package:marvel_project/features/shared/widgets/marvel_app_bar.dart';
import 'package:marvel_project/features/shared/widgets/marvel_loading.dart';
import 'package:marvel_project/features/shared/widgets/marvel_title.dart';

class CharactersDetailsPage extends StatefulWidget {
  final int id;

  const CharactersDetailsPage({
    required this.id,
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
    controller.getCharacterDetails(Modular.args.data as int);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: const MarvelAppBar(),
        body: Stack(
          children: [
            Expanded(
              child: Image.asset(
                ImagesPaths.detailsBackground,
                fit: BoxFit.fitHeight,
                height: MediaQuery.of(context).size.height,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.5),
            ),
            Observer(
              builder: (c) {
                if (controller.characterDetails == null) {
                  return MarvelLoading(vsync: this);
                } else {
                  var item = controller.characterDetails!;
                  return SingleChildScrollView(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                item.imgUrl,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          const Divider(),
                          MarvelTitleWhite(text: item.name),
                          const Divider(
                            height: 5,
                          ),
                          Text(item.description.isEmpty
                              ? 'No description found.'
                              : item.description),
                          const Divider(),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const MarvelTitleBlack(
                                      text:
                                          'Comics which feature this character'),
                                  const Divider(),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: item.comicsNames.length,
                                      itemBuilder: (c, i) {
                                        var comicName = item.comicsNames[i];
                                        return Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Icon(Icons.arrow_right_alt),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Flexible(
                                              child: Text(
                                                comicName,
                                                style: const TextStyle(
                                                    height: 1.25,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
