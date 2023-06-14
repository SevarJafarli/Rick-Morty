import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/model/response/get_all_characters_response.dart';
import 'package:rick_and_morty_app/repository/base_repository.dart';

class CharactersRepository extends BaseRepository {
  Future<GetAllCharactersResponse?> fetchCharacters({
    required int page,
  }) async {
    GetAllCharactersResponse? response;
    try {
      var res = await dio.get(
        'https://rickandmortyapi.com/api/character/?page=$page',
      );
      response = GetAllCharactersResponse.fromJson(res.data);
    } catch (e) {
      debugPrint(e.toString());
      // return e.toString();
    }
    return response;
  }
}
