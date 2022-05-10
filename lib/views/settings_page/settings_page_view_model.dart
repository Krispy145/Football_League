import 'package:football_league/app/app.locator.dart';
import 'package:football_league/app/routes.dart';
import 'package:football_league/services/api_service.dart';
import 'package:football_league/widgets/snackbar.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:football_league/config/config.dart';
import 'package:football_league/services/navigation_service.dart';

class SettingsViewModel extends ReactiveViewModel {
  final APIService _apiService = locator<APIService>();
  @override
  List<ReactiveServiceMixin> get reactiveServices => [_apiService];
  final NavigationService _navigationService = locator<NavigationService>();
  int _pickedNumber = 1;
  get pickedNumber => _pickedNumber;
  int totalNumbers = 30;
  bool _isSwitched = Config.themeNotifier.value == ThemeMode.dark ? true : false;
  get isSwitched => _isSwitched;

  setnumberOfDays(BuildContext context, int? day) async {
    bool _result = await _getTeams();
    if (_result) {
      _pickedNumber = day ?? _pickedNumber;
      Config.lastNumberOfDays = _pickedNumber;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(appSnackbar('Settings Changed'));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(appSnackbar('Request Time Limit: Please wait',
          color: Colors.red,
          leading: const Icon(
            Icons.error_outline_rounded,
            color: Colors.white,
          )));
    }
  }

  Future<bool> _getTeams() async {
    setBusy(true);
    bool _result = await _apiService.getTeamNames();
    if (_result) {
      bool _matchesResult = await _getMatches();
      if (_matchesResult) {
        return true;
      } else {
        setBusy(false);
        return false;
      }
    } else {
      setBusy(false);
      return false;
    }
  }

  Future<bool> _getMatches() async {
    bool _result = await _apiService.getMatches();
    if (_result) {
      return true;
    } else {
      return false;
    }
  }

  setSwitch(bool value) {
    Config.themeNotifier.value = value ? ThemeMode.dark : ThemeMode.light;
    _isSwitched = value;
    notifyListeners();
  }

  navigateToHome() {
    _navigationService.navigateTo(Routes.homePageView, clearStack: true);
  }
}
