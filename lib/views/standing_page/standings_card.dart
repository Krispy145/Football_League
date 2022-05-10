import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_league/models/teams_model.dart';

class StandingsCard extends StatelessWidget {
  const StandingsCard({
    Key? key,
    required Team team,
    required int points,
    required this.position,
  })  : _team = team,
        _points = points,
        super(key: key);

  final Team _team;
  final int _points;
  final int position;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "$position.",
                style: const TextTheme().bodyText2?.copyWith(fontSize: 24),
              ),
            ),
            _team.crestUrl.endsWith('.svg')
                ? SvgPicture.network(
                    _team.crestUrl,
                    width: 30,
                    height: 30,
                  )
                : Image.network(
                    _team.crestUrl,
                    width: 30,
                    height: 30,
                  ),
          ],
        ),
        title: Text(
          _team.name,
          style: const TextTheme().bodyText2,
        ),
        trailing: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            _points.toString(),
            style: const TextTheme().bodyText2?.copyWith(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
