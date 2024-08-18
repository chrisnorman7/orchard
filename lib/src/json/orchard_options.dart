import 'package:json_annotation/json_annotation.dart';
import 'package:text_game_ui/text_game_ui.dart';

import 'orchard_plant.dart';

part 'orchard_options.g.dart';

/// Options for the game.
@JsonSerializable()
class OrchardOptions {
  /// Create an instance.
  OrchardOptions({
    required this.plants,
    this.seeds = 50,
    this.fruit = 0,
    this.gold = 50,
  });

  /// Create an instance from a JSON object.
  factory OrchardOptions.fromJson(final Map<String, dynamic> json) =>
      _$OrchardOptionsFromJson(json);

  /// The plants which have been planted.
  final List<OrchardPlant> plants;

  /// How many seeds have been collected.
  int seeds;

  /// How many fruit have been collected.
  int fruit;

  /// How much gold has been collected.
  int gold;

  /// Get the plant at [coordinates].
  OrchardPlant? getPlantAt(final CursorPosition coordinates) {
    try {
      return plants
          .firstWhere((final plant) => plant.coordinates == coordinates);
      // ignore: avoid_catching_errors
    } on StateError {
      return null;
    }
  }

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$OrchardOptionsToJson(this);
}
