import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_project/features/characters/domain/entities/character_details.dart';
import 'package:marvel_project/features/characters/domain/use_cases/get_character_details_by_id.dart';
import 'package:mobx/mobx.dart';

part 'character_details_store.g.dart';

@Injectable()
class CharactersDetailsStore = _CharactersDetailsStoreBase
    with _$CharactersDetailsStore;

abstract class _CharactersDetailsStoreBase with Store {
  final GetCharactersDetailsById useCase;

  @observable
  CharacterDetails? characterDetails;

  _CharactersDetailsStoreBase(this.useCase);

  Future<void> getCharacterDetails(int id) async {
    var result = await useCase(id);
    result.fold(
      (l) => null,
      (r) => characterDetails = r,
    );
  }
}
