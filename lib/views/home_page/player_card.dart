import 'package:flutter/material.dart';
import 'package:football_league/models/team_model.dart';
import 'package:football_league/theme/text_styles.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard({
    Key? key,
    required Squad player,
    required this.index,
  })  : _player = player,
        super(key: key);

  final Squad _player;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              width: 54,
              height: 54,
              child: Stack(
                children: [
                  const ImageIcon(
                    AssetImage('assets/tee-shirt-icon-18.jpeg'),
                    size: 54,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 14.0, right: 2.5),
                      child: Text(
                        "${index + 1}",
                        textAlign: TextAlign.center,
                        style: AppTextStyle.text.copyWith(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        _player.name,
                        softWrap: true,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.text,
                      ),
                    ),
                    Text(
                      _player.nationality,
                      style: AppTextStyle.textSmall,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _player.position!,
                    style: AppTextStyle.text,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
