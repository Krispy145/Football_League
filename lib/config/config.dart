import 'package:flutter/material.dart';

//Initial Config of application
class Config {
  static int lastNumberOfDays = 30;
  static String league = 'PL';
  static String leagueName = "Premier League";
  static String chosenTeam = 'Liverpool FC';
  static ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.dark);
}
