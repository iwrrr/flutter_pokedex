import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/app.dart';
import 'package:pokedex/core/network.dart';
import 'package:pokedex/data/source/local/local_datasource.dart';
import 'package:pokedex/data/source/remote/pokemon_datasource.dart';
import 'package:pokedex/domain/usecases/pokemon_usecases.dart';
import 'package:pokedex/presentation/states/pokemon/pokemon_bloc.dart';

import 'data/repositories/pokemon_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDataSource.initialize();

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<NetworkManager>(
            create: (context) => NetworkManager()
        ),
        RepositoryProvider<LocalDataSource>(
            create: (context) => LocalDataSource()
        ),
        RepositoryProvider<PokemonDataSource>(
            create: (context) => PokemonDataSource(context.read<NetworkManager>())
        ),
        RepositoryProvider<PokemonRepository>(
            create: (context) => PokemonRepositoryImpl(
                context.read<PokemonDataSource>(),
                context.read<LocalDataSource>()
            )
        ),
        RepositoryProvider<GetPokemonsUseCase>(
            create: (context) => GetPokemonsUseCase(context.read<PokemonRepository>())
        ),
      ],
      child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => PokemonBloc(context.read<GetPokemonsUseCase>())),
          ],
          child: const PokedexApp()
      )
    )
  );
}
