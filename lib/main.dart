import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:football_league/app/app.locator.dart';
import 'package:football_league/app/routes.dart';
import 'package:football_league/config/config.dart';
import 'package:football_league/services/navigation_service.dart';
import 'package:football_league/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final NavigationService _navigationService = locator<NavigationService>();
  _MyAppState() {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    _navigationService.init();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    debugPrint('User Online');
    WidgetsBinding.instance!.addPostFrameCallback((_) {});
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance?.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused || state == AppLifecycleState.detached) {
      debugPrint('User Offline');
    }
    if (state == AppLifecycleState.resumed) {
      debugPrint('User Online');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: Config.themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "League's Best",
            theme: AppTheme.themedata,
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,
            navigatorKey: _navigationService.navigationKey,
            onGenerateRoute: _navigationService.router.generator,
          );
        });
  }
}
