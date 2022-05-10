import 'package:flutter/material.dart';
import 'package:football_league/models/matches_model.dart';
import 'package:intl/intl.dart';

class MatchesCard extends StatelessWidget {
  const MatchesCard({
    Key? key,
    required LeagueMatch match,
    required String winner,
    required DateTime date,
  })  : _match = match,
        _winner = winner,
        _date = date,
        super(key: key);

  final LeagueMatch _match;
  final String _winner;
  final DateTime _date;
  List<String> formatDate(DateTime date) => DateFormat("MMMM/dd/yyyy").format(date).split('/');

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          title: Row(
            children: [
              Text(
                _match.homeTeam.name,
                style: TextStyle(color: _match.homeTeam.name == _winner ? Colors.green : Colors.red),
              ),
              const Text(
                ' VS ',
              ),
              Expanded(
                child: Text(
                  _match.awayTeam.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: _match.awayTeam.name == _winner ? Colors.green : Colors.red),
                ),
              ),
            ],
          ),
          trailing: Column(
            children: [
              Text(
                formatDate(_date)[1],
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
              Text(
                formatDate(_date)[0],
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
              Text(
                formatDate(_date)[2],
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),
          subtitle: Row(
            children: [
              Text(
                _match.score.fullTime.homeTeam.toString(),
                style: TextStyle(color: _match.homeTeam.name == _winner ? Colors.green : Colors.red),
              ),
              const Text(
                ' - ',
              ),
              Expanded(
                child: Text(
                  _match.score.fullTime.awayTeam.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: _match.awayTeam.name == _winner ? Colors.green : Colors.red),
                ),
              ),
            ],
          )),
    );
  }
}
