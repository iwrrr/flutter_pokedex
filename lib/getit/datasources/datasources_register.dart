import 'package:get_it/get_it.dart';
import 'package:pokedex/core/network.dart';
import 'package:pokedex/data/source/local/local_datasource.dart';
import 'package:pokedex/data/source/remote/pokemon_datasource.dart';
import 'package:pokedex/getit/getit.dart';

class DataSourceRegister extends IGetItRegister {
  
  @override
  void register() {
    GetIt getIt = GetIt.instance;

    if (!GetIt.I.isRegistered<PokemonDataSource>()) {
      getIt.registerSingleton(PokemonDataSource(NetworkManager()));
    }

    if (!GetIt.I.isRegistered<LocalDataSource>()) {
      getIt.registerSingleton(LocalDataSource());
    }
  }
}
