import 'package:flutter/material.dart';
import 'package:sary_challenge/features/manage_heros/presentation/screens/screens.dart';

class Routes {
  // This function is used to generate routes and build new screens
  // When navigating through the app use Navigator.pushNamed and pass the route static variable
  // You can pass props using "arguments" parameter
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Data passed to the route
    final props = settings.arguments;

    switch (settings.name) {
      case AllHeroesScreen.route:
        return MaterialPageRoute(
          builder: (context) => AllHeroesScreen(),
        );
      case HeroProfileScreen.route:
        return MaterialPageRoute(
          builder: (context) => HeroProfileScreen(hero: props),
        );

      // If an error occures, direct the user to AllHeroesScreen
      default:
        return MaterialPageRoute(
          builder: (context) => AllHeroesScreen(),
        );
    }
  }
}
