
import 'package:fasateen/lib/static/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/story_view.dart';
import 'package:story_view/widgets/story_view.dart';

import 'eventcontroller.dart';

class EventPageView extends StatefulWidget {
  EventPageView({Key? key}) : super(key: key);

  @override
  State<EventPageView> createState() => _EventPageViewState();
}

class _EventPageViewState extends State<EventPageView> {
  EventsControllerImp controllerImp = Get.put(EventsControllerImp());
  final StoryController controller = StoryController();
  List<StoryItem> storyItem = [];

  @override
  void initState() {
    controllerImp.getEvent();
    super.initState();
  }

  Widget build(BuildContext context) {
    return
       Scaffold(
        body: Stack(
          children: [

            StoryView(
              // storyItems: List.generate(
              //     controllerImp.eventsList.length,
              //     (index) => StoryItem.text(
              //         title: controllerImp.eventsList[index].text!,
              //         duration: const Duration(seconds: 10), backgroundColor: AppColor.primaryColor)),
              controller: controller,
              inline: true,
              indicatorColor: AppColor.borderBoxColor,
              indicatorForegroundColor:AppColor.storyColor ,
              progressPosition: ProgressPosition.top,
              onVerticalSwipeComplete: (direction) {
                if (direction == Direction.down) {
                  Get.back();
                }
              }, storyItems: [
              StoryItem.text(title: "HI How Are You...", duration: const Duration(seconds: 20), backgroundColor: Colors.deepPurpleAccent),
              StoryItem.pageVideo("https://v3.cdnpk.net/videvo_files/video/free/2014-12/large_watermarked/Raindrops_Videvo_preview.mp4", controller: controller,shown: false),
              StoryItem.pageImage(url: "https://images.freeimages.com/images/large-previews/ddf/tour-d-eiffel-1447025.jpg", controller: controller,shown: false)


            ],
            ),
            Container(
                alignment: Alignment.topLeft,
                margin:  const EdgeInsets.symmetric(vertical: 20,horizontal: 5),
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 5),
                child: IconButton(onPressed: (){
                  Get.back();
                },icon: Icon(Icons.arrow_forward,color: AppColor.pseudoGrey,),),),
          ],
          
        ));
  }
}
