import 'package:get/get.dart';

abstract class ConnectUs extends GetxController{
}
class ConnectUsImp extends ConnectUs{


}
class ConnectUsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ConnectUsImp());
  }

}