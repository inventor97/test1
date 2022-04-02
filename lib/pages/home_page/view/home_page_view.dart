import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/pages/home_page/components/floating_button.dart';
import 'package:test1/pages/home_page/components/horizontal_home_page.dart';
import 'package:test1/pages/home_page/components/right_side_drawer.dart';
import 'package:test1/pages/home_page/components/vertical_home_page.dart';
import 'package:test1/pages/home_page/controller/home_page_controller.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {


  @override
  void initState() {
    super.initState();
    Get.put(HomePageController());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    return Scaffold(
      key: _key,
      extendBodyBehindAppBar: false,
      floatingActionButton: MyFloatingButton(onPressed: () {_key.currentState!.openDrawer();}),
      body: SafeArea(
        child: OrientationBuilder(
            builder: (context, orientation) =>
            orientation == Orientation.landscape? const HorizontalHomePageItem():const VerticalHomePageItem()
        ),
      ),
      drawer: const RightSideDrawer(),
    );
  }

}
