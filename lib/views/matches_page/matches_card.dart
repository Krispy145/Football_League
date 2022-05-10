import 'package:flutter/material.dart';
import 'package:football_league/models/matches_model.dart';
import 'package:football_league/theme/text_styles.dart';

class MatchesCard extends StatelessWidget {
  const MatchesCard({
    Key? key,
    required LeagueMatch match,
    required String winner,
    required String date,
  })  : _match = match,
        _winner = winner,
        _date = date,
        super(key: key);

  final LeagueMatch _match;
  final String _winner;
  final String _date;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          title: Row(
            children: [
              Text(
                _match.homeTeam.name,
                style: AppTextStyle.text.copyWith(color: _match.homeTeam.name == _winner ? Colors.green : Colors.red),
              ),
              Text(
                ' VS ',
                style: const TextTheme().bodyText2,
              ),
              Expanded(
                child: Text(
                  _match.awayTeam.name,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.text.copyWith(color: _match.awayTeam.name == _winner ? Colors.green : Colors.red),
                ),
              ),
            ],
          ),
          subtitle: Text(
            _date,
            style: AppTextStyle.textSmall,
          )),
    );
  }
}
