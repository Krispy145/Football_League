import 'package:flutter/material.dart';
import 'package:football_league/config/config.dart';
import 'package:football_league/models/teams_model.dart';
import 'package:football_league/views/teams_page/teams_card.dart';
import 'package:football_league/views/teams_page/teams_page_view_model.dart';
import 'package:football_league/widgets/app_bar.dart';
import 'package:stacked/stacked.dart';

class TeamsPageView extends StatelessWidget {
  const TeamsPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TeamsPageViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          appBar: LeagueAppBar(appBarTitle: '${Config.leagueName} Teams'),
          body: ListView.builder(
              itemCount: model.teams.length,
              itemBuilder: (context, index) {
                Team _team = model.teams[index].team;
                int _won = model.teams[index].won;
                int _lost = model.teams[index].lost;
                return TeamsCard(team: _team, won: _won, lost: _lost);
              })),
      viewModelBuilder: () => TeamsPageViewModel(),
    );
  }
}
