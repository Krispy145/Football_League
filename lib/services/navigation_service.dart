import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:football_league/app/routes.dart';

class NavigationService {
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get navigationKey => _navigationKey;
  late FluroRouter _router;
  FluroRouter get router => _router;

  init() {
    _router = FluroRouter();
    Routes.configureRoutes(_router);
  }

  void pop<T>([T? result]) {
    router.pop(_navigationKey.currentContext!, result);
  }

  Future navigateTo(String path,
      {bool replace = false,
      bool clearStack = false,
      bool maintainState = true,
      bool rootNavigator = false,
      TransitionType? transition,
      Duration? transitionDuration,
      RouteTransitionsBuilder? transitionBuilder,
      RouteSettings? routeSettings}) async {
    var _result = await router.navigateTo(
      _navigationKey.currentContext!,
      path,
      replace: replace,
      clearStack: clearStack,
      maintainState: maintainState,
      rootNavigator: rootNavigator,
      transition: transition,
      transitionDuration: transitionDuration,
      transitionBuilder: transitionBuilder,
      routeSettings: routeSettings,
    );
    return _result;
  }
}
