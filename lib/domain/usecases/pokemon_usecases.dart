import 'package:get_it/get_it.dart';
import 'package:pokedex/data/source/mappers/entity_to_domain_mapper.dart';

import '../../core/usecase.dart';
import '../../data/repositories/pokemon_repository.dart';
import '../models/pokemon.dart';

class GetPokemonsUseCase extends UseCase<int, List<Pokemon>> {
  GetPokemonsUseCase(this._repository);

  final PokemonRepository _repository;

  @override
  Future<List<Pokemon>> call(int params) async {
    final pokemons = await _repository.getPokemons(page: params);
    return pokemons.map((e) => e.toDomain()).toList();
  }
}