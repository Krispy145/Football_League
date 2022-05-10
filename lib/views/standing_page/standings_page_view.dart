import 'package:flutter/material.dart';
import 'package:football_league/config/config.dart';
import 'package:football_league/models/teams_model.dart';
import 'package:football_league/views/standing_page/standings_card.dart';
import 'package:football_league/views/standing_page/standings_page_view_model.dart';
import 'package:football_league/widgets/app_bar.dart';
import 'package:football_league/widgets/center_circle_progress.dart';
import 'package:stacked/stacked.dart';

class StandingsPageView extends StatelessWidget {
  const StandingsPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StandingsPageViewModel>.reactive(
      onModelReady: (model) => model.getTeams(),
      builder: (context, model, child) => Scaffold(
          appBar: LeagueAppBar(appBarTitle: '${Config.leagueName} Standings:'),
          body: model.isBusy
              ? const CenterCircleProgress()
              : Column(
                  children: [
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Standings:',
                          style: const TextTheme().bodyText2,
                        ),
                      ),
                      trailing: Text(
                        "Points:",
                        style: const TextTheme().bodyText2?.copyWith(fontSize: 24),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: model.teams.length,
                          itemBuilder: (context, index) {
                            Team _team = model.teams[index].team;
                            int _points = model.teams[index].points;
                            int _position = model.teams[index].position;
                            return StandingsCard(
                              team: _team,
                              points: _points,
                              position: _position,
                            );
                          }),
                    ),
                  ],
                )),
      viewModelBuilder: () => StandingsPageViewModel(),
    );
  }
}
