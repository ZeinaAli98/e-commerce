import 'package:get/get.dart';

abstract class TermsAndConditions extends GetxController{
}
class TermsAndConditionsImp extends TermsAndConditions{


}
class TermsAndConditionBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => TermsAndConditionsImp());
  }

}