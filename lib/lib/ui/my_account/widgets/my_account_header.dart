
import 'package:fasateen/lib/static/app_routes.dart';
import 'package:fasateen/lib/static/image_asset.dart';
import 'package:fasateen/lib/ui/global_widgets/go_back.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountHeader extends StatelessWidget {
  const AccountHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        children: [
        Expanded(
            child: Row(
              children: [
                GoBack(),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoute.editMyAccount);
            },
            child: SvgPicture.asset(ImageAsset.editIcon),
          ),
           SizedBox(
            width: Get.width*0.0413194,
          ),


        ],
      ),
    );
  }
}
