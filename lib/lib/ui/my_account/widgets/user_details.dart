
import 'package:fasateen/lib/core/services/services.dart';
import 'package:fasateen/lib/static/image_asset.dart';
import 'package:fasateen/lib/ui/my_account/widgets/user_page_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({
    super.key,
    required this.productText,
    required this.productsNumber,
    required this.visitorsText,
    required this.visitorsNumber,
  });

  final String productText;
  final String productsNumber;
  final String visitorsText;
  final String visitorsNumber;

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find<MyServices>();
    return Row(
      children: [
        SizedBox(width: Get.width *0.128,),
        UserPageText(
          number: productsNumber,
          text: productText,
        ),
     const Spacer(),
        Stack(children: [
          SizedBox(
            height: Get.height*0.1102642,
            width: Get.width*0.2260417,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  myServices.sharedPreferences.getString("image") ?? "",
                  errorBuilder: (context, error, stackTrace) => SvgPicture.asset(ImageAsset.avatar),
                  fit: BoxFit.cover,
                )),
          ),
        ]),
        const Spacer(),
        UserPageText(
          number: visitorsNumber,
          text: visitorsText,
        ),
        const SizedBox(width: 63,),
      ],
    );
  }
}
