import 'package:flutter/material.dart';

class CenterErrorMessage extends StatelessWidget {
  final Function()? onRefresh;
  const CenterErrorMessage({Key? key, this.onRefresh}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Error Loading Page. Tap to Refresh'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: onRefresh,
              child: const Icon(
                Icons.refresh_rounded,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
