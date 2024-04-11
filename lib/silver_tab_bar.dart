import 'package:flutter/material.dart';

class SliverTabBar extends StatefulWidget {
  const SliverTabBar({Key? key}) : super(key: key);

  @override
  _SliverTabBarState createState() => _SliverTabBarState();
}

class _SliverTabBarState extends State<SliverTabBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int index = 0;
  String image =
      "https://raw.githubusercontent.com/AriasSuarezDemianAlexander/IMGFlutlabCarpinteria/main/IconoCa.jpg";

  List<String> miImages = [
    "https://raw.githubusercontent.com/AriasSuarezDemianAlexander/img_iOS_C/main/Flutter_A12/Closet.jpg",
    "https://raw.githubusercontent.com/AriasSuarezDemianAlexander/img_iOS_C/main/Flutter_A12/closet.png",
    "https://raw.githubusercontent.com/AriasSuarezDemianAlexander/img_iOS_C/main/Flutter_A12/isla2.jpeg",
    "https://raw.githubusercontent.com/AriasSuarezDemianAlexander/img_iOS_C/main/Flutter_A12/mdb3.jpeg",
  ];

  void _tabListener() {
    setState(() {
      index = tabController!.index;
      image = miImages[index];
    });
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 4,
      vsync: this,
    );
    tabController.addListener(_tabListener);
  }

  @override
  void dispose() {
    tabController!.removeListener(_tabListener);
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          elevation: 0.0,
          pinned: true,
          backgroundColor: Color(0xffffc68f),
          expandedHeight: 350.0,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text("Carpinteria Demian Arias"),
            background: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverAppBar(
          pinned: true,
          primary: false,
          elevation: 8.0,
          backgroundColor: Color(0xffffc68f),
          title: Align(
            alignment: AlignmentDirectional.center,
            child: TabBar(
              indicatorColor: Color(0xff583500),
              isScrollable: true,
              controller: tabController,
              tabs: [
                Tab(text: "Mueble 1"),
                Tab(text: "Mueble 2"),
                Tab(text: "Mueble 3"),
                Tab(text: "Mueble 4"),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 800.0,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: TabBarView(
                controller: tabController,
                children: [
                  Text("Gabinete"),
                  Text("Closet"),
                  Text("Isla"),
                  Text("Isla de cocina"),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
