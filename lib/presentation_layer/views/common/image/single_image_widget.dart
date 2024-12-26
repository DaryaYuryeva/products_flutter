import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../loading_indicator.dart';

class SingleImageWidget extends StatefulWidget {
  final String imageUrlString;
  final double? width;
  final double? height;

  const SingleImageWidget({
    super.key,
    required this.imageUrlString,
    this.width,
    this.height,
  });

  @override
  State<SingleImageWidget> createState() => _SingleImageWidgetState();
}

class _SingleImageWidgetState extends State<SingleImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CachedNetworkImage(
        width: widget.width,
        height: widget.height,
        imageUrl: widget.imageUrlString,
        placeholder: (context, url) => const LoadingIndicator(),
        errorWidget: (context, url, error) => const Icon(
          Icons.image_not_supported_outlined,
          size: 100,
        ),
      ),
    );
  }
}
