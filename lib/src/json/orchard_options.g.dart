// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orchard_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrchardOptions _$OrchardOptionsFromJson(Map<String, dynamic> json) =>
    OrchardOptions(
      plants: (json['plants'] as List<dynamic>)
          .map((e) => OrchardPlant.fromJson(e as Map<String, dynamic>))
          .toList(),
      seeds: (json['seeds'] as num?)?.toInt() ?? 50,
      fruit: (json['fruit'] as num?)?.toInt() ?? 0,
      gold: (json['gold'] as num?)?.toInt() ?? 50,
    );

Map<String, dynamic> _$OrchardOptionsToJson(OrchardOptions instance) =>
    <String, dynamic>{
      'plants': instance.plants,
      'seeds': instance.seeds,
      'fruit': instance.fruit,
      'gold': instance.gold,
    };
