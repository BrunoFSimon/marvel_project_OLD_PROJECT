import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_project/features/characters/domain/use_cases/get_character_details_by_id.dart';
import 'package:mobx/mobx.dart';

part 'character_details_store.g.dart';

@Injectable()
class CharactersDetailsStore = _CharactersDetailsStoreBase
    with _$CharactersDetailsStore;

abstract class _CharactersDetailsStoreBase with Store {
  final GetCharactersDetailsById useCase;

  _CharactersDetailsStoreBase(this.useCase);
}
