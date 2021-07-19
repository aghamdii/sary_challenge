import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sary_challenge/core/style/style.dart';
import 'package:sary_challenge/core/utils/utils.dart';
import 'package:sary_challenge/features/manage_heros/presentation/providers/providers.dart';
import 'features/manage_heros/presentation/screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Wrap the providers to the root to be able to access it through the whole widget tree
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HeroesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TypesProvider(),
        )
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              // To initialize the SizeConfig singlton
              SizeConfig().init(constraints, orientation);
              return MaterialApp(
                theme: ThemeData(
                  primaryColor: AppColors.primaryColor,
                  accentColor: AppColors.secondaryColor,
                ),
                onGenerateRoute: Routes.generateRoute,
                initialRoute: AllHeroesScreen.route,
              );
            },
          );
        },
      ),
    );
  }
}
