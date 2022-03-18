import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:test1/pages/drop_down_page/view/drop_down_page.dart';
import 'package:test1/pages/home_page/components/region_drop_down.dart';
import 'package:test1/pages/home_page/controller/home_page_controller.dart';
import 'package:test1/pages/home_page/utils/region_utils.dart';
import 'package:test1/utils/helpers/services/theme_service.dart';
import 'package:test1/utils/utils.dart';

class VerticalHomePageItem extends StatelessWidget {
  const VerticalHomePageItem({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<HomePageController>();
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 15.0, right: 25.0, left: 25.0, bottom: 25.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/png/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(MyColors.color800),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        )
                    ),
                  ),
                  onPressed: () {
                    Get.to(() => const DropDownPage());
                  },
                  child: Text("Test2", style: Theme.of(context).textTheme.headline6),
                ),
                SizedBox(height:SizeConfig.vertical*2),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(MyColors.color800),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        )
                    ),
                  ),
                  onPressed: () {
                    ThemeService().changeTheme();
                    ctrl.image=="assets/png/background.png"?ctrl.image="assets/png/background_light.png":ctrl.image="assets/png/background.png";
                    ctrl.update();
                  },
                  child: const Icon(Icons.nightlight_outlined, color: MyColors.white),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.vertical*5),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: MyColors.color800, width: 2.0)
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Transform(
                        transform: Matrix4.translationValues(0, -75, 0),
                        child: Image.asset("assets/png/gerb.png",width: 120.0,height: 120.0),
                      ),
                      GetBuilder<HomePageController>(builder: (c) {
                        return Text(c.timeString, style: Theme.of(context).textTheme.headline1);
                      }),
                      SizedBox(height: SizeConfig.vertical*2),
                      GetBuilder<HomePageController>(builder: (c) {
                        return Text("${c.date}  ${c.month}" , style: Theme.of(context).textTheme.headline2);
                      }),
                      SizedBox(height: SizeConfig.vertical*2),
                      GetBuilder<HomePageController>(builder: (c) {
                        return Text(c.day , style: Theme.of(context).textTheme.headline3);
                      }),
                      SizedBox(height : SizeConfig.vertical*10),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.vertical*4),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GetBuilder<HomePageController>(builder: (c) {
                      return Image.asset(c.weatherData.weatherCodeImage, width: 90,);
                    }),
                    SizedBox(width: SizeConfig.horizontal*2),
                    Column(
                      children: [
                        GetBuilder<HomePageController>(builder: (c) {
                          return Text(c.weatherData.airT>0?"+${c.weatherData.airT}°": "-${c.weatherData.airT}°" ,style:Theme.of(context).textTheme.headline5);
                        }),
                        SizedBox(height: SizeConfig.vertical*2),
                        GetBuilder<HomePageController>(builder: (c) {
                          return Text(c.city.tr , style: Theme.of(context).textTheme.headline4);
                        }),
                      ],
                    )
                  ],
                ),
                GetBuilder<HomePageController>(builder: (c) {
                  return RegionDropDown(
                      items: RegionUtils().regions,
                      label: "region".tr,
                      hint: "region".tr,
                      onChanged: (v) {
                        c.typeCity(v);
                        c.getWeatherCast();
                      },
                      onSaved: (v) {
                        c.typeCity(v);
                        c.getWeatherCast();
                      }
                  );
                })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
