import 'dart:convert';

import 'package:pokedex/core/network.dart';
import 'package:pokedex/data/source/remote/models/pokemon_item_dto.dart';
import 'package:pokedex/data/source/remote/models/pokemon_response_dto.dart';

class PokemonDataSource {
  final NetworkManager networkManager;

  static int pageSize = 20;

  PokemonDataSource(this.networkManager);

  Future<List<PokemonItemDto>> getPokemons(int page) async {
    print("PAGE DATA: $page ${(page * pageSize).toString()}");
    final response = await networkManager.request(
      RequestMethod.get,
      NetworkConstants.pokemon,
      queryParameters: {
        'page': page == 0 ? 1 : page,
        'limit': pageSize.toString(),
        'offset': (page * pageSize).toString()
      }
    );

    final data = PokemonResponseDto.fromJson(response.data).results!
        .toList();

    return data;
  }

  // Future<PokemonDto> getPokemonByName(String name) async {
  //   final response = await networkManager.request(
  //     RequestMethod.get,
  //     NetworkConstants.pokemon + name
  //   );

  //   final data = json.decode(response.data) as PokemonDto;

  //   return data;
  // }
}