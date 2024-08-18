import 'json/orchard_plant.dart';

/// The possible states for [OrchardPlant]s.
enum OrchardPlantState {
  /// Just planted.
  seed,

  /// Starting to grow.
  sapling,

  /// Full stalk.
  stalk,

  /// Plant has one fruit.
  fruit1,

  /// Plant has two fruits.
  fruit2,

  /// Plant has turned into a wee.
  weed,
}
