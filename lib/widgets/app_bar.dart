import 'package:flutter/material.dart';
import 'package:football_league/theme/app_theme.dart';
import 'package:football_league/theme/text_styles.dart';

class LeagueAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget? leading;
  final Widget? trailing;
  final String appBarTitle;
  const LeagueAppBar({Key? key, required this.appBarTitle, this.leading, this.trailing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      backgroundColor: AppTheme.primary,
      title: Text(
        appBarTitle,
        maxLines: 2,
        textAlign: TextAlign.center,
        style: AppTextStyle.appBar,
      ),
      centerTitle: true,
      iconTheme: IconThemeData(color: AppTheme.secondary),
      actions: [
        if (trailing != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: trailing!,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}
