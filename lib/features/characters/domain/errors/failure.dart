class Failure implements Exception {}

class InvalidCharactersRange extends Failure {}

class CharactersAPIFailure extends Failure {}

class DataSourceFail extends Failure {
  final Exception exception;
  DataSourceFail(this.exception);
}

class CharactersRepositoryFailure extends Failure {
  CharactersRepositoryFailure(Exception e);
}

class InvalidCharacterIdFailure extends Failure {}
