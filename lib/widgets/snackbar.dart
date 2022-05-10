import 'package:flutter/material.dart';
import 'package:football_league/theme/app_theme.dart';

SnackBar appSnackbar(String message, {Icon? leading, SnackBarAction? action, Color? color}) => SnackBar(
    content: Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: leading ?? const Icon(Icons.check_circle_outline_rounded, color: Colors.white),
        ),
        Text(
          message,
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ],
    ),
    action: action,
    behavior: SnackBarBehavior.floating,
    backgroundColor: color ?? AppTheme.secondary);
