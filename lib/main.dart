import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test1/api/model/init_hive.dart';
import 'package:test1/app.dart';

import 'utils/utils.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _waitBeforeRunningApp();
  runApp(const ProviderScope(child: App()));
}

Future<void> _waitBeforeRunningApp() async {
  await Future.wait([
    MyPrefs.init(),
  ]);
  await InitHive.init();
  await GetStorage.init();
}