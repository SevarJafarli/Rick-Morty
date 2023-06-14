import 'package:rick_and_morty_app/model/response/get_all_characters_response.dart';

class CharacterModel {
  final int? id;
  final String? name;
  final CharacterStatus? status;
  final String? species;
  final String? type;
  final CharacterGender? gender;
  final CharacterLocationModel? origin;
  final CharacterLocationModel? location;
  final String? image;
  final List<String>? episode;
  final String? url;
  final DateTime? created;

  CharacterModel({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        id: json["id"],
        name: json["name"],
        status: statusValues.map[json["status"]]!,
        species: json["species"],
        type: json["type"],
        gender: genderValues.map[json["gender"]]!,
        origin: json["origin"] == null ? null : CharacterLocationModel.fromJson(json["origin"]),
        location: json["location"] == null ? null : CharacterLocationModel.fromJson(json["location"]),
        image: json["image"],
        episode: json["episode"] == null ? [] : List<String>.from(json["episode"]!.map((x) => x)),
        url: json["url"],
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": statusValues.reverse[status],
        "species": species,
        "type": type,
        "gender": genderValues.reverse[gender],
        "origin": origin?.toJson(),
        "location": location?.toJson(),
        "image": image,
        "episode": episode == null ? [] : List<dynamic>.from(episode!.map((x) => x)),
        "url": url,
        "created": created?.toIso8601String(),
      };
}
