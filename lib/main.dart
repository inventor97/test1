import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test1/app.dart';
import 'package:test1/utils/constants/http_overrides.dart';

import 'utils/utils.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _waitBeforeRunningApp();
  runApp(const App());
}

Future<void> _waitBeforeRunningApp() async {
  await Future.wait([
    MyPrefs.init(),
  ]);
  await GetStorage.init();
  HttpOverrides.global = MyHttpOverrides();
}