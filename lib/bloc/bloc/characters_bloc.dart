import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_app/model/response/character_model.dart';
import 'package:rick_and_morty_app/repository/characters_repository.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final CharactersRepository charactersRepository;
  int page = 1;
  bool isFetching = false;
  CharactersBloc({required this.charactersRepository}) : super(CharactersInitialState()) {
    on<CharactersFetchEvent>(_fetchCharacters);
  }

  Future<void> _fetchCharacters(CharactersFetchEvent event, Emitter<CharactersState> emit) async {
    emit(CharactersLoadingState(message: "Loading..."));
    final response = await charactersRepository.fetchCharacters(page: page);
    print(page);
    if (response != null) {
      if (response.info != null) {
        if (response.info!.pages! > page) {
          emit(CharactersSuccessState(characters: response.results!));
          page++;
        }
      } else {
        emit(CharactersErrorState(error: "An error occured"));
      }
    } else {
      emit(CharactersErrorState(error: "An error occured"));
    }
  }
}
