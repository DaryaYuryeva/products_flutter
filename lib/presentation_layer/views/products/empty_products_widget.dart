import 'package:flutter/material.dart';

import '../common/info_widget.dart';

class EmptyProductsWidget extends StatelessWidget {
  const EmptyProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const InfoWidget(
      icon: Icons.not_interested,
      text: 'No products',
    );
  }
}
