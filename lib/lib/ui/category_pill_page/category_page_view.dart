import 'package:fasateen/lib/ui/category_pill_page/widgets/category_page_view_body.dart';

import 'package:flutter/material.dart';
import 'category_page_controller.dart';
import 'package:get/get.dart';

class CategoryPillPageView extends GetView<CategoryPillPageControllerImp> {
  const CategoryPillPageView({super.key});

  @override
  Widget build(BuildContext context) {

    return WillPopScope(onWillPop: (){
      Get.back();
      controller.categoryId = 0;
      return Future<bool>(() => true);
    },child: const CategoryPillPageViewBody());
  }
}

