import 'package:flutter/material.dart';
import 'package:sary_challenge/core/utils/utils.dart';
import 'package:sary_challenge/features/manage_heros/data/models/models.dart';

// Widget used to display colord PowerTag basde on the type

class PowerTagWidget extends StatelessWidget {
  final PowerModel power;
  PowerTagWidget({@required this.power});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: SizeConfig.widthMultiplier * 2,
      ),
      child: Chip(
        label: Text(
          power.title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: ColorUtility.color(
          power.type.color,
        ),
      ),
    );
  }
}
