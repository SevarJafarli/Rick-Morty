import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/bloc/bloc/characters_bloc.dart';
import 'package:rick_and_morty_app/repository/characters_repository.dart';
import 'package:rick_and_morty_app/screens/core/characters/characters_body.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CharactersBloc>(
          create: (context) => CharactersBloc(
            charactersRepository: CharactersRepository(),
          )..add(
              CharactersFetchEvent(),
            ),
        ),
      ],
      child: const CharactersBody(),
    );
  }
}
