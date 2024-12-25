import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String title;
  final Function() action;
  final double? buttonWidth;

  const MainButton({
    super.key,
    required this.title,
    required this.action,
    this.buttonWidth,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: buttonWidth,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.surface,
          textStyle: theme.textTheme.titleMedium,
        ),
        onPressed: action,
        child: Text(title),
      ),
    );
  }
}
