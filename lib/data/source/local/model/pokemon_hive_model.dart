import 'package:hive/hive.dart';

part 'pokemon_hive_model.g.dart';

@HiveType(typeId: 1)
class PokemonHiveModel extends HiveObject {
  static const String boxKey = "pokemon";

  @HiveField(0)
  int page = 1;

  @HiveField(1)
  String name = "";

  @HiveField(2)
  String url = "";
}
