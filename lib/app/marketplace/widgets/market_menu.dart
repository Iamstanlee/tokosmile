import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:tokosmile/core/design_system/color.dart';
import 'package:tokosmile/core/design_system/spacing.dart';
import 'package:tokosmile/core/design_system/typography.dart';

class MarketMenu extends StatelessWidget {
  const MarketMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: TokoSpacing.l,
        left: TokoSpacing.m,
        right: TokoSpacing.m,
        top: TokoSpacing.m,
      ),
      color: TokoColor.grey0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _MenuItem(
            title: "Category",
            icon: PhosphorIcons.regular.command,
            onTap: () {},
          ),
          _MenuItem(
            title: "Flight",
            icon: PhosphorIcons.regular.airplane,
            onTap: () {},
          ),
          _MenuItem(
            title: "Bill",
            icon: PhosphorIcons.regular.clipboardText,
            onTap: () {},
          ),
          _MenuItem(
            title: "Data plan",
            icon: PhosphorIcons.regular.globeHemisphereEast,
            onTap: () {},
          ),
          _MenuItem(
            title: "Top up",
            icon: PhosphorIcons.regular.coins,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  const _MenuItem({
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: TokoColor.grey100,
              borderRadius: BorderRadius.circular(TokoSpacing.s),
            ),
            padding: const EdgeInsets.all(TokoSpacing.s),
            child: Icon(icon, size: 22),
          ),
          const SizedBox(height: TokoSpacing.s),
          Text(
            title,
            style: TokoTypography.body1.cl(TokoColor.grey400),
          ),
        ],
      ),
    );
  }
}
