import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'pokemon_item_dto.g.dart';

@JsonSerializable()
class PokemonItemDto {
  int? page = 0;

  @JsonKey(name: "name")
  final String? name;

  @JsonKey(name: "url")
  final String? url;

  PokemonItemDto({
    this.page,
    this.name,
    this.url,
  });

  factory PokemonItemDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonItemDtoToJson(this);
}
