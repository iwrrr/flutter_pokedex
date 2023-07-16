import 'package:pokedex/data/source/local/model/pokemon_hive_model.dart';
import 'package:pokedex/data/source/remote/models/pokemon_item_dto.dart';

extension PokemonItemDtoToLocalX on PokemonItemDto {
  PokemonHiveModel toHiveModel(int page) => PokemonHiveModel()
    ..page = page
    ..name = name?.trim() ?? ""
    ..url = url?.trim() ?? "";
}