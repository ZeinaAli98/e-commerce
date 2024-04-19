
import 'package:fasateen/lib/static/api.dart';
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/static/image_asset.dart';
import 'package:fasateen/lib/ui/global_widgets/go_back.dart';
import 'package:fasateen/lib/ui/product/product_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/services/services.dart';


class ProductPageViewBody extends GetView<ProductControllerImp> {
   const ProductPageViewBody( {

    super.key,
  });



  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find<MyServices>();


    return  Scaffold(
      body:
      controller.Loading?
      const Center(child: CircularProgressIndicator(),)
      : SafeArea(
               child: Column(
               children: [
                 Directionality(
                  textDirection: TextDirection.ltr,
                  child: Container(
                  height: Get.height * 0.08252,
                  color: AppColor.whiteBackground,
                  child: Row(
                    children: <Widget>[
                      const GoBack(),
                      const Spacer(),
                      SvgPicture.asset(ImageAsset.likeButton),
                      SizedBox(
                        width: Get.width * 0.036458,
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(ImageAsset.shareIcon)),
                      SizedBox(
                        width: Get.width * 0.041319,
                      ),
                    ],
                  ),
                ),
              ),

                SizedBox(
                width: Get.width,
                height: Get.width,
                child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.productsDetailsList.length,
                    itemBuilder: (BuildContext context, index) {
                      return GestureDetector(
                        onTap: () {

                        },
                        child: Container(
                          width: Get.width,
                          height: 415,
                          color: Colors.amber,
                          child: Image.network(
                            "${ApiStatic.baseUrl}/public/${controller.productsDetailsList[index].result!.video}",
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                              color: Colors.amber,
                            ),
                          ),
                        ),

                      );
                    }),
              ),
                  Expanded(
                     child: ListView(

                       children: [
                         Container(
                           alignment: Alignment.centerLeft,
                           margin: EdgeInsets.symmetric(horizontal:Get.width*0.04 ,vertical:Get.height*0.016 ),
                           child: Text(controller.productsDetails.result!.enName!.tr,
                             style: TextStyle(
                               fontSize: Get.width *0.07,
                               fontWeight: FontWeight.w700,
                               color: AppColor.textHeadColor,

                             ),
                           ),
                         ),
                         Container(
                           alignment: Alignment.centerLeft,
                           margin: EdgeInsets.symmetric(horizontal:Get.width*0.04 ,vertical:Get.height*0.016 ),
                           child: Text("Price".tr,
                             style: TextStyle(
                               fontSize: Get.width *0.0434,
                               fontWeight: FontWeight.w400,
                               color: AppColor.textBodyColor,
                             ),
                           ),
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Container(

                               margin: EdgeInsets.symmetric(horizontal:Get.width*0.04 ,vertical:Get.height*0.016 ),
                               child: Text("${controller.productsDetails.result!.price!.toString()} s.p".tr,
                                 style: TextStyle(
                                   fontSize: Get.width *0.053,
                                   fontWeight: FontWeight.w500,
                                   color: AppColor.deleteColor,

                                 ),
                               ),
                             ),
                             SizedBox(width: Get.width*0.036),
                             Container(
                               margin: EdgeInsets.symmetric( vertical:Get.height*0.016 ),
                               child: Stack(
                                 children: [
                                   Text("-------",style: TextStyle(
                                     fontSize: Get.width *0.048,
                                     fontWeight: FontWeight.w400,
                                     color: AppColor.borderBoxColor,

                                   ) ,),
                                   Text("${controller.productsDetails.result!.rentPrice!.toString()} s.p",
                                     style: TextStyle(
                                       fontSize: Get.width *0.048,
                                       fontWeight: FontWeight.w400,
                                       color: AppColor.borderBoxColor,

                                     ),)
                                 ],
                               ),
                             ),

                           ],
                         ),
                         Container(
                           alignment: Alignment.centerLeft,
                           margin: EdgeInsets.symmetric(horizontal:Get.width*0.04 ,vertical:Get.height*0.016 ),
                           child: Text("Description".tr,
                             style: TextStyle(
                               fontSize: Get.width *0.0534,
                               fontWeight: FontWeight.w700,
                               color: AppColor.textBodyColor,
                             ),
                           ),
                         ),
                         Container(
                           alignment: Alignment.centerLeft,
                           margin: EdgeInsets.symmetric(horizontal:Get.width*0.04 ,vertical:Get.height*0.016 ),
                           child: Text(controller.productsDetails.result!.enDescription!.tr,
                             style: TextStyle(
                               fontSize: Get.width *0.0434,
                               fontWeight: FontWeight.w500,
                               color: AppColor.textBodyColor,
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),


            ],
          ),
        ),

    );
  }

}
