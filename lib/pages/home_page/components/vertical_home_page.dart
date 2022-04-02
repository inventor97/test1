import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:test1/pages/home_page/controller/home_page_controller.dart';
import 'package:test1/utils/utils.dart';

class VerticalHomePageItem extends StatefulWidget {
  const VerticalHomePageItem({
    Key? key,
  }) : super(key: key);

  @override
  State<VerticalHomePageItem> createState() => _VerticalHomePageItemState();
}

class _VerticalHomePageItemState extends State<VerticalHomePageItem> with WidgetsBindingObserver {

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<HomePageController>();
    return Container(
      padding: const EdgeInsets.only(top: 185.0, right: 18.0, left: 18.0, bottom: 5.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ctrl.image),
          fit: BoxFit.contain,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: SizeConfig.h*100,
                padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(color: MyColors.color800, width: 2.0)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Transform(
                      transform: Matrix4.translationValues(0, -115, 0),
                      child: Image.asset("assets/png/gerb.png",width: SizeConfig.h*25,height: SizeConfig.v*25),
                    ),
                   SizedBox(
                     width: double.infinity,
                     child: Transform(
                       transform: Matrix4.translationValues(0, -30, 0),
                       child:  FittedBox(
                         child: Column(
                           children: [
                             GetBuilder<HomePageController>(builder: (c) {
                               return Text(c.timeString, style: Theme.of(context).primaryTextTheme.headline1);
                             }),
                             GetBuilder<HomePageController>(builder: (c) {
                               return Text("${c.date}  ${c.month}" , style: Theme.of(context).primaryTextTheme.headline2);
                             }),
                             GetBuilder<HomePageController>(builder: (c) {
                               return Text(c.day , style: Theme.of(context).primaryTextTheme.headline5);
                             }),
                             SizedBox(height : SizeConfig.v*2),
                           ],
                         ),
                       ),
                     ),
                   )
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.v*4),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GetBuilder<HomePageController>(builder: (c) {
                      return Image.asset(c.weatherData.weatherCodeImage, width: SizeConfig.h*35,);
                    }),
                    SizedBox(width: SizeConfig.h*5),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GetBuilder<HomePageController>(builder: (c) {
                          return Text(c.weatherData.airT>0?"+${c.weatherData.airT}°": "${c.weatherData.airT}°" ,style:Theme.of(context).textTheme.headline6);
                        }),
                        GetBuilder<HomePageController>(builder: (c) {
                          return Text(c.city.tr ,style: Theme.of(context).textTheme.headline4);
                        }),
                        SizedBox(height: SizeConfig.v*2),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      )
    );
  }


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

}
