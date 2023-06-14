part of 'characters_bloc.dart';

@immutable
abstract class CharactersEvent {}

class CharactersFetchEvent extends CharactersEvent {
  CharactersFetchEvent();
}
