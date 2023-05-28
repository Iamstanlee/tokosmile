import 'package:flutter/material.dart';
import 'package:tokosmile/core/design_system/spacing.dart';

class ProductImage extends StatefulWidget {
  final List<String> imageUrls;

  const ProductImage({required this.imageUrls, super.key});

  @override
  State<ProductImage> createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final imageUrls = widget.imageUrls;

    return SizedBox(
      height: 320,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              imageUrls[_currentImageIndex],
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: TokoSpacing.s,
            left: TokoSpacing.s,
            child: Column(
              children: imageUrls
                  .map(
                    (image) => GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentImageIndex = imageUrls.indexOf(image);
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: TokoSpacing.s),
                        height: 48,
                        width: 36,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(TokoSpacing.s),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(TokoSpacing.s),
                          child: Image.asset(
                            image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
