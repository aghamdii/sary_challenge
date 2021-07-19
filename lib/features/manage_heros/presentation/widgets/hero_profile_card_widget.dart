import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:sary_challenge/core/style/style.dart';
import 'package:sary_challenge/core/utils/utils.dart';
import 'package:sary_challenge/core/widgets/widgets.dart';
import 'package:sary_challenge/features/manage_heros/data/models/models.dart';
import 'package:sary_challenge/features/manage_heros/presentation/providers/providers.dart';
import 'package:sary_challenge/features/manage_heros/presentation/widgets/widgets.dart';

// Widget used to display hero's details in a seperate screen

class HeroProfileCardWidget extends StatefulWidget {
  final HeroModel hero;

  HeroProfileCardWidget({@required this.hero});

  @override
  _HeroProfileCardWidgetState createState() => _HeroProfileCardWidgetState();
}

class _HeroProfileCardWidgetState extends State<HeroProfileCardWidget> {
  @override
  Widget build(BuildContext context) {
    final _heroesProvider = Provider.of<HeroesProvider>(context);

    return Container(
      height: SizeConfig.heightMultiplier * 85,
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 3),
      child: Card(
        elevation: 2,
        child: Container(
          padding: EdgeInsets.all(
            SizeConfig.heightMultiplier * 3,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Hero(
                    tag: widget.hero.id,
                    child: CircleAvatar(
                      radius: SizeConfig.imageSizeMultiplier * 25,
                      backgroundImage: NetworkImage(widget.hero.picUrl),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 4,
                ),
                SecondaryTextWidget(text: widget.hero.description),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 4,
                ),
                Column(
                  children: [
                    Wrap(
                        children: widget.hero.powers
                            .map((power) => PowerTagWidget(power: power))
                            .toList()),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 4,
                    ),
                    RatingBar.builder(
                      itemSize: SizeConfig.imageSizeMultiplier * 14,
                      initialRating: widget.hero.rating.toDouble(),
                      minRating: 1,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: AppColors.secondaryColor,
                      ),
                      onRatingUpdate: (rating) {
                        _heroesProvider.updateHeroRating(
                            heroId: widget.hero.id, rating: rating.toInt());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
