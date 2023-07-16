import 'package:get_it/get_it.dart';
import 'package:pokedex/data/source/local/local_datasource.dart';
import 'package:pokedex/data/source/local/model/pokemon_hive_model.dart';
import 'package:pokedex/data/source/mappers/dto_to_entity_mapper.dart';
import 'package:pokedex/data/source/remote/pokemon_datasource.dart';

abstract class PokemonRepository {
  Future<List<PokemonHiveModel>> getPokemons({required int page});
}

class PokemonRepositoryImpl extends PokemonRepository {
  PokemonRepositoryImpl(this.pokemonDataSource, this.localDataSource);

  final PokemonDataSource pokemonDataSource;
  final LocalDataSource localDataSource;

  @override
  Future<List<PokemonHiveModel>> getPokemons({required int page}) async {
    final cachedData = await localDataSource.getPokemons(page: page);
    print("PAGE REPO: $page CACHED: $cachedData");

    if (cachedData.isEmpty) {
      final pokemonDtoModels = await pokemonDataSource.getPokemons(page);
      final pokemonHiveModels = pokemonDtoModels.map((pokemonDto) => pokemonDto.toHiveModel(page));
      print("PAGE REPO: $page REMOTE: ${pokemonDtoModels.first.name}");

      await localDataSource.savePokemons(pokemonHiveModels);
    }

    final pokemonHiveModels = await localDataSource.getPokemons(page: page);

    return pokemonHiveModels;
  }
}