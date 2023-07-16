import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/routes.dart';

class PokedexApp extends StatelessWidget {
  const PokedexApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Pokedex',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: AppNavigator.initialRoutes,
      getPages: AppNavigator.generateRoutes(),
      // navigatorKey: AppNavigator.navigatorKey,
      // onGenerateRoute: AppNavigator.onGenerateRoute,
    );
  }
}
