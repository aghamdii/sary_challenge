import 'package:flutter/material.dart';
import 'package:sary_challenge/core/style/style.dart';
import 'package:sary_challenge/core/utils/utils.dart';

// This widget is used to show the rating only without changing the rating

class StarsCounterWidget extends StatelessWidget {
  final int rating;

  StarsCounterWidget({@required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.heightMultiplier * 4,
      child: Row(
        children: [
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: rating,
            itemBuilder: (context, index) {
              return Icon(
                Icons.star,
                size: SizeConfig.imageSizeMultiplier * 8,
                color: AppColors.secondaryColor,
              );
            },
          ),
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 5 - rating,
            itemBuilder: (context, index) {
              return Icon(
                Icons.star,
                size: SizeConfig.imageSizeMultiplier * 8,
                color: Colors.grey,
              );
            },
          ),
        ],
      ),
    );
  }
}
