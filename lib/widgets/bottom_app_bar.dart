import 'package:flutter/material.dart';
import 'package:football_league/config/config.dart';
import 'package:football_league/theme/app_theme.dart';
import 'package:football_league/views/home_page/home_page_view_model.dart';
import 'package:stacked/stacked.dart';

class BottomLeagueAppBar extends ViewModelWidget<HomePageViewModel> {
  const BottomLeagueAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, HomePageViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BottomLeagueAppBarButton(
            onPressed: () => viewModel.navigateToTeams(),
            message: 'Teams in the League',
          ),
          _BottomLeagueAppBarButton(
            onPressed: () => viewModel.navigateToStandings(),
            message: 'Teams Standings in the League',
          ),
          _BottomLeagueAppBarButton(
            onPressed: () => viewModel.navigateToMatches(),
            message: 'Matches in last ${Config.lastNumberOfDays}',
          ),
        ],
      ),
    );
  }
}

class _BottomLeagueAppBarButton extends StatelessWidget {
  final void Function() onPressed;
  final String message;
  const _BottomLeagueAppBarButton({
    Key? key,
    required this.onPressed,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      margin: const EdgeInsets.all(4.0),
      message: message,
      child: Container(
        decoration: BoxDecoration(color: AppTheme.primary, shape: BoxShape.circle),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.group,
            color: AppTheme.secondary,
          ),
          color: AppTheme.secondary,
        ),
      ),
    );
  }
}
