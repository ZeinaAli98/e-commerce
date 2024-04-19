
import 'package:fasateen/lib/about_app/binding.dart';
import 'package:fasateen/lib/about_app/get_pages.dart';
import 'package:fasateen/lib/core/localization/translation.dart';
import 'package:fasateen/lib/core/services/services.dart';
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/static/style.dart';
import 'package:fasateen/lib/ui/splash/splash_page_view.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core/localization/change_locale.dart';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data/models/fire_base_notification.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBf1YChqAlG7t5bOsGY8MhoMFAi8IX35Gs",
          appId: "1:440469402330:android:3b44eb539f95334c416be3",
          messagingSenderId: "440469402330",
          projectId: "fasateen-vroad"));
  await FireBaseNotification().initNotification();
  await initServices();
  AppBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ChangeLocale changeLocale = Get.put(ChangeLocale());
    StyleModel styleModel = Get.put(StyleModel());
    return GetMaterialApp(
      title: "Fasateen",

      theme: ThemeData(
        primaryColor: AppColor.primaryColor,
        fontFamily: "Poppins",
        colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: AppColor.primaryColor,
            onPrimary: AppColor.whiteBackground,
            secondary: AppColor.primaryColor,
            onSecondary: AppColor.primaryColor,
            error: AppColor.deleteColor,
            onError: AppColor.deleteColor,
            background: AppColor.whiteBackground,
            onBackground: AppColor.whiteBackground,
            surface: AppColor.whiteBackground,
            onSurface: Colors.black),
        textTheme: TextTheme(
          displayLarge: styleModel.displayLarge,
          displayMedium: styleModel.displayMedium,
          displaySmall: styleModel.displaySmall,
          bodyLarge: styleModel.bodyLarge,
          bodyMedium: styleModel.bodyMedium,
          bodySmall: styleModel.bodySmall,
        ),
        // Set your desired text color for the calendar
      ),
      debugShowCheckedModeBanner: false,
      locale: changeLocale.language,
      translations: MyTranslation(),
      initialBinding: AppBinding(),
      home: SplashPageView(),
      getPages: getPages,
      // routes: routes,
    );
  }
}
