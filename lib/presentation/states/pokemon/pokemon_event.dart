part of 'pokemon_bloc.dart';

abstract class PokemonEvent {
  const PokemonEvent();
}

class PokemonLoadStarted extends PokemonEvent {
  final bool loadAll;

  const PokemonLoadStarted({this.loadAll = false});
}

class PokemonLoadMoreStarted extends PokemonEvent {}

class PokemonSelectChanged extends PokemonEvent {
  final String itemId;

  const PokemonSelectChanged({required this.itemId});
}
