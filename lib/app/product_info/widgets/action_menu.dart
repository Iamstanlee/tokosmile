import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:tokosmile/app/marketplace/widgets/badged_icon.dart';
import 'package:tokosmile/core/design_system/color.dart';

class ActionMenu extends StatelessWidget {
  final bool isProductLiked;

  const ActionMenu({required this.isProductLiked, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      IconButton(
        onPressed: () {},
        icon: isProductLiked
            ? PhosphorIcon(
                PhosphorIcons.fill.heartStraight,
                color: TokoColor.badgeColor,
                size: 20,
              )
            : PhosphorIcon(
                PhosphorIcons.regular.heartStraight,
                color: TokoColor.black500,
                size: 20,
              ),
      ),
      IconButton(
        onPressed: () {},
        icon: PhosphorIcon(
          PhosphorIcons.regular.shareNetwork,
          color: TokoColor.black500,
          size: 20,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: BadgedIcon(
          icon: PhosphorIcon(
            PhosphorIcons.regular.shoppingBag,
            color: TokoColor.black500,
            size: 20,
          ),
          badge: '2',
        ),
      ),
    ]);
  }
}
