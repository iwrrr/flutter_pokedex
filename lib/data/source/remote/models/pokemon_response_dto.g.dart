// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonResponseDto _$PokemonResponseDtoFromJson(Map<String, dynamic> json) =>
    PokemonResponseDto(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => PokemonItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonResponseDtoToJson(PokemonResponseDto instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
