import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:test1/api/services/region_api.dart';
import 'package:test1/utils/helpers/my_prefs.dart';

class DropDownPageController extends GetxController {

  Map<int, String> regionsMap = {};
  Map<int, String> districtsMap = {};
  Map<int, String> orgsMap = {};

  String? districtName = MyPrefs.getDistrict();
  String? regionName = MyPrefs.getRegion();
  String? orgName = MyPrefs.getOrg();


  List<String> district = [];
  List<String> regions = [];
  List<String> organizations = [];

  int regionId = 0;
  int districtId = 0;

  bool isLoading = false;

  bool hasInternet = true;

  @override
  void onInit() async {
    super.onInit();
    initCtrl();
  }

  Future<void> initCtrl() async {
    hasInternet = await InternetConnectionChecker().hasConnection;
    if(hasInternet) {
      Future.wait([
        getRegions()
      ]).then((a) => {
        regions = List<String>.from(regionsMap.values.map((value) => value).toList()),
        if(regionName != null) {
          regionId = regionsMap.keys.firstWhere((e) => regionsMap[e] == regionName),
          update(),
          loadData(),
        },
        update(),
      });
    } else{
      district.add(districtName??"");
      regions.add(regionName??"");
      organizations.add(orgName??"");
    }
    update();
  }

  void typeRegion(String v) async {
    _clearData();
    regionId = regionsMap.keys.firstWhere((e) => regionsMap[e] == v);
    isLoading = true;
    regionName = v;
    await MyPrefs.setRegion(v);
    hasInternet = await InternetConnectionChecker().hasConnection;
    update();
    refreshList();
  }

  void refreshList() {
    Future.wait([
      getDistricts(regionId),
      Future.delayed(const Duration(milliseconds: 500))
    ]).then((value) => {
      district = List<String>.from(districtsMap.values.map((e) => e)).toList(),
      isLoading =  false,
      update(),
    });
  }

  void loadData() {
    Future.wait([
      getDistricts(regionId),
      Future.delayed(const Duration(milliseconds: 500))
    ]).then((value) => {
      district = List<String>.from(districtsMap.values.map((e) => e)).toList(),
      districtId = districtsMap.keys.firstWhere((e) => districtsMap[e] == districtName),
      isLoading =  false,
      _loadOrg(),
      update(),
    });
  }

  void _clearData() {
    district = [];
    districtsMap = {};
    orgsMap = {};
    districtName = null;
    organizations = [];
    orgName = null;
    update();
  }

  Future<void> getDistricts(int id) async {
    districtsMap = await RegionData.getDistricts(id);
  }

  Future<void> getRegions() async {
    regionsMap = await RegionData.getRegions();
    regionsMap;
  }

  Future<void> getOrganization(int id) async {
    orgsMap = await RegionData.getOrganizations(id);
  }

  void _loadOrg() async {
    Future.wait([
      getOrganization(districtId),
    ]).then((value) => {
      organizations = List<String>.from(orgsMap.values.map((e) => e)).toList(),
      update(),
    });
  }

  void typeDistrict(String v) async {
    orgsMap = {};
    organizations = [];
    orgName = null;
    districtName = v;
    districtId = districtsMap.keys.firstWhere((e) => districtsMap[e] == districtName);
    await MyPrefs.setDistrict(v);
    update();
    Future.wait([
      getOrganization(districtId),
    ]).then((value) => {
      organizations = List<String>.from(orgsMap.values.map((e) => e)).toList(),
      update(),
    });
  }
}