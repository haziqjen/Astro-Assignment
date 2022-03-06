import 'package:astro_assignment_project/presentation/router/route_names.dart';
import 'package:flutter/material.dart';
import '../screens/screens.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {

    print('xx Route: ${settings.name}');

    switch (settings.name) {
      case InitialScreen.routeName:
        return InitialScreen.route();

      case MainMenuScreen.routeName:
        return MainMenuScreen.route();

      case HomeScreen.routeName:
        return HomeScreen.route(isFood: settings.arguments as bool);

      case DetailScreen.routeName:
        List<dynamic> args = settings.arguments as List<dynamic>;
        return DetailScreen.route(menuId: args[0] as String, isFood: args[1] as bool);

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: RouteName.ERROR_SCREEN),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something went wrong!'),
        ),
      ),
    );
  }
}
