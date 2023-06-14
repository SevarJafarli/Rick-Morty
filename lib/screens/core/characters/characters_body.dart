import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/bloc/bloc/characters_bloc.dart';
import 'package:rick_and_morty_app/model/response/character_model.dart';
import 'package:rick_and_morty_app/widgets/card/character_card.dart';
import 'package:rick_and_morty_app/widgets/loading_view.dart';

class CharactersBody extends StatefulWidget {
  const CharactersBody({super.key});

  @override
  State<CharactersBody> createState() => _CharactersBodyState();
}

class _CharactersBodyState extends State<CharactersBody> {
  final List<CharacterModel> characters = [];
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CharactersBloc, CharactersState>(builder: (context, charactersState) {
      if (charactersState is CharactersInitialState || charactersState is CharactersLoadingState && characters.isEmpty) {
        return const Center(child: LoadingView());
      } else if (charactersState is CharactersSuccessState) {
        characters.addAll(charactersState.characters);
        BlocProvider.of<CharactersBloc>(context).isFetching = false;
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      } else if (charactersState is CharactersErrorState && characters.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  BlocProvider.of<CharactersBloc>(context)
                    ..isFetching = true
                    ..add(CharactersFetchEvent());
                },
                icon: Icon(Icons.refresh, color: Theme.of(context).progressIndicatorTheme.color!, size: 30),
              ),
              const SizedBox(height: 8),
              Text(
                charactersState.error,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        );
      }
      return ListView.separated(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 24),
        controller: _scrollController
          ..addListener(() {
            if (_scrollController.offset == _scrollController.position.maxScrollExtent && !BlocProvider.of<CharactersBloc>(context).isFetching) {
              BlocProvider.of<CharactersBloc>(context)
                ..isFetching = true
                ..add(CharactersFetchEvent());
            }
          }),
        itemBuilder: (context, index) {
          if (charactersState is CharactersLoadingState && index == characters.length) {
            return const SizedBox(width: 50, height: 50, child: Center(child: LoadingView()));
          } else {
            return CharacterCard(
              characterModel: characters[index],
            );
          }
        },
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemCount: charactersState is CharactersLoadingState ? characters.length + 1 : characters.length,
      );
    }, listener: (context, charactersState) {
      if (charactersState is CharactersSuccessState && charactersState.characters.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No more characters'),
            duration: Duration(milliseconds: 1000),
          ),
        );
      } else if (charactersState is CharactersErrorState) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(charactersState.error),
            duration: const Duration(milliseconds: 1000),
          ),
        );
        BlocProvider.of<CharactersBloc>(context).isFetching = false;
      }
      return;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
