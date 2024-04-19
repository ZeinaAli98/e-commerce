
import 'package:fasateen/lib/core/localization/change_locale.dart';
import 'package:fasateen/lib/core/services/services.dart';
import 'package:get/get.dart';

abstract class LanguagePageController extends GetxController {}

class LanguagePageControllerImp extends LanguagePageController {
  MyServices myServices = Get.find<MyServices>();
  ChangeLocale changeLocale = Get.find<ChangeLocale>();

////////////////////////////////
  dynamic onChanged;

  String? groupValue ;

  var selectedItem ="".obs;
  void upDateSelectedItem(String value)
  {
    selectedItem.value= value;
    groupValue=value;
    changeLocale.changeLanguage(value);
    update();
  }
  @override
  void onInit() {
    groupValue = myServices.sharedPreferences.getString("lang");
    super.onInit();
      onChanged = (value) {
      groupValue = value;
      changeLocale.changeLanguage(value);
      update();
    };
  }

}
class LanguageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LanguagePageControllerImp());
  }

}
