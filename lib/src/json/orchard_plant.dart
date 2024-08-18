import 'dart:math';

import 'package:json_annotation/json_annotation.dart';
import 'package:text_game_ui/text_game_ui.dart';

import '../orchard_plant_state.dart';

part 'orchard_plant.g.dart';

/// A plant which is growing in an orchard.
@JsonSerializable()
class OrchardPlant {
  /// Create an instance.
  OrchardPlant({
    required this.x,
    required this.y,
    this.state = OrchardPlantState.seed,
  });

  /// Create an instance from a JSON object.
  factory OrchardPlant.fromJson(final Map<String, dynamic> json) =>
      _$OrchardPlantFromJson(json);

  /// The x coordinate of this plant.
  final int x;

  /// The y coordinate of this plant.
  final int y;

  /// Get the coordinates of this plant.
  CursorPosition get coordinates => Point(x, y);

  /// The current stage of this plant.
  OrchardPlantState state;

  /// Return [state] as a braille character.
  String get braille => switch (state) {
        OrchardPlantState.seed => '⠄',
        OrchardPlantState.sapling => '⠆',
        OrchardPlantState.stalk => '⠇',
        OrchardPlantState.fruit1 => '⠗',
        OrchardPlantState.fruit2 => '⠟',
        OrchardPlantState.weed => '⠞',
      };

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$OrchardPlantToJson(this);
}
