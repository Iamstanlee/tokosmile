import 'package:flutter/material.dart';
import 'package:tokosmile/core/app_scaffold.dart';
import 'package:tokosmile/core/constant.dart';
import 'package:tokosmile/core/design_system/theme.dart';

void main() {
  runApp(const Tokosmile());
}

class Tokosmile extends StatelessWidget {
  const Tokosmile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TokoConstants.appName,
      debugShowCheckedModeBanner: TokoConstants.showDebugCheckBanner,
      theme: TokoTheme.light,
      home: const AppScaffold(),
    );
  }
}
