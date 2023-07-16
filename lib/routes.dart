import 'package:get/get.dart';
import 'package:pokedex/presentation/screens/home/home_page.dart';
import 'package:pokedex/presentation/screens/second_page.dart';
import 'package:pokedex/presentation/screens/third_page.dart';

enum Routes {
  home,
  catched,
  pokemonInfo,
}

class _Paths {
  static const String home = '/home';
  static const String catched = '/home/catched';
  static const String pokemonInfo = '/home/pokemon';

  static const Map<Routes, String> _pathMap = {
    Routes.home: _Paths.home,
    Routes.catched: _Paths.catched,
    Routes.pokemonInfo: _Paths.pokemonInfo,
  };

  static String of(Routes route) => _pathMap[route] ?? home;
}

class AppNavigator {
  static String initialRoutes = _Paths.home;

  static List<GetPage<dynamic>> generateRoutes() {
    return [
      GetPage(
          name: _Paths.home,
          page: () => const HomePage(),
          transition: Transition.cupertino
      ),
      GetPage(
          name: _Paths.catched,
          page: () => const SecondPage(),
          transition: Transition.cupertino
      ),
      GetPage(
          name: _Paths.pokemonInfo,
          page: () => const ThirdPage(),
          transition: Transition.cupertino
      ),
    ];
  }

  static Future? push<T>(Routes route, {dynamic arguments}) =>
      Get.toNamed<T>(_Paths.of(route), arguments: arguments);

  static pop<T>({T? result}) => Get.back(result: result);

  static popTo<T>(Routes route) => Get.offAllNamed(_Paths.of(route));
}
