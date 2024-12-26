import 'package:flutter/material.dart';

import '../common/info_widget.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const InfoWidget(
      icon: Icons.shopping_bag_outlined,
      text: 'Your cart is empty',
    );
  }
}
