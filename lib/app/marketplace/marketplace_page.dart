import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:tokosmile/app/marketplace/widgets/badged_icon.dart';
import 'package:tokosmile/app/marketplace/widgets/carousel.dart';
import 'package:tokosmile/app/marketplace/widgets/market_menu.dart';
import 'package:tokosmile/app/marketplace/widgets/product_card.dart';
import 'package:tokosmile/app/marketplace/widgets/searchbar.dart';
import 'package:tokosmile/app/marketplace/widgets/sticky_header_delegate.dart';
import 'package:tokosmile/core/data/model/product.dart';
import 'package:tokosmile/core/design_system/color.dart';
import 'package:tokosmile/core/design_system/spacing.dart';
import 'package:tokosmile/core/design_system/typography.dart';

class MarketPlacePage extends StatefulWidget {
  const MarketPlacePage({super.key});

  @override
  State<MarketPlacePage> createState() => _MarketPlacePageState();
}

class _MarketPlacePageState extends State<MarketPlacePage>
    with AutomaticKeepAliveClientMixin {
  final List<Product> _products = Product.seeded(7);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            title: const SearchBar(),
            actions: [
              IconButton(
                onPressed: () {},
                icon: BadgedIcon(
                  icon: PhosphorIcon(
                    PhosphorIcons.regular.shoppingBag,
                    color: TokoColor.black200,
                  ),
                  badge: "2",
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: BadgedIcon(
                  icon: PhosphorIcon(
                    PhosphorIcons.regular.chatCircleText,
                    color: TokoColor.black200,
                  ),
                  badge: "9+",
                ),
              ),
            ],
            flexibleSpace: const FlexibleSpaceBar(
              background: Carousel(),
            ),
          ),
          const SliverToBoxAdapter(
            child: MarketMenu(),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: StickyHeaderDelegate(
              color: TokoColor.grey0,
              child: const _TitleHeader('Best Sale Products'),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                mainAxisExtent: 270,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) => ProductCard(
                  product: _products[index],
                ),
                childCount: _products.length,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _TitleHeader extends StatelessWidget {
  final String title;

  const _TitleHeader(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TokoSpacing.m),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TokoTypography.body2.bold,
          ),
          Text(
            "See more",
            style: TokoTypography.label.cl(TokoColor.primary500).fs(14),
          ),
        ],
      ),
    );
  }
}
