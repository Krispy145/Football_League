import 'package:flutter/material.dart';

class Config {
  static int lastNumberOfDays = 30;
  static String league = 'PL';
  static String leagueName = "Premier League";
  static String chosenTeam = 'Liverpool FC';
  static ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.dark);
}
