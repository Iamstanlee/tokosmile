import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:tokosmile/core/design_system/color.dart';
import 'package:tokosmile/core/design_system/typography.dart';

class BadgedIcon extends StatelessWidget {
  final String badge;
  final PhosphorIcon icon;

  const BadgedIcon({
    required this.badge,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        icon,
        Positioned(
          top: -4,
          right: -4,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 2.8),
            decoration: BoxDecoration(
              color: TokoColor.badgeColor,
              borderRadius: BorderRadius.circular(2),
            ),
            child: Text(
              badge,
              style: TokoTypography.label.cl(TokoColor.grey0),
            ),
          ),
        ),
      ],
    );
  }
}
