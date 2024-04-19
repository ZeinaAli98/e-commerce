
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/ui/category_pill_page/category_page_controller.dart';
import 'package:fasateen/lib/ui/category_pill_page/widgets/category_pill_back_button.dart';
import 'package:fasateen/lib/ui/global_widgets/under_line_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class CategoryUpPart extends GetView<CategoryPillPageControllerImp> {
  const CategoryUpPart({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.whiteBackground,
      height: Get.height * 0.097222,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          children: [
            const CategoryPillBackButton(),
            SizedBox(
              width: Get.width * 0.23,
            ),
            UnderLineText(text: text),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
