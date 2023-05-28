import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:tokosmile/app/marketplace/marketplace_page.dart';
import 'package:tokosmile/core/design_system/color.dart';
import 'package:tokosmile/core/design_system/typography.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({super.key});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  final List<Widget> _pages = [
    const MarketPlacePage(),
    const _UnImplementedPage(),
    const _UnImplementedPage(),
    const _UnImplementedPage(),
  ];

  int _currentIndex = 0;

  void _changeIndex(int index) {
    setState(() => _currentIndex = index);
    pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _changeIndex,
        items: [
          BottomNavigationBarItem(
            icon: PhosphorIcon(PhosphorIcons.regular.houseSimple),
            activeIcon: PhosphorIcon(PhosphorIcons.fill.houseSimple),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: PhosphorIcon(PhosphorIcons.regular.ticket),
            activeIcon: PhosphorIcon(PhosphorIcons.fill.ticket),
            label: "Voucher",
          ),
          BottomNavigationBarItem(
            icon: PhosphorIcon(PhosphorIcons.regular.wallet),
            activeIcon: PhosphorIcon(PhosphorIcons.fill.wallet),
            label: "Wallet",
          ),
          BottomNavigationBarItem(
            icon: PhosphorIcon(PhosphorIcons.regular.gearSix),
            activeIcon: PhosphorIcon(PhosphorIcons.fill.gearSix),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}

class _UnImplementedPage extends StatelessWidget {
  const _UnImplementedPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "n/a",
          style: TokoTypography.body1.cl(TokoColor.primary500).fs(18),
        ),
      ),
    );
  }
}
