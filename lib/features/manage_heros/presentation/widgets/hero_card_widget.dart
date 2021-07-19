import 'package:flutter/material.dart';
import 'package:sary_challenge/core/style/style.dart';
import 'package:sary_challenge/core/utils/utils.dart';
import 'package:sary_challenge/features/manage_heros/data/models/models.dart';
import 'package:sary_challenge/features/manage_heros/presentation/screens/hero_profile_screen.dart';
import 'package:sary_challenge/features/manage_heros/presentation/widgets/widgets.dart';

// Widget used to display hero's info in a list

class HeroCardWidget extends StatelessWidget {
  final HeroModel hero;

  HeroCardWidget({@required this.hero});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, HeroProfileScreen.route, arguments: hero);
      },
      child: Card(
        elevation: 2,
        child: Container(
          padding: EdgeInsets.all(
            SizeConfig.heightMultiplier * 1,
          ),
          height: SizeConfig.heightMultiplier * 25,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 0,
                      child: Hero(
                        tag: hero.id,
                        child: CircleAvatar(
                          radius: SizeConfig.imageSizeMultiplier * 13,
                          backgroundImage: NetworkImage(hero.picUrl),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 4,
                    ),
                    Expanded(
                      child: Text(
                        hero.name,
                        style: TextStyle(
                          fontSize: SizeConfig.textMultiplier * 2.2,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 0,
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: SizeConfig.heightMultiplier * 5,
                        child: ListView.builder(
                          itemCount: hero.powers.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return PowerTagWidget(
                              power: hero.powers[index],
                            );
                          },
                        ),
                      ),
                      StarsCounterWidget(rating: hero.rating),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
