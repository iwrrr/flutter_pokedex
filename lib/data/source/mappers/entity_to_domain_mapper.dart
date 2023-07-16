import 'package:pokedex/data/source/local/model/pokemon_hive_model.dart';
import 'package:pokedex/domain/models/pokemon.dart';

extension PokemonHiveModelToDomainX on PokemonHiveModel {
  Pokemon toDomain() => Pokemon(
      page: page,
      name: name,
      url: url,
  );
}