import 'package:flutter/material.dart';
import 'package:sary_challenge/core/style/style.dart';
import 'package:sary_challenge/core/widgets/widgets.dart';
import 'package:sary_challenge/features/manage_heros/data/models/models.dart';
import 'package:sary_challenge/features/manage_heros/presentation/widgets/widgets.dart';

// This screen is used to show the details of a hero

class HeroProfileScreen extends StatefulWidget {
  static const String route = "/hero_profile_screen";
  // HeroModel passed from the AllHeroesScreen heroes list
  final HeroModel hero;

  HeroProfileScreen({@required this.hero});

  @override
  _HeroProfileScreenState createState() => _HeroProfileScreenState();
}

class _HeroProfileScreenState extends State<HeroProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: TitleTextWidget(
          text: widget.hero.name,
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: AppColors.primaryColor,
        ),
      ),
      body: HeroProfileCardWidget(
        hero: widget.hero,
      ),
    );
  }
}
