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

    return IconButton(
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.surface,
      ),
      onPressed: action,
      icon: switch (buttonType) {
        PlusMinusButtonType.plus => const Icon(Icons.add),
        PlusMinusButtonType.minus => const Icon(Icons.remove),
      },
    );
  }
}
