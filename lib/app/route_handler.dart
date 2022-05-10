import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:football_league/views/home_page/home_page_view.dart';
import 'package:football_league/views/matches_page/matches_page_view.dart';
import 'package:football_league/views/settings_page/settings_page_view.dart';
import 'package:football_league/views/standing_page/standings_page_view.dart';
import 'package:football_league/views/teams_page/teams_page_view.dart';

var homePageHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<dynamic>> params) {
  return const HomePageView();
});

var settingsPageHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<dynamic>> params) {
  return const SettingsView();
});

var teamsPageHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<dynamic>> params) {
  return const TeamsPageView();
});

var standingsPageHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<dynamic>> params) {
  return const StandingsPageView();
});

var matchesPageHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<dynamic>> params) {
  return const MatchesPageView();
});
