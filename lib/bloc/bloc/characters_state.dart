part of 'characters_bloc.dart';

@immutable
abstract class CharactersState {}

class CharactersInitialState extends CharactersState {}

class CharactersLoadingState extends CharactersState {
  final String message;

  CharactersLoadingState({
    required this.message,
  });
}

class CharactersSuccessState extends CharactersState {
  final List<CharacterModel> characters;
  CharactersSuccessState({required this.characters});
}

class CharactersErrorState extends CharactersState {
  final String error;

  CharactersErrorState({
    required this.error,
  });
}
