import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_league/models/teams_model.dart';

class TeamsCard extends StatelessWidget {
  const TeamsCard({
    Key? key,
    required Team team,
    required int won,
    required int lost,
  })  : _team = team,
        _won = won,
        _lost = lost,
        super(key: key);

  final Team _team;
  final int _won;
  final int _lost;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: _team.crestUrl.endsWith('.svg')
            ? SvgPicture.network(
                _team.crestUrl,
                width: 50,
                height: 50,
              )
            : Image.network(_team.crestUrl, width: 50, height: 50),
        title: Text(
          _team.name,
          style: const TextTheme().bodyText2,
        ),
        subtitle: Row(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("Won: $_won"),
            ),
            Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(color: Colors.redAccent, shape: BoxShape.circle),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("Lost: $_lost"),
            ),
          ],
        ),
      ),
    );
  }
}
