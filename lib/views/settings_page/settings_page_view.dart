import 'dart:io';
import 'package:flutter/material.dart';
import 'package:football_league/config/config.dart';
import 'package:football_league/theme/app_theme.dart';
import 'package:football_league/views/settings_page/settings_page_view_model.dart';
import 'package:football_league/widgets/app_bar.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _edgePadding = MediaQuery.of(context).size.width / 12;
    return ViewModelBuilder<SettingsViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: LeagueAppBar(
          appBarTitle: "Settings:",
          leading: InkWell(
            onTap: () => model.navigateToHome(),
            child: Icon(Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios_new_rounded),
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: _edgePadding),
                  child: const Text('Theme Mode:'),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: _edgePadding),
                    child: Switch(
                      value: model.isSwitched,
                      onChanged: (value) => model.setSwitch(value),
                      activeTrackColor: AppTheme.secondary,
                      activeColor: AppTheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: _edgePadding),
                  child: const Text('Number of Days:'),
                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: _edgePadding),
                    width: 250,
                    child: DropdownButton<String>(
                      alignment: Alignment.center,
                      isExpanded: true,
                      value: Config.lastNumberOfDays.toString(),
                      style: const TextTheme().bodyText2,
                      onChanged: (String? day) => model.setnumberOfDays(context, day != null ? int.parse(day) : Config.lastNumberOfDays),
                      items: [
                        for (int i = 0; i <= model.totalNumbers; i++)
                          DropdownMenuItem<String>(
                            value: i.toString(),
                            child: Text(
                              i.toString(),
                              style: const TextTheme().bodyText2,
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      viewModelBuilder: () => SettingsViewModel(),
    );
  }
}
