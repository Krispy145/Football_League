import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:football_league/app/route_handler.dart';

class Routes {
  static const String homePageView = '/';
  static const String settingsPageView = '/settings';
  static const String teamsPageView = '/teams';
  static const String standingsView = '/standings';
  static const String matchesView = '/matches';

  static const all = <String>{
    homePageView,
    settingsPageView,
    teamsPageView,
    matchesView,
  };
  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      debugPrint("ROUTE WAS NOT FOUND !!!");
      return;
    });

    TransitionType _defaultType = TransitionType.fadeIn;
    router.define(homePageView, handler: homePageHandler, transitionType: TransitionType.none);
    router.define(settingsPageView, handler: settingsPageHandler, transitionType: _defaultType);
    router.define(teamsPageView, handler: teamsPageHandler, transitionType: _defaultType);
    router.define(standingsView, handler: standingsPageHandler, transitionType: _defaultType);
    router.define(matchesView, handler: matchesPageHandler, transitionType: _defaultType);
  }
}
