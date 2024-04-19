
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/static/image_asset.dart';
import 'package:fasateen/lib/static/methods.dart';
import 'package:fasateen/lib/ui/indexed_stack/indexed_stack_controller.dart';
import 'package:fasateen/lib/ui/indexed_stack/widgets/bottom_app_bar_body.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndexedStackViewBody extends StatelessWidget {
  const IndexedStackViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndexedStackControllerImp>(
      builder:(controller)=> Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: FloatingActionButton(
          onPressed: controller.fifthCondition,
          backgroundColor: AppColor.primaryColor,
          child: SvgPicture.asset(ImageAsset.plusIcon),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation
            .centerDocked,
        bottomNavigationBar: const BottomAppBarBody(),
        body: WillPopScope(
          onWillPop: alertExitApp,
          child: IndexedStack(
              index: controller.currentBottomBarIndex,
              key: controller.indexedStackKey,
              children: controller.pages
          ),
        ),

      ),
    );
  }
}


