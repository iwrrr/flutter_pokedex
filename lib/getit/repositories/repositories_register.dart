import 'package:get_it/get_it.dart';
import 'package:pokedex/data/repositories/pokemon_repository.dart';
import 'package:pokedex/data/source/local/local_datasource.dart';
import 'package:pokedex/data/source/remote/pokemon_datasource.dart';
import 'package:pokedex/getit/getit.dart';

class RepositoryRegister extends IGetItRegister {
  
  @override
  void register() {
    GetIt getIt = GetIt.instance;

    // if (!GetIt.I.isRegistered<PokemonRepository>()) {
    //   getIt.registerSingleton(PokemonRepositoryImpl());
    // }
  }
}
