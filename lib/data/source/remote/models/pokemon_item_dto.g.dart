// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonItemDto _$PokemonItemDtoFromJson(Map<String, dynamic> json) =>
    PokemonItemDto(
      page: json['page'] as int?,
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$PokemonItemDtoToJson(PokemonItemDto instance) =>
    <String, dynamic>{
      'page': instance.page,
      'name': instance.name,
      'url': instance.url,
    };
