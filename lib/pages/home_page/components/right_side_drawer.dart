import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:test1/pages/drop_down_page/controller/drop_down_page_controller.dart';
import 'package:test1/pages/drop_down_page/view/drop_down_page.dart';
import 'package:test1/pages/home_page/components/region_drop_down.dart';
import 'package:test1/pages/home_page/controller/home_page_controller.dart';
import 'package:test1/pages/home_page/utils/region_utils.dart';
import 'package:test1/utils/helpers/services/theme_service.dart';
import 'package:test1/utils/utils.dart';

class RightSideDrawer extends StatefulWidget {
  const RightSideDrawer({
    Key? key
  }) : super(key: key);

  @override
  State<RightSideDrawer> createState() => _RightSideDrawerState();
}

class _RightSideDrawerState extends State<RightSideDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:SingleChildScrollView(
        child:  Container(
            padding: const EdgeInsets.only(top: 35.0, right: 10.0, left: 10.0, bottom: 10.0),
            child: GetBuilder<HomePageController>(builder: (c) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: SizeConfig.v*3),
                  RegionDropDown(
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
                  ),
                  SizedBox(height: SizeConfig.v*2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("night mode".tr, style: Theme.of(context).primaryTextTheme.headline5),
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
                          c.update();
                        },
                        child: const Icon(Icons.nightlight_outlined, color: MyColors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.v*2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("language".tr, style: Theme.of(context).primaryTextTheme.headline5, textAlign: TextAlign.start),
                    ],
                  ),
                  SizedBox(height: SizeConfig.v),
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
                      Get.updateLocale(const Locale('en', 'EN'));
                    },
                    child: Text("English", style: Theme.of(context).primaryTextTheme.headline5),
                  ),
                  SizedBox(height: SizeConfig.v*2),
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
                      Get.updateLocale(const Locale('ru', 'RU'));
                      c.update();
                    },
                    child: Text("Русскый", style: Theme.of(context).primaryTextTheme.headline5),
                  ),
                  SizedBox(height: SizeConfig.v*2),
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
                      Get.updateLocale(const Locale('uz', 'UZ'));
                      c.update();
                    },
                    child: Text("O'zbek", style: Theme.of(context).primaryTextTheme.headline5),
                  ),
                  SizedBox(height: SizeConfig.v*2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("test 2".tr, style: Theme.of(context).primaryTextTheme.headline5),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(MyColors.color800),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              )
                          ),
                        ),
                        onPressed: () async {
                          Get.put(DropDownPageController());
                          DropDownPageController ctrl = Get.find<DropDownPageController>();
                          Future.wait([
                            ctrl.initCtrl()
                          ]).then((value) => {
                            Get.to(() => const DropDownPage()),
                          });
                        },
                        child: const Icon(Icons.exit_to_app_sharp, color: MyColors.white),
                      ),
                    ],
                  ),
                ],
              );
            })
        ),
      )
    );
  }
}
