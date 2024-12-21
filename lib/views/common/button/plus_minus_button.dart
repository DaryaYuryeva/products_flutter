import 'package:flutter/material.dart';

enum PlusMinusButtonType { plus, minus }

class PlusMinusButton extends StatefulWidget {
  final PlusMinusButtonType buttonType;
  final Function() action;

  const PlusMinusButton({
    super.key,
    required this.buttonType,
    required this.action,
  });

  @override
  State<PlusMinusButton> createState() => _PlusMinusButtonState();
}

class _PlusMinusButtonState extends State<PlusMinusButton> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.surface,
      ),
      onPressed: widget.action,
      child: widget.buttonType == PlusMinusButtonType.plus
          ? const Text('+')
          : const Text('-'),
    );
  }
}
