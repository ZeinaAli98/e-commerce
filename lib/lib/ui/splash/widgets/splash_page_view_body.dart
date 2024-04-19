
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/static/image_asset.dart';
import 'package:fasateen/lib/ui/splash/splash_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPageViewBody extends StatelessWidget {
  const SplashPageViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: SplashPageControllerImp(),
        builder: (controller) => SafeArea(
          child: Container(
            color: AppColor.splashViewBackground,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                child: Column(
                  children: [
                    const Spacer(),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(ImageAsset.rightStar),
                        ],
                      ),
                    ),
                    const Spacer(),
                    SvgPicture.asset(ImageAsset.splashImage),
                  const Spacer(),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SvgPicture.asset(ImageAsset.leftStar,
                                alignment: Alignment.centerRight)
                          ]),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
