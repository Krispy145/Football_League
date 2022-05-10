import 'package:flutter/material.dart';
import 'package:football_league/theme/app_theme.dart';
import 'package:football_league/theme/text_styles.dart';

SnackBar appSnackbar(String message, {Icon? leading, SnackBarAction? action, Color? color}) => SnackBar(
    content: Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: leading ?? const Icon(Icons.check_circle_outline_rounded),
        ),
        Text(
          message,
          style: AppTextStyle.text,
          textAlign: TextAlign.center,
        ),
      ],
    ),
    action: action,
    behavior: SnackBarBehavior.floating,
    backgroundColor: color ?? AppTheme.secondary);
