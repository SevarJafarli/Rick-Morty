import 'package:rick_and_morty_app/model/response/get_all_characters_response.dart';
import 'package:rick_and_morty_app/utils/extensions/string_extensions.dart';

extension ParseToString on CharacterStatus {
  String toShortString() {
    return toString().split('.').last.capitalize();
  }
}
