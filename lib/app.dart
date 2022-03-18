
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:test1/utils/helpers/messages.dart';
import 'package:test1/utils/helpers/my_theme.dart';
import 'package:test1/utils/helpers/services/theme_service.dart';
import 'wrapper.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Messages(),
      locale: const Locale('ru', 'RU'),
      fallbackLocale: const Locale('ru', 'RU'),
      theme: MyTheme().lightTheme,
      darkTheme: MyTheme().darkTheme,
      themeMode: ThemeService().getThemeMode(),
      home: const Wrapper(),
    );
  }
}
