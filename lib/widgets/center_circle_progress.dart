import 'package:flutter/material.dart';
import 'package:football_league/theme/app_theme.dart';

class CenterCircleProgress extends StatelessWidget {
  const CenterCircleProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppTheme.secondary,
        backgroundColor: AppTheme.primary,
      ),
    );
  }
}
