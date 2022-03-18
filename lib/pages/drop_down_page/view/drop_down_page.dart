import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:test1/api/model/init_hive.dart';
import 'package:test1/pages/drop_down_page/components/region_drop_down.dart';
import 'package:test1/pages/drop_down_page/controller/drop_down_page_controller.dart';
import 'package:test1/utils/constants/my_colors.dart';
import 'package:test1/utils/helpers/size_config.dart';

class DropDownPage extends StatefulWidget {
  const DropDownPage({Key? key}) : super(key: key);

  @override
  State<DropDownPage> createState() => _DropDownPageState();
}

class _DropDownPageState extends State<DropDownPage> {
  final formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
    Get.put(DropDownPageController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.color900,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset("assets/png/gerb.png", width: 110.0),
              ),
              Container(
                padding: const EdgeInsets.only(right: 25.0, left: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GetBuilder<DropDownPageController>(builder: (c) {
                      return RegionDropDown(
                          items: c.regions,
                          label: "region".tr,
                          hint: "region".tr,
                          onChanged: (v) {
                            c.typeRegion(v);
                          },
                          onSaved: (v) {
                            c.typeRegion(v);
                          });
                    }),
                    SizedBox(height: SizeConfig.vertical),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GetBuilder<DropDownPageController>(builder: (c) {
                          return ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(MyColors.color800),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  )
                              ),
                            ),
                            onPressed: () {
                              if(c.districtName!= null) {
                                c.typeDistrict(c.districtName??"");
                              } else if(c.regionName != null) {
                                c.typeRegion(c.regionName??"");
                              }
                            },
                            child: const Icon(Icons.refresh, color: MyColors.white),
                          );
                        })
                      ],
                    ),
                    SizedBox(height: SizeConfig.vertical),
                    GetBuilder<DropDownPageController>(builder: (c) {
                      return RegionDropDown(
                        items: c.district,
                        label: "district".tr,
                        hint: "district".tr,
                        onChanged: (v) {
                          c.typeDistrict(v);
                        },
                        onSaved: (v) {
                          c.typeDistrict(v);
                        },
                        selectedValue: c.districtName,
                      );
                    }),
                    SizedBox(height: SizeConfig.vertical*3),
                    GetBuilder<DropDownPageController>(builder: (c) {
                      return RegionDropDown(
                        items: c.organizations,
                        label: "organization".tr,
                        hint: "organization".tr,
                        onChanged: (v) {
                          c.orgName = v;
                          c.update();
                        },
                        onSaved: (v) {
                          c.orgName = v;
                          c.update();
                        },
                        selectedValue: c.orgName,
                      );
                    }),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.vertical*3),
            ],
          ),
        ),
      )
    );
  }

  @override
  void dispose() {
    Get.delete<DropDownPageController>();
    super.dispose();
  }
}
