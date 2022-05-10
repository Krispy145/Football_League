import 'package:football_league/app/app.locator.dart';
import 'package:football_league/models/matches_model.dart';
import 'package:football_league/services/api_service.dart';
import 'package:stacked/stacked.dart';

class MatchesPageViewModel extends ReactiveViewModel {
  final APIService _apiService = locator<APIService>();
  @override
  List<ReactiveServiceMixin> get reactiveServices => [_apiService];
  List<LeagueMatch>? get matches => _apiService.matchesModel.matches;

  Future<bool> getMatches() async {
    bool _result = await _apiService.getMatches();
    if (_result) {
      return true;
    } else {
      return false;
    }
  }
}
