
import 'package:fasateen/lib/core/api/request.dart';
import 'package:fasateen/lib/core/services/services.dart';
import 'package:fasateen/lib/data/models/notifications_model.dart';
import 'package:fasateen/lib/static/api.dart';
import 'package:get/get.dart';

abstract class NotificationController extends GetxController {
  getResponse();
}

class NotificationControllerImp extends NotificationController {

  MyServices myServices = Get.find<MyServices>();
  ApiClientService apiClientService = Get.find<ApiClientService>();
  NotificationModel notificationApi = NotificationModel();

  List<NotificationResult> notificationsList = [];
  bool isLoading = true;

  @override
  getResponse()async{
    var getNotifications = await apiClientService.getRequest(ApiStatic.notifications,
    {
      "": ""
    },
    {
      'Authorization':  myServices.sharedPreferences.getString("token")
    });
    if(getNotifications !=null) sendNotificationData(getNotifications);
  }
  sendNotificationData(value){
    NotificationModel.fromJson(value.data);
    notificationsList = NotificationModel.fromJson(value.data).result!;
    isLoading = false;
    update();
  }

  @override
  void onInit() {
    getResponse();

    super.onInit();
  }
}

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationControllerImp());
  }
}