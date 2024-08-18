// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orchard_plant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrchardPlant _$OrchardPlantFromJson(Map<String, dynamic> json) => OrchardPlant(
      x: (json['x'] as num).toInt(),
      y: (json['y'] as num).toInt(),
      state: $enumDecodeNullable(_$OrchardPlantStateEnumMap, json['state']) ??
          OrchardPlantState.seed,
    );

Map<String, dynamic> _$OrchardPlantToJson(OrchardPlant instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'state': _$OrchardPlantStateEnumMap[instance.state]!,
    };

const _$OrchardPlantStateEnumMap = {
  OrchardPlantState.seed: 'seed',
  OrchardPlantState.sapling: 'sapling',
  OrchardPlantState.stalk: 'stalk',
  OrchardPlantState.fruit1: 'fruit1',
  OrchardPlantState.fruit2: 'fruit2',
  OrchardPlantState.weed: 'weed',
};
