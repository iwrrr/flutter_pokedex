part of 'pokemon_bloc.dart';

enum PokemonStateStatus {
  initial,
  loading,
  loadSuccess,
  loadFailure,
  loadingMore,
  loadMoreSuccess,
  loadMoreFailure,
}

class PokemonState {
  final PokemonStateStatus status;
  final List<Pokemon> items;
  final int selectedItemIndex;
  final int page;
  final Exception? error;
  final bool canLoadMore;

  Pokemon get selectedItem => items[selectedItemIndex];

  const PokemonState._({
    this.status = PokemonStateStatus.initial,
    this.items = const [],
    this.selectedItemIndex = 0,
    this.page = 0,
    this.canLoadMore = true,
    this.error,
  });

  const PokemonState.initial() : this._();

  PokemonState asLoading() {
    return copyWith(
      status: PokemonStateStatus.loading,
    );
  }

  PokemonState asLoadSuccess(List<Pokemon> items, {bool canLoadMore = true}) {
    return copyWith(
      status: PokemonStateStatus.loadSuccess,
      items: items,
      page: 0,
      canLoadMore: canLoadMore,
    );
  }

  PokemonState asLoadFailure(Exception e) {
    return copyWith(
      status: PokemonStateStatus.loadFailure,
      error: e,
    );
  }

  PokemonState asLoadingMore() {
    return copyWith(status: PokemonStateStatus.loadingMore);
  }

  PokemonState asLoadMoreSuccess(List<Pokemon> newItems, {bool canLoadMore = true}) {
    return copyWith(
      status: PokemonStateStatus.loadMoreSuccess,
      items: [...items, ...newItems],
      page: canLoadMore ? page + 1 : page,
      canLoadMore: canLoadMore,
    );
  }

  PokemonState asLoadMoreFailure(Exception e) {
    return copyWith(
      status: PokemonStateStatus.loadMoreFailure,
      error: e,
    );
  }

  PokemonState copyWith({
    PokemonStateStatus? status,
    List<Pokemon>? items,
    int? selectedPokemonIndex,
    int? page,
    bool? canLoadMore,
    Exception? error,
  }) {
    return PokemonState._(
      status: status ?? this.status,
      items: items ?? this.items,
      selectedItemIndex: selectedItemIndex,
      page: page ?? this.page,
      canLoadMore: canLoadMore ?? this.canLoadMore,
      error: error ?? this.error,
    );
  }
}