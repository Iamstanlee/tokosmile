import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:tokosmile/app/product_info/widgets/action_menu.dart';
import 'package:tokosmile/app/product_info/widgets/product_image.dart';
import 'package:tokosmile/core/data/model/product.dart';
import 'package:tokosmile/core/design_system/color.dart';
import 'package:tokosmile/core/design_system/spacing.dart';
import 'package:tokosmile/core/design_system/typography.dart';

class ProductInfoPage extends StatefulWidget {
  final Product product;

  const ProductInfoPage({
    required this.product,
    super.key,
  });

  @override
  State<ProductInfoPage> createState() => _ProductInfoPageState();
}

class _ProductInfoPageState extends State<ProductInfoPage>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;

  late final Animation<double> _sectionOneOpacity;
  late final Animation<double> _sectionTwoOpacity;
  late final Animation<Offset> _bottomSlideOffset;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _sectionOneOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.ease,
      ),
    );

    _sectionTwoOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.5,
          1.0,
          curve: Curves.ease,
        ),
      ),
    );

    _bottomSlideOffset =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.ease,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            PhosphorIcons.regular.caretLeft,
            color: TokoColor.black500,
          ),
        ),
        actions: [ActionMenu(isProductLiked: widget.product.isLiked)],
      ),
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(TokoSpacing.m),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Opacity(
                      opacity: _sectionOneOpacity.value,
                      child: SlideTransition(
                        position: _bottomSlideOffset,
                        child: _SectionOne(
                          product: widget.product,
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: _sectionTwoOpacity.value,
                      child: SlideTransition(
                        position: _bottomSlideOffset,
                        child: _SectionTwo(
                          product: widget.product,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SlideTransition(
              position: _bottomSlideOffset,
              child: _BottomSheetButton(
                price: widget.product.amount,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionOne extends StatelessWidget {
  final Product product;

  const _SectionOne({required this.product});

  @override
  Widget build(BuildContext context) {
    return ProductImage(
      imageUrls: product.imageUrls,
    );
  }
}

class _SectionTwo extends StatelessWidget {
  final Product product;

  const _SectionTwo({required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              PhosphorIcons.regular.storefront,
              color: TokoColor.grey500,
              size: 18,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              product.shopName,
              style: TokoTypography.label.cl(
                TokoColor.grey500,
              ),
            ),
          ],
        ),
        const SizedBox(height: TokoSpacing.xs),
        Text(
          product.name,
          style: TokoTypography.h1,
        ),
        const SizedBox(height: TokoSpacing.m),
        _ProductInfoRow(
          rating: product.rating,
          reviews: product.reviews,
          soldCount: product.soldCount,
        ),
        const SizedBox(height: TokoSpacing.xl),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: TokoSpacing.m,
                right: TokoSpacing.m,
                bottom: TokoSpacing.m,
              ),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: TokoColor.primary500,
                    width: 2,
                  ),
                ),
              ),
              child: Text(
                "About Item",
                style: TokoTypography.body2.cl(TokoColor.primary500).bold,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: TokoSpacing.m,
                right: TokoSpacing.m,
                bottom: TokoSpacing.m,
              ),
              child: Text(
                "Reviews",
                style: TokoTypography.body2,
              ),
            ),
          ],
        ),
        const SizedBox(height: TokoSpacing.m),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
              children: <Widget>[
                _TableCell(
                  title: "Brand",
                  description: product.brandName,
                ),
                _TableCell(
                  title: "Color",
                  description: product.color,
                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                _TableCell(
                  title: "Category",
                  description: product.category,
                ),
                const _TableCell(
                  title: "Material",
                  description: 'Polyester',
                ),
              ],
            ),
            const TableRow(
              children: <Widget>[
                _TableCell(
                  title: "Condition",
                  description: 'USED',
                ),
                _TableCell(
                  title: "Heavy",
                  description: '200g',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _BottomSheetButton extends StatelessWidget {
  final int price;

  const _BottomSheetButton({required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: TokoSpacing.m,
        vertical: TokoSpacing.s,
      ),
      margin: Platform.isIOS
          ? const EdgeInsets.only(bottom: TokoSpacing.l)
          : const EdgeInsets.only(bottom: TokoSpacing.xs),
      color: TokoColor.grey0,
      child: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total Price",
                style: TokoTypography.label.cl(TokoColor.grey500),
              ),
              Text(
                "\$$price",
                style: TokoTypography.subtitle1.cl(TokoColor.primary500).fs(20),
              ),
            ],
          ),
          const Spacer(),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: TokoSpacing.m),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: TokoColor.primary500,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(TokoSpacing.xs),
                        bottomLeft: Radius.circular(TokoSpacing.xs),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          PhosphorIcons.regular.shoppingBag,
                          color: TokoColor.grey0,
                          size: 18,
                        ),
                        const SizedBox(width: TokoSpacing.xs),
                        Text(
                          "2",
                          style: TokoTypography.body1.cl(TokoColor.grey0),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: TokoSpacing.m),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: TokoColor.black200,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(TokoSpacing.xs),
                        bottomRight: Radius.circular(TokoSpacing.xs),
                      ),
                    ),
                    child: Text(
                      "Buy Now",
                      style: TokoTypography.body1.cl(TokoColor.grey0).bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductInfoRow extends StatelessWidget {
  final int rating, reviews, soldCount;

  const _ProductInfoRow({
    required this.rating,
    required this.reviews,
    required this.soldCount,
  });

  @override
  Widget build(BuildContext context) {
    final compactformatter = NumberFormat.compact();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              PhosphorIcons.fill.star,
              color: const Color(0xFFFAB058),
              size: 18,
            ),
            const SizedBox(width: TokoSpacing.xs),
            Text(
              "$rating.0 Ratings",
              style: TokoTypography.body2.cl(TokoColor.grey500),
            )
          ],
        ),
        const CircleAvatar(radius: 2, backgroundColor: TokoColor.grey500),
        Text(
          "${compactformatter.format(reviews)} Reviews",
          style: TokoTypography.body2.cl(TokoColor.grey500),
        ),
        const CircleAvatar(radius: 2, backgroundColor: TokoColor.grey500),
        Text(
          "${compactformatter.format(soldCount)} Sold",
          style: TokoTypography.body2.cl(TokoColor.grey500),
        ),
      ],
    );
  }
}

class _TableCell extends StatelessWidget {
  final String title, description;

  const _TableCell({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: TokoSpacing.m),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$title: ',
            style: TokoTypography.body1.cl(TokoColor.grey500),
          ),
          const SizedBox(height: TokoSpacing.xs),
          Text(
            description,
            style: TokoTypography.body1.cl(TokoColor.black500).bold,
          ),
        ],
      ),
    );
  }
}
