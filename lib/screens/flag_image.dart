import 'package:flutter/material.dart';

class FlagImage extends StatelessWidget {
  final String url;
  final double width;

  const FlagImage({
    super.key,
    required this.url,
    this.width = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      width: width,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }

        return SizedBox(
          width: width,
          height: 30,
          child: const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return SizedBox(
          width: width,
          height: 30,
          child: const Icon(
            Icons.flag_outlined,
          ),
        );
      },
    );
  }
}