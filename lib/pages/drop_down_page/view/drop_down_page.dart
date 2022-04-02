import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:test1/pages/drop_down_page/components/region_drop_down.dart';
import 'package:test1/pages/drop_down_page/controller/drop_down_page_controller.dart';
import 'package:test1/utils/constants/my_colors.dart';
import 'package:test1/utils/helpers/my_prefs.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.color700,
      body: Form(
        key: formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(right: 15.0, left: 15.0, top: 20.0),
                child: Image.asset("assets/png/logo.png", width: SizeConfig.h*53, height: SizeConfig.v*45),
              ),
              SizedBox(
                width: SizeConfig.h*80,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GetBuilder<DropDownPageController>(builder: (c) {
                      return RegionDropDown(
                        selectedValue: c.regionName,
                        items: c.regions,
                        label: "region".tr,
                        hint: "region".tr,
                        onChanged: (v) {
                          c.typeRegion(v);
                        },
                        loadable: false,
                      );
                    }),
                    SizedBox(height: SizeConfig.v*3),
                    GetBuilder<DropDownPageController>(builder: (c) {
                      return RegionDropDown(
                        items: c.district,
                        label: "district".tr,
                        hint: "district".tr,
                        onChanged: (v) {
                          c.typeDistrict(v);
                        },
                        selectedValue: c.districtName,
                        loadable: c.isLoading,
                        hasInternet: c.hasInternet,
                        onUpdate: c.refreshList,
                      );
                    }),
                    SizedBox(height: SizeConfig.v*3),
                    GetBuilder<DropDownPageController>(builder: (c) {
                      return RegionDropDown(
                        items: c.organizations,
                        label: "organization".tr,
                        hint: "organization".tr,
                        onChanged: (v) async {
                          c.orgName = v;
                          await MyPrefs.setOrg(v);
                          c.update();
                        },
                        selectedValue: c.orgName,
                        loadable: false,
                      );
                    }),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.v*2),
            ],
          ),
        )
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<DropDownPageController>();
    super.dispose();
  }
}
