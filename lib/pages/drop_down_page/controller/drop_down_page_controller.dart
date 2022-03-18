import 'package:get/get.dart';
import 'package:test1/api/model/init_hive.dart';

class DropDownPageController extends GetxController {

  List<String> regions = InitHive.getRegions();
  List<String> district = [];
  List<String> organizations = [];
  String? districtName;
  String? orgName ;
  int regionId = 0;
  int districtId = 0;
  @override
  void onInit() {
    super.onInit();
    if(regions.isEmpty)  {
      InitHive.saveRegions();
      regions = InitHive.getRegions();
    }
    update();
  }

  void typeRegion(String v) {
    district = [];
    districtName = null;
    organizations = [];
    orgName = null;
    update();
    regionId = InitHive.getRegionId(v);
    InitHive.addDistricts(regionId);
    district = InitHive.getDistricts(regionId);
    update();
  }

  void typeDistrict(String v) {
    districtName = v;
    update();
    organizations = [];
    orgName = null;
    update();
    districtId = InitHive.getDistrictId(v);
    InitHive.addOrganizations(districtId);
    organizations = InitHive.getOrganizations(districtId);
    update();
  }
}