import 'package:flutter/material.dart';
import 'package:football_league/config/config.dart';
import 'package:football_league/models/team_model.dart';
import 'package:football_league/views/home_page/home_page_view_model.dart';
import 'package:football_league/widgets/app_bar.dart';
import 'package:football_league/widgets/bottom_app_bar.dart';
import 'package:football_league/widgets/center_circle_progress.dart';
import 'package:football_league/views/home_page/player_card.dart';
import 'package:stacked/stacked.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return ViewModelBuilder<HomePageViewModel>.reactive(
      onModelReady: (viewModel) => viewModel.getTeams(context),
      builder: (context, model, child) => Scaffold(
        appBar: LeagueAppBar(
          appBarTitle: Config.chosenTeam,
          trailing: InkWell(
            onTap: () => model.navigateToSettings(),
            child: const Icon(
              Icons.settings,
            ),
          ),
        ),
        body: model.isBusy
            ? const CenterCircleProgress()
            : GridView.builder(
                itemCount: model.bestTeam.squad != null ? model.bestTeam.squad!.length : 0,
                itemBuilder: (context, index) {
                  Squad _player = model.bestTeam.squad![index];
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: PlayerCard(
                      player: _player,
                      index: index,
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _width < 720 ? 2 : 3,
                  childAspectRatio: 3 / 2,
                  mainAxisSpacing: 4,
                ),
              ),
        floatingActionButton: const BottomLeagueAppBar(),
      ),
      viewModelBuilder: () => HomePageViewModel(),
    );
  }
}
