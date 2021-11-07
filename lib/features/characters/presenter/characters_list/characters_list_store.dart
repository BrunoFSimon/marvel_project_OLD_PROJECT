import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_project/features/characters/domain/entities/character.dart';
import 'package:marvel_project/features/characters/domain/use_cases/get_characters_by_range.dart';
import 'package:mobx/mobx.dart';

part 'characters_list_store.g.dart';

@Injectable()
class CharactersListStore = _CharactersListStoreBase with _$CharactersListStore;

abstract class _CharactersListStoreBase with Store {
  final GetCharactersByRange useCase;
  final int take = 50;

  @observable
  ObservableList<Character> characters = <Character>[].asObservable();

  _CharactersListStoreBase(this.useCase) {
    getMoreCharacters();
  }

  @action
  Future<void> getMoreCharacters() async {
    var result = await useCase.call(characters.length, take);

    result.fold(
      (l) => throw Exception(),
      (r) => characters.addAll(r),
    );
  }
}
