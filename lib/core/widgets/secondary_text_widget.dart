import 'package:flutter/material.dart';
import 'package:sary_challenge/core/style/style.dart';
import 'package:sary_challenge/core/utils/utils.dart';

// This widget used to display secondary texts in the app

class SecondaryTextWidget extends StatelessWidget {
  final String text;

  SecondaryTextWidget({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColors.primaryColor,
        fontSize: SizeConfig.textMultiplier * 2.2,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
