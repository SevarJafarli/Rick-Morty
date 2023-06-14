import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/model/response/character_model.dart';
import 'package:rick_and_morty_app/model/response/get_all_characters_response.dart';
import 'package:rick_and_morty_app/style/app_colors.dart';
import 'package:rick_and_morty_app/utils/extensions/enum_extension.dart';
import 'package:rick_and_morty_app/utils/extensions/string_extensions.dart';

//todo: add model
class CharacterCard extends StatelessWidget {
  const CharacterCard({super.key, required this.characterModel});
  final CharacterModel characterModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      constraints: const BoxConstraints(
        maxHeight: 167 + 23,
        minHeight: 167 + 23,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).cardColor,
        // color: Colors.red,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
            child: CachedNetworkImage(
              imageUrl: characterModel.image!,
              width: MediaQuery.of(context).size.width * 0.35,
              height: 167,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6 - 24 - 24,
                  child: Text(
                    characterModel.name!,
                    style: Theme.of(context).textTheme.displayMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 6.0),
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: statusColor(characterModel.status!),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Text(
                      characterModel.status!.toShortString(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  characterModel.species.toString().capitalize(),
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                characterModel.location?.name == null
                    ? const SizedBox()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Last known location:",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6 - 24 - 24,
                            child: Text(
                              "${characterModel.location?.name}",
                              style: Theme.of(context).textTheme.bodyMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                const SizedBox(height: 8),
                characterModel.origin?.name == null
                    ? const SizedBox()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "First seen in:",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6 - 24 - 24,
                            child: Text(
                              "${characterModel.origin?.name!.capitalize()}",
                              style: Theme.of(context).textTheme.bodyMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Color statusColor(CharacterStatus status) {
    switch (status) {
      case CharacterStatus.alive:
        return AppColors.green;
      case CharacterStatus.dead:
        return AppColors.red;
      case CharacterStatus.unknown:
        return AppColors.grey;
      default:
        return AppColors.grey;
    }
  }
}
