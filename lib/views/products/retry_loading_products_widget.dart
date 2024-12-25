import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/products/products_cubit.dart';
import '../common/info_widget.dart';
import '../common/main_button.dart';

class RetryLoadingProductsWidget extends StatelessWidget {
  final String errorText;

  const RetryLoadingProductsWidget({
    super.key,
    required this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InfoWidget(
            icon: Icons.error_outline,
            text: errorText,
          ),
          const SizedBox(height: 20),
          MainButton(
            title: 'Retry',
            action: () {
              context.read<ProductsCubit>().getProducts();
            },
          ),
        ],
      ),
    );
  }
}
