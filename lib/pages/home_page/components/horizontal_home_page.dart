import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:test1/pages/home_page/controller/home_page_controller.dart';
import 'package:test1/utils/utils.dart';

class HorizontalHomePageItem extends StatefulWidget {
  const HorizontalHomePageItem({Key? key}) : super(key: key);

  @override
  State<HorizontalHomePageItem> createState() => _HorizontalHomePageItemState();
}

class _HorizontalHomePageItemState extends State<HorizontalHomePageItem> with  WidgetsBindingObserver{

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    final ctrl = Get.find<HomePageController>();
    if(state == AppLifecycleState.resumed) {
      ctrl.getTime();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 65.0, right: 18.0, left: 18.0, bottom: 5.0),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/png/background_light.png"),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 35.0),
            padding: const EdgeInsets.only(right: 10.0, left:10.0, top: 35.0, bottom: 35.0),
            width: SizeConfig.h*100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(color: MyColors.color800, width: 2.0)
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Transform(
                  transform: Matrix4.translationValues(0, -95, 0),
                  child: Image.asset("assets/png/gerb.png",width: SizeConfig.h*25,height: SizeConfig.v*25),
                ),
                Transform(
                  transform: Matrix4.translationValues(0, -30, 0),
                  child: FittedBox(
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GetBuilder<HomePageController>(builder: (c) {
                          return Text(c.timeString, style: Theme.of(context).primaryTextTheme.headline1);
                        }),
                        SizedBox(width: SizeConfig.h*3),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GetBuilder<HomePageController>(builder: (c) {
                              return Text("${c.date}  ${c.month}" , style: Theme.of(context).primaryTextTheme.headline3);
                            }),
                            SizedBox(height: SizeConfig.v*2),
                            GetBuilder<HomePageController>(builder: (c) {
                              return Text(c.day , style: Theme.of(context).primaryTextTheme.headline3);
                            }),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: SizeConfig.v*2),
          FittedBox(
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GetBuilder<HomePageController>(builder: (c) {
                  return Image.asset(c.weatherData.weatherCodeImage, width: 120,height: 100,);
                }),
                SizedBox(width: SizeConfig.h*3),
                GetBuilder<HomePageController>(builder: (c) {
                  return Text(c.weatherData.airT>0?"+${c.weatherData.airT}°": "-${c.weatherData.airT}°" , style: Theme.of(context).primaryTextTheme.headline2);
                }),
                SizedBox(width: SizeConfig.h*3),
                GetBuilder<HomePageController>(builder: (c) {
                  return Text(c.city.tr , style: Theme.of(context).primaryTextTheme.headline2);
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
