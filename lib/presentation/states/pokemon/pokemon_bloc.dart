import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/domain/models/pokemon.dart';
import 'package:pokedex/domain/usecases/pokemon_usecases.dart';
import 'package:stream_transform/stream_transform.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  static const int itemsPerPage = 20;

  final GetPokemonsUseCase _getPokemonsUseCase;

  PokemonBloc(this._getPokemonsUseCase) : super(const PokemonState.initial()) {
    on<PokemonLoadStarted>(
      _onLoadStarted,
      transformer: (events, mapper) => events.switchMap(mapper)
    );
    on<PokemonLoadMoreStarted>(
      _onLoadMoreStarted,
      transformer: (events, mapper) => events.switchMap(mapper),
    );
  }

  void _onLoadStarted(PokemonLoadStarted event, Emitter<PokemonState> emit) async {
    try {
      emit(state.asLoading());

      final items = state.items + await _getPokemonsUseCase.call(1);

      final canLoadMore = items.length >= itemsPerPage;
      print("CAN LOAD MORE: $canLoadMore");

      emit(state.asLoadSuccess(items, canLoadMore: canLoadMore));
    } on Exception catch (e) {
      emit(state.asLoadFailure(e));
    }
  }

  void _onLoadMoreStarted(PokemonLoadMoreStarted event, Emitter<PokemonState> emit) async {
    try {
      if (!state.canLoadMore) return;
      print("LOAD MORE: ${state.canLoadMore} ${state.page + 1}");

      emit(state.asLoadingMore());

      final pokemons = state.items + await _getPokemonsUseCase.call(state.page + 1);

      final canLoadMore = pokemons.length >= itemsPerPage;
      print("CAN LOAD MORE 2: $canLoadMore TOTAL: ${pokemons.length} PER PAGE: $itemsPerPage");

      emit(state.asLoadMoreSuccess(pokemons, canLoadMore: canLoadMore));
    } on Exception catch (e) {
      emit(state.asLoadMoreFailure(e));
    }
  }
}
