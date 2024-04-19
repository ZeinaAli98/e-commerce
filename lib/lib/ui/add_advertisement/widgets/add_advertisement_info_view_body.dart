
import 'dart:ffi';


import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/ui/add_advertisement/add_advertisement_controller.dart';
import 'package:fasateen/lib/ui/add_advertisement/widgets/DropdownTextField.dart';
import 'package:fasateen/lib/ui/add_advertisement/widgets/add_color_and_size.dart';
import 'package:fasateen/lib/ui/add_advertisement/widgets/add_common_text.dart';
import 'package:fasateen/lib/ui/add_advertisement/widgets/add_video_and_picture.dart';
import 'package:fasateen/lib/ui/add_advertisement/widgets/large_discription_and_network_image.dart';
import 'package:fasateen/lib/ui/global_widgets/custom_background.dart';
import 'package:fasateen/lib/ui/global_widgets/go_back.dart';
import 'package:fasateen/lib/ui/global_widgets/price_input.dart';
import 'package:fasateen/lib/ui/global_widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAdvertisementInfoPageViewBody
    extends GetView<AddAdvertisementControllerImp> {
  const AddAdvertisementInfoPageViewBody({super.key,});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomBackground(
          child: SizedBox(
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.17,
                  child: const GoBack(),
                ),
                Center(
                  child: LargeDescriptionAndNetworkImage(
                    text: Get.arguments[0],
                    imageAsset: Get.arguments[1],
                  ),
                ),
                 SizedBox(
                  height: Get.height*0.023713,
                ),
                Expanded(
                  child: Container(
                    margin:  EdgeInsets.symmetric(horizontal: Get.width*0.0437500),
                    child: ListView(children: <Widget>[
                      AddCommonText(text: "productPictures".tr),
                       SizedBox(
                        height: Get.height*0.0284553,
                      ),
                      AddVideoOrPicture(
                        onTap: () {

                        },
                      ),
                       SizedBox(
                        height: Get.height*0.0237127,
                      ),
                      AddCommonText(text: Get.arguments[2]),
                      CustomDropdownFormField(
                        onChanged: controller.onChangedType,
                        dropdownButtonFormFieldKey:
                        controller.dropdownButtonFormFieldKeyType,
                        dropdownButtonFormFieldValue:
                        controller.dropdownButtonFormFieldValueType,
                        items: controller.itemsType,
                      ),
                      AddCommonText(text: "sale/Rent".tr),
                      CustomDropdownFormField(
                        onChanged: controller.onChangedSaleOrRent,
                        dropdownButtonFormFieldKey:
                        controller.dropdownButtonFormFieldKeySaleOrRent,
                        dropdownButtonFormFieldValue:
                        controller.dropdownButtonFormFieldValueSaleOrRent,
                        items: controller.itemsSaleOrRent,
                      ),
                      AddCommonText(text: Get.arguments[3]),
                      CustomDropdownFormField(
                        onChanged: controller.onChangedCondition,
                        dropdownButtonFormFieldKey:
                        controller.dropdownButtonFormFieldKeyCondition,
                        dropdownButtonFormFieldValue:
                        controller.dropdownButtonFormFieldValueCondition,
                        items: controller.itemsCondition,
                      ),
                      AddCommonText(text: "fabricType".tr),
                      CustomDropdownFormField(
                        onChanged: controller.onChangedFabricType,
                        dropdownButtonFormFieldKey:
                        controller.dropdownButtonFormFieldKeyFabricType,
                        dropdownButtonFormFieldValue:
                        controller.dropdownButtonFormFieldValueFabricType,
                        items: controller.itemsFabricType,
                      ),
                      AddCommonText(text: "size".tr),
                       SizedBox(
                        height: Get.height*0.0237127,
                      ),
                      Row(
                        children: [
                          GetBuilder(
                            init: AddAdvertisementControllerImp(),
                            builder: (controller) =>
                                Wrap(children: controller.numberList),
                          ),

                          AddColorAndSize(
                            onTap: controller.showNumberDialog,
                          ),
                        ],
                      ),
                       SizedBox(
                        height: Get.height*0.0237127,
                      ),
                      AddCommonText(text: "color".tr),
                       SizedBox(
                         height: Get.height*0.0237127,
                      ),
                      Row(
                        children: [
                          GetBuilder(
                            init: AddAdvertisementControllerImp(),
                            builder: (controller) =>
                                Wrap(children: controller.colorsList),
                          ),
                          AddColorAndSize(
                            onTap: controller.showColorDialog,
                          ),
                        ],
                      ),
                       SizedBox(
                        height: Get.height*0.0237127,
                      ),
                      AddCommonText(text: "priceBeforeDiscount".tr),
                       SizedBox(
                        height: Get.height*0.0237127,
                      ),
                      const PriceInput(),
                       SizedBox(
                        height: Get.height*0.0237127,
                      ),
                      AddCommonText(text: "price".tr),
                       SizedBox(
                        height: Get.height*0.0237127,
                      ),
                      const PriceInput(),
                       SizedBox(
                        height: Get.height*0.0237127,
                      ),
                      AddCommonText(text: "rentalPricePerDayBeforeDiscount".tr),
                       SizedBox(
                        height: Get.height*0.0237127,
                      ),
                      const PriceInput(),
                        SizedBox(
                         height: Get.height*0.0237127,
                      ),
                      AddCommonText(text: "rentalPricePerDay".tr),
                       SizedBox(
                        height: Get.height*0.0237127,
                      ),
                      const PriceInput(),
                       SizedBox(
                        height: Get.height*0.0237127,
                      ),
                      AddCommonText(text: "theDescription".tr),
                       SizedBox(
                        height: Get.height*0.0237127,
                      ),
                      SizedBox(
                        child: TextField(
                          cursorColor:AppColor.primaryColor,
                          decoration: InputDecoration(

                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: AppColor.primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                      ),
                       SizedBox(
                        height: Get.height*0.0237127,
                      ),
                      PrimaryButton(
                        onPressed: () {

                          controller.postAdvertisement;
                        },
                        text: "postTheAdvertisement".tr,
                        backgroundColor: AppColor.primaryColor,
                        textStyle:
                        Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColor.textBodyColorTwo,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                       SizedBox(
                        height: Get.height*0.0237127,
                      )
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
