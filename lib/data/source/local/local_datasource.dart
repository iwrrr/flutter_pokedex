import 'dart:math';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokedex/data/source/local/model/pokemon_hive_model.dart';

class LocalDataSource {

  static Future<void> initialize() async {
    await Hive.initFlutter();

    Hive.registerAdapter(PokemonHiveModelAdapter());

    await Hive.openBox<PokemonHiveModel>(PokemonHiveModel.boxKey);
  }

  Future<bool> hasData() async {
    final pokemonBox = Hive.box<PokemonHiveModel>(PokemonHiveModel.boxKey);

    return pokemonBox.length > 0;
  }

  Future<void> savePokemons(Iterable<PokemonHiveModel> pokemons) async {
    final pokemonBox = Hive.box<PokemonHiveModel>(PokemonHiveModel.boxKey);

    final pokemonsMap = {for (var pokemon in pokemons) pokemon.name: pokemon};

    await pokemonBox.clear();
    await pokemonBox.putAll(pokemonsMap);
  }

  Future<List<PokemonHiveModel>> getPokemons({required int page}) async {
    final pokemonBox = Hive.box<PokemonHiveModel>(PokemonHiveModel.boxKey);

    final pokemons = pokemonBox.values
      .where((pokemon) => pokemon.page == page)
      .toList();

    return pokemons;
  }
}
