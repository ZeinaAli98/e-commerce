
import 'package:fasateen/lib/core/services/services.dart';
import 'package:fasateen/lib/data/models/customer_products.dart';
import 'package:get/get.dart';

import '../../core/api/request.dart';
import '../../static/api.dart';
import 'mysellerModel.dart';

abstract class SellersAccountController extends GetxController {
  customersInfo();
}

class SellersAccountControllerImp extends SellersAccountController {
  MyServices myServices = Get.find<MyServices>();

  ApiClientService apiClientService = Get.find<ApiClientService>();
  MySellerModel mySellerModel=MySellerModel();
  List mySeller=[];
  String language = "";

  List<CustomerProducts> customersProductsList = [];
  customersInfo()async{
    var getSellers =
        await apiClientService.getRequest(ApiStatic.getMySeller, {"page":"0"}, {
      'Accept': 'application/json',
      'Authorization': myServices.sharedPreferences.getString("token"),
    });
    mySellerModel.fromJsonArray(getSellers.data);
    mySeller = mySellerModel.fromJsonArray(getSellers.data);


  }

  @override
  void onInit() {
    customersInfo();
    language = myServices.sharedPreferences.getString("lang")!;
    super.onInit();
  }
}
class SellersAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SellersAccountControllerImp());
  }

}