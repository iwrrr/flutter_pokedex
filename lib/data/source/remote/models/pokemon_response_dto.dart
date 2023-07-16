import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/data/source/remote/models/pokemon_item_dto.dart';

part 'pokemon_response_dto.g.dart';

@JsonSerializable()
class PokemonResponseDto {
    @JsonKey(name:"count")
    final int? count;
    @JsonKey(name:"next")
    final String? next;
    @JsonKey(name:"previous")
    final String? previous;
    @JsonKey(name:"results")
    final List<PokemonItemDto>? results;

    PokemonResponseDto({
        this.count,
        this.next,
        this.previous,
        this.results,
    });

    factory PokemonResponseDto.fromJson(Map<String, dynamic> json) => _$PokemonResponseDtoFromJson(json);

    Map<String, dynamic> toJson() => _$PokemonResponseDtoToJson(this);
}
