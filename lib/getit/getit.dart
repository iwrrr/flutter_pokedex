import 'package:pokedex/getit/datasources/datasources_register.dart';
import 'package:pokedex/getit/repositories/repositories_register.dart';
import 'package:pokedex/getit/usecases/usecases_register.dart';

abstract class IGetItRegister {
  void register();
}

class GetItRegister {
  static register() {
    DataSourceRegister().register();
    RepositoryRegister().register();
    UseCaseRegister().register();
  }
}
