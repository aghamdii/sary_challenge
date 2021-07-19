import 'package:flutter/material.dart';
import 'package:sary_challenge/core/style/style.dart';
import 'package:sary_challenge/core/utils/utils.dart';
import 'package:sary_challenge/core/widgets/widgets.dart';

// This widget is used to show a loading indicator

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          backgroundColor: AppColors.primaryColor,
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 2,
        ),
        SecondaryTextWidget(text: "Loading heroes."),
      ],
    );
  }
}
