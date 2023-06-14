import 'package:rick_and_morty_app/model/response/character_model.dart';

class GetAllCharactersResponse {
  final Info? info;
  final List<CharacterModel>? results;

  GetAllCharactersResponse({
    this.info,
    this.results,
  });

  factory GetAllCharactersResponse.fromJson(Map<String, dynamic> json) => GetAllCharactersResponse(
        info: json["info"] == null ? null : Info.fromJson(json["info"]),
        results: json["results"] == null ? [] : List<CharacterModel>.from(json["results"]!.map((x) => CharacterModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info?.toJson(),
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Info {
  final int? count;
  final int? pages;
  final String? next;
  final dynamic prev;

  Info({
    this.count,
    this.pages,
    this.next,
    this.prev,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
      };
}

enum CharacterGender { male, female, unknown }

final genderValues = EnumValues({"Female": CharacterGender.female, "Male": CharacterGender.male, "unknown": CharacterGender.unknown});

class CharacterLocationModel {
  final String? name;
  final String? url;

  CharacterLocationModel({
    this.name,
    this.url,
  });

  factory CharacterLocationModel.fromJson(Map<String, dynamic> json) => CharacterLocationModel(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

enum CharacterStatus { alive, unknown, dead }

final statusValues = EnumValues({"Alive": CharacterStatus.alive, "Dead": CharacterStatus.dead, "unknown": CharacterStatus.unknown});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
