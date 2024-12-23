import 'package:flutter/material.dart';

enum PlusMinusButtonType { plus, minus }

class PlusMinusButton extends StatelessWidget {
  final PlusMinusButtonType buttonType;
  final Function() action;

  const PlusMinusButton({
    super.key,
    required this.buttonType,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.surface,
      ),
      onPressed: action,
      child: switch (buttonType) {
        PlusMinusButtonType.plus => const Text('+'),
        PlusMinusButtonType.minus => const Text('-'),
      },
    );
  }
}
