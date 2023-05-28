import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:tokosmile/core/design_system/color.dart';
import 'package:tokosmile/core/design_system/spacing.dart';
import 'package:tokosmile/core/design_system/typography.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: TokoSpacing.s),
      child: TextField(
        decoration: InputDecoration(
          constraints: const BoxConstraints(maxHeight: 48),
          hintText: "Search...",
          hintStyle: TokoTypography.body1.cl(TokoColor.black200),
          prefixIcon: Icon(
            PhosphorIcons.regular.magnifyingGlass,
            color: TokoColor.black200,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: TokoColor.black200,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: TokoColor.black200,
            ),
          ),
        ),
      ),
    );
  }
}
