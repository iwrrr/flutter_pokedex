import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/configs/images.dart';
import 'package:pokedex/presentation/screens/home/pokemon_card.dart';
import 'package:pokedex/presentation/states/pokemon/pokemon_bloc.dart';
import 'package:pokedex/presentation/states/pokemon/pokemon_selector.dart';
import 'package:pokedex/presentation/widgets/pokeball_background.dart';
import 'package:pokedex/presentation/widgets/pokemon_refresh_control.dart';

import '../../widgets/main_app_bar.dart';

part 'pokemons_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const PokeballBackground(
      child: Stack(
        children: [
          _PokemonGrid(),
        ],
      ),
    );
  }
}