import 'package:flutter/material.dart';
import 'package:sary_challenge/core/style/style.dart';
import 'package:sary_challenge/core/utils/utils.dart';

// This widget used to display title texts in the app

class TitleTextWidget extends StatelessWidget {
  final String text;

  TitleTextWidget({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.secondaryColor,
        fontWeight: FontWeight.bold,
        fontSize: SizeConfig.textMultiplier * 4.5,
      ),
    );
  }
}
