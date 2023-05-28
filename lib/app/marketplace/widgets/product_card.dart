import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:tokosmile/app/product_info/product_info_page.dart';
import 'package:tokosmile/core/data/model/product.dart';
import 'package:tokosmile/core/design_system/color.dart';
import 'package:tokosmile/core/design_system/spacing.dart';
import 'package:tokosmile/core/design_system/typography.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductInfoPage(
              product: product,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 150,
                  child: Image.asset(
                    product.imageUrls[0],
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: product.isLiked
                    ? Icon(
                        PhosphorIcons.fill.heartStraight,
                        color: TokoColor.badgeColor,
                        size: 18,
                      )
                    : Icon(
                        PhosphorIcons.bold.heartStraight,
                        size: 18,
                      ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: TokoSpacing.xs),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  product.category,
                  style: TokoTypography.label.cl(TokoColor.grey500),
                ),
                const SizedBox(height: TokoSpacing.xs),
                Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TokoTypography.body2,
                ),
                const SizedBox(height: TokoSpacing.m),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          PhosphorIcons.fill.star,
                          color: const Color(0xFFFAB058),
                          size: 12,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          "${product.rating}.0 | ${product.reviews}",
                          style: TokoTypography.label.cl(TokoColor.grey400),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                    Flexible(
                      child: Text(
                        "\$${product.amount}",
                        style:
                            TokoTypography.subtitle1.cl(TokoColor.primary500),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
