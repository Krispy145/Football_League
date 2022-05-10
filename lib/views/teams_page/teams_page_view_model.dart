import 'package:football_league/app/app.locator.dart';
import 'package:football_league/models/teams_model.dart';
import 'package:football_league/services/api_service.dart';
import 'package:stacked/stacked.dart';

class TeamsPageViewModel extends ReactiveViewModel {
  final APIService _apiService = locator<APIService>();
  @override
  List<ReactiveServiceMixin> get reactiveServices => [_apiService];
  List<LeagueTable> get teams => _apiService.shuffledTeams;

  shuffleTeams() async {
    setBusy(true);
    await _apiService.shuffleTeams();
    setBusy(false);
  }
}
