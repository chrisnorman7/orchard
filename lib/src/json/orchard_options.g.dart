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
    );

Map<String, dynamic> _$OrchardOptionsToJson(OrchardOptions instance) =>
    <String, dynamic>{
      'plants': instance.plants,
    };
