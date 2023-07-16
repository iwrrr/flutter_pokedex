import 'package:get_it/get_it.dart';
import 'package:pokedex/domain/usecases/pokemon_usecases.dart';
import 'package:pokedex/getit/getit.dart';

class UseCaseRegister extends IGetItRegister {
  
  @override
  void register() {
    GetIt getIt = GetIt.instance;

    // if (!GetIt.I.isRegistered<GetPokemonsUseCase>()) {
    //   getIt.registerSingleton(GetPokemonsUseCase());
    // }
  }
}
