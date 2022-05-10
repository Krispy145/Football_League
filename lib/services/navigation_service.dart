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

  // final GlobalKey zero = LabeledGlobalKey('zero');
  // final GlobalKey one = LabeledGlobalKey('one');
  // final GlobalKey two = LabeledGlobalKey('two');
  // final GlobalKey three = LabeledGlobalKey('three');
  // final GlobalKey four = LabeledGlobalKey('four');
  // final GlobalKey five = LabeledGlobalKey('five');
  // final GlobalKey six = LabeledGlobalKey('six');
  // final GlobalKey seven = LabeledGlobalKey('seven');
  // final GlobalKey eight = LabeledGlobalKey('eight');
  // final GlobalKey nine = LabeledGlobalKey('nine');
  // //not yet used
  // final GlobalKey ten = LabeledGlobalKey('ten');
  // final GlobalKey eleven = LabeledGlobalKey('eleven');
  // final GlobalKey twelve = LabeledGlobalKey('twelve');
  // final GlobalKey thirteen = LabeledGlobalKey('thirteen');
  // final GlobalKey fourteen = LabeledGlobalKey('fourteen');
  // int _adCounter = 0;

  // late SharedPreferences prefs;

  // Future<int> initPrefs() async {
  //   prefs = await SharedPreferences.getInstance();
  //   if (!prefs.containsKey('adCounter')) {
  //     prefs.setInt('adCounter', _adCounter);
  //   } else {
  //     _adCounter = prefs.getInt('adCounter')!;
  //     if (_adCounter <= 8) {
  //       _adCounter++;
  //     } else {
  //       _adCounter = 0;
  //     }
  //     prefs.setInt('adCounter', _adCounter);
  //   }
  //   for (int i = 0; i < 15; i++) {
  //     if (!prefs.containsKey(i.toString())) prefs.setBool(i.toString(), false);
  //   }
  //   print("AdCounter number: $_adCounter");
  //   return _adCounter;
  // }

  // showcaseWidget(BuildContext context, List<int> prefNumbers) {
  //   List<GlobalKey> _keys = [];
  //   for (int number in prefNumbers) {
  //     bool _hasSeen = prefs.getBool(number.toString())!;
  //     if (number == 0 && !_hasSeen) _keys.add(zero);
  //     if (number == 1 && !_hasSeen) _keys.add(one);
  //     if (number == 2 && !_hasSeen) _keys.add(two);
  //     if (number == 3 && !_hasSeen) _keys.add(three);
  //     if (number == 4 && !_hasSeen) _keys.add(four);
  //     if (number == 5 && !_hasSeen) _keys.add(five);
  //     if (number == 6 && !_hasSeen) _keys.add(six);
  //     if (number == 7 && !_hasSeen) _keys.add(seven);
  //     if (number == 8 && !_hasSeen) _keys.add(eight);
  //     if (number == 9 && !_hasSeen) _keys.add(nine);
  //     //not yet used
  //     if (number == 10 && !_hasSeen) _keys.add(ten);
  //     if (number == 11 && !_hasSeen) _keys.add(eleven);
  //     if (number == 12 && !_hasSeen) _keys.add(twelve);
  //     if (number == 13 && !_hasSeen) _keys.add(thirteen);
  //     if (number == 14 && !_hasSeen) _keys.add(fourteen);

  //     if (_keys.isNotEmpty) {
  //       WidgetsBinding.instance?.addPostFrameCallback((_) {
  //         ShowCaseWidget.of(context)?.startShowCase(_keys);
  //       });
  //     }
  //   }
  // }

  // void setTutorialNumber(int number, bool value) {
  //   prefs.setBool(number.toString(), value);
  //   List<GlobalKey> _keys = [];
  //   bool _hasSeen = prefs.getBool(number.toString())!;
  //   if (number == 0 && !_hasSeen) _keys.remove(zero);
  //   if (number == 1 && !_hasSeen) _keys.remove(one);
  //   if (number == 2 && !_hasSeen) _keys.remove(two);
  //   if (number == 3 && !_hasSeen) _keys.remove(three);
  //   if (number == 4 && !_hasSeen) _keys.remove(four);
  //   if (number == 5 && !_hasSeen) _keys.remove(five);
  //   if (number == 6 && !_hasSeen) _keys.remove(six);
  //   if (number == 7 && !_hasSeen) _keys.remove(seven);
  //   if (number == 8 && !_hasSeen) _keys.remove(eight);
  //   if (number == 9 && !_hasSeen) _keys.remove(nine);
  //   if (number == 10 && !_hasSeen) _keys.remove(ten);
  //   if (number == 11 && !_hasSeen) _keys.remove(eleven);
  //   if (number == 12 && !_hasSeen) _keys.remove(twelve);
  //   if (number == 13 && !_hasSeen) _keys.remove(thirteen);
  //   if (number == 14 && !_hasSeen) _keys.remove(fourteen);
  // }

  // Widget showTutorial(
  //   BuildContext context, {
  //   required GlobalKey key,
  //   required int number,
  //   required String title,
  //   required String description,
  //   required Widget child,
  // }) {
  //   bool _hasSeen = prefs.getBool(number.toString())!;

  //   if (!_hasSeen) {
  //     return Showcase(
  //       shapeBorder: const CircleBorder(),
  //       titleTextStyle: AppTextStyle.text,
  //       descTextStyle: AppTextStyle.text,
  //       showcaseBackgroundColor: AppTheme.secondary!,
  //       contentPadding: const EdgeInsets.all(12),
  //       key: key,
  //       title: title,
  //       description: description,
  //       child: child,
  //     );
  //   } else {
  //     return child;
  //   }
  // }

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
