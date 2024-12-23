import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String title;
  final Function() action;

  const MainButton({
    super.key,
    required this.title,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10,),
      width: double.infinity,

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.surface,
        ),
        onPressed: action,
        child: Text(title),
      ),
    );
  }
}