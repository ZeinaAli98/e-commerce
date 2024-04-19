import 'package:get/get.dart';

abstract class PrivacyPolicy extends GetxController{
}
class PrivacyPolicyImp extends PrivacyPolicy{


}
class PrivacyPolicyBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PrivacyPolicyImp());
  }

}