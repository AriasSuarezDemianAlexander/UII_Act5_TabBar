import 'package:ariastab/silver_tab_bar.dart';
import 'package:flutter/material.dart';

void main() => runApp(const TabBarSilver());

class TabBarSilver extends StatelessWidget {
  const TabBarSilver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Material App",
      home: Scaffold(
        body: SliverTabBar(),
      ),
    );
  }
}
