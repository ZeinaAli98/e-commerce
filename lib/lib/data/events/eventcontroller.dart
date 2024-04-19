
import 'dart:html';

import 'package:fasateen/lib/core/api/request.dart';
import 'package:fasateen/lib/core/services/services.dart';
import 'package:fasateen/lib/static/api.dart';
import 'package:get/get.dart';
import 'package:story_view/story_view.dart';

abstract class EventsController extends GetxController{
getEvent();

}
class EventsControllerImp extends EventsController{
  MyServices myServices = Get.find<MyServices>();
  ApiClientService apiClientService = Get.find<ApiClientService>();
  List<StoryItem> storyItem=[];

  List<Event> eventsList = [

  ];
  bool isLoading = true;
  @override
  getEvent()async{
    var response = await apiClientService.getRequest(ApiStatic.getStories,
        {
          "": ""
        },
        {
          'Authorization':  myServices.sharedPreferences.getString("token")
        });


  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getEvent();
  }


}
class EventsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => EventsControllerImp());
  }

}