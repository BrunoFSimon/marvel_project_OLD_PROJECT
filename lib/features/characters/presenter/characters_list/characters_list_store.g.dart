// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CharactersListStore on _CharactersListStoreBase, Store {
  final _$charactersAtom = Atom(name: '_CharactersListStoreBase.characters');

  @override
  ObservableList<Character> get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(ObservableList<Character> value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
    });
  }

  final _$getMoreCharactersAsyncAction =
      AsyncAction('_CharactersListStoreBase.getMoreCharacters');

  @override
  Future<void> getMoreCharacters() {
    return _$getMoreCharactersAsyncAction.run(() => super.getMoreCharacters());
  }

  @override
  String toString() {
    return '''
characters: ${characters}
    ''';
  }
}
