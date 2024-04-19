import 'dart:ui';

import 'package:fasateen/lib/core/services/services.dart';
import 'package:get/get.dart';

class ChangeLocale extends GetxService{
  Locale? language;

  MyServices myServices = Get.put(MyServices());


  changeLanguage(String codeLanguage){
    Locale locale = Locale(codeLanguage);
    myServices.sharedPreferences.setString("lang",codeLanguage);
    Get.updateLocale(locale);

  }

  @override
  void onInit() {
    String? sharedPreferencesLang = myServices.sharedPreferences.getString("lang");
    if(sharedPreferencesLang == "ar"){
      language =  const Locale("ar");
      myServices.sharedPreferences.setString("lang","ar");
    }else if(sharedPreferencesLang == "en"){
      language = const Locale("en");
      myServices.sharedPreferences.setString("lang","en");
    }else{
      language = Locale(Get.deviceLocale!.languageCode);
      myServices.sharedPreferences.setString("lang",Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }

}