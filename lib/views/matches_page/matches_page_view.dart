import 'package:flutter/material.dart';
import 'package:football_league/config/config.dart';
import 'package:football_league/models/matches_model.dart';
import 'package:football_league/views/matches_page/matches_card.dart';
import 'package:football_league/views/matches_page/matches_page_view_model.dart';
import 'package:football_league/widgets/app_bar.dart';
import 'package:stacked/stacked.dart';

class MatchesPageView extends StatelessWidget {
  const MatchesPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MatchesPageViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          appBar: LeagueAppBar(appBarTitle: 'Matches in last ${Config.lastNumberOfDays} days:'),
          body: ListView.builder(
              itemCount: model.matches!.length,
              itemBuilder: (context, index) {
                LeagueMatch _match = model.matches![index];
                String _date = "${_match.utcDate.day}/${_match.utcDate.month}/${_match.utcDate.year}";
                String _winner = _match.score.winner == "HOME_TEAM" ? _match.homeTeam.name : _match.awayTeam.name;
                return MatchesCard(
                  match: _match,
                  winner: _winner,
                  date: _date,
                );
              })),
      viewModelBuilder: () => MatchesPageViewModel(),
    );
  }
}
