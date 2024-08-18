import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:orchard/src/json/orchard_options.dart';
import 'package:orchard/src/json/orchard_plant.dart';
import 'package:orchard/src/orchard_plant_state.dart';
import 'package:path/path.dart' as path;
import 'package:text_game_ui/text_game_ui.dart';

Future<void> main(final List<String> arguments) async {
  final optionsLoader = GameOptionsLoader(
    filename: path.join(GameOptionsLoader.homeDirectory, '.orchard.json'),
    loadOptions: (final source) {
      if (source == null) {
        return OrchardOptions(plants: []);
      }
      final json = jsonDecode(source);
      return OrchardOptions.fromJson(json);
    },
  );
  final screen = GameScreen.fromLoadedOptions();
  for (final plant in optionsLoader.options.plants) {
    screen.setTile(plant.coordinates, plant.braille);
  }
  final random = Random();
  final t = Timer.periodic(
    const Duration(seconds: 5),
    (final _) {
      final plants = optionsLoader.options.plants;
      if (plants.isEmpty) {
        return;
      }
      final plant = plants[random.nextInt(plants.length)];
      plant.state = switch (plant.state) {
        OrchardPlantState.seed => OrchardPlantState.sapling,
        OrchardPlantState.sapling =>
          random.nextBool() ? OrchardPlantState.stalk : OrchardPlantState.weed,
        OrchardPlantState.stalk => OrchardPlantState.fruit1,
        OrchardPlantState.fruit1 => OrchardPlantState.fruit2,
        OrchardPlantState.fruit2 => OrchardPlantState.fruit2,
        OrchardPlantState.weed => OrchardPlantState.weed,
      };
      screen
        ..setTile(plant.coordinates, plant.braille)
        ..redrawScreen();
    },
  );
  final keyHandler = SimpleKeyHandler.withDefaults(
    screen: screen,
    extraKeys: {
      // Dig up a plant.
      'z': () {
        screen.clearTileAtCursorPosition();
        optionsLoader.options.plants.removeWhere(
          (final plant) => plant.coordinates == screen.cursorPosition,
        );
        return false;
      },
      // Harvest a plant.
      'x': () {
        final plant = optionsLoader.options.getPlantAt(screen.cursorPosition);
        if (plant != null) {
          switch (plant.state) {
            case OrchardPlantState.fruit1:
              optionsLoader.options.fruit++;
              plant.state = OrchardPlantState.stalk;
            case OrchardPlantState.fruit2:
              optionsLoader.options.fruit++;
              plant.state = OrchardPlantState.fruit1;
            case OrchardPlantState.stalk:
              plant.state = OrchardPlantState.sapling;
            default:
            // Do nothing.
          }
          screen
            ..setTileAtCursorPosition(plant.braille)
            ..redrawScreen();
        }
        return false;
      },
      // Plant a new plant.
      'c': () {
        final plant = optionsLoader.options.getPlantAt(screen.cursorPosition);
        if (plant != null) {
          return false;
        }
        final seed = OrchardPlant(
          x: screen.cursorPosition.x,
          y: screen.cursorPosition.y,
        );
        optionsLoader.options.plants.add(seed);
        optionsLoader.options.seeds--;
        screen.setTileAtCursorPosition(seed.braille);
        return false;
      },
    },
  );
  screen.redrawScreen();
  await screen.run(keyHandler.handleKey);
  t.cancel();
  optionsLoader.save();
}
