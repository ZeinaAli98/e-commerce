
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/static/image_asset.dart';
import 'package:fasateen/lib/ui/add_advertisement/widgets/add_color_and_size.dart';
import 'package:fasateen/lib/ui/global_widgets/custom_background.dart';
import 'package:fasateen/lib/ui/global_widgets/go_back.dart';
import 'package:fasateen/lib/ui/global_widgets/page_large_description.dart';
import 'package:fasateen/lib/ui/global_widgets/price_input.dart';
import 'package:fasateen/lib/ui/global_widgets/primary_button.dart';
import 'package:fasateen/lib/ui/search/filter_pages/search_with_filter_controller.dart';
import 'package:fasateen/lib/ui/search/filter_pages/widgets/network_image_and_text.dart';
import 'package:fasateen/lib/ui/search/filter_pages/widgets/search_common_text.dart';
import 'package:fasateen/lib/ui/search/widgets/boolean_check_box.dart';
import 'package:fasateen/lib/ui/search/widgets/format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchWithFilterPageViewBody
    extends GetView<SearchWithFilterControllerImp> {
  const SearchWithFilterPageViewBody({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchWithFilterControllerImp>(
        builder: (controller) =>  Scaffold(
         resizeToAvoidBottomInset: false,
         body: SafeArea(
          child: CustomBackground(
            child: SizedBox(
              width: Get.width,
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.17,
                    child:  Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GoBack(),
                            Format(),
                          ]),
                    ),
                  ),
                  LargeTitleAndImage(
                    text: "chooseAnAdCategory".tr,
                    imageAsset: ImageAsset.filterIcon,
                  ),
                  SizedBox(
                    height: Get.height * 0.0237127,
                  ),
                  Expanded(
                    child: Container(
                      margin:
                      EdgeInsets.symmetric(horizontal: Get.width * 0.0413194),
                      padding: EdgeInsets.only(bottom: Get.height * 0.0118564),
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SearchCommonText(
                                  text: "item".tr,
                                ),
                                SizedBox(height: Get.height * 0.0177846),
                                NetworkImageAndText(
                                    text: Get.arguments[0],
                                    imageAsset: Get.arguments[1]),
                                SizedBox(height: Get.height * 0.0177846),
                                SearchCommonText(
                                  text: "type".tr,
                                ),
                                SizedBox(
                                  height: Get.height * 0.0237127,
                                ),
                                SizedBox(
                                  height: Get.height * 0.0663957,
                                  child: DropdownMenu(
                                    controller: controller.dropController,
                                    width: Get.width * 0.91,
                                    inputDecorationTheme: InputDecorationTheme(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    dropdownMenuEntries:  [
                                      DropdownMenuEntry(value: 'value', label: 'label')
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.0367127,
                                ),
                                SearchCommonText(
                                  text: "size".tr,
                                ),
                                SizedBox(
                                  height: Get.height * 0.0237127,
                                ),
                                Row(
                                  children: [
                                    GetBuilder(
                                      init: SearchWithFilterControllerImp(),
                                      builder: (controller) =>
                                          Wrap(children: controller.numberList),
                                    ),
                                    AddColorAndSize(
                                      onTap: controller.showNumberDialog,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Get.height * 0.0237127,
                                ),
                                SearchCommonText(
                                  text: "color".tr,
                                ),
                                SizedBox(
                                  height: Get.height * 0.0237127,
                                ),
                                Row(
                                  children: [
                                    GetBuilder(
                                      init: SearchWithFilterControllerImp(),
                                      builder: (controller) =>
                                          Wrap(children: controller.colorsList),
                                    ),
                                    AddColorAndSize(
                                      onTap: controller.showColorDialog,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Get.height * 0.0237127,
                                ),
                                SearchCommonText(
                                  text: "price".tr,
                                ),
                                SizedBox(
                                  height: Get.height * 0.1138211,
                                  child: Form(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        PriceInput(
                                          text: "from".tr,
                                          controller: controller.priceFrom,

                                        ),
                                        PriceInput(
                                          text: "to".tr,
                                          controller: controller.priceTo,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SearchCommonText(
                                  text: "sale/Rent".tr,
                                ),
                                Form(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: Get.height * 0.0296409,
                                      ),
                                      BooleanCheckBox(
                                        text: "sale".tr,
                                        value: controller.saleValue,
                                        onChanged: controller.onChangeSaleValue,
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.0177846,
                                      ),
                                      BooleanCheckBox(
                                        text: "rent".tr,
                                        value: controller.rentValue,
                                        onChanged: controller.onChangeRentValue,
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.0237127,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.0284553,
                                  child: FittedBox(
                                    child: Text(
                                      "theCondition".tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                          color: AppColor.textBodyColor),
                                    ),
                                  ),
                                ),
                                Form(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: Get.height * 0.0296409,
                                      ),
                                      BooleanCheckBox(
                                        text: "new".tr,
                                        value: controller.newValue,
                                        onChanged: controller.onChangeNewValue,
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.0177846,
                                      ),
                                      BooleanCheckBox(
                                        text: "used".tr,
                                        value: controller.useValue,
                                        onChanged: controller.onChangeUseValue,
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.0237127,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.0284553,
                                  child: FittedBox(
                                    child: Text(
                                      "arrangement".tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                          color: AppColor.textBodyColor),
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(children: [
                                      Container(
                                        margin: EdgeInsets.zero,
                                        padding: EdgeInsets.zero,
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: Get.height * 0.0118564),
                                          width: Get.width * 0.0583333,
                                          height: Get.height * 0.0284553,
                                          child: Radio(
                                              value: "hypothetical",
                                              groupValue:controller.filtering,
                                              onChanged: controller.onChangeFilterValue),
                                        ),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.0243056,
                                      ),
                                      SizedBox(
                                          height: Get.height * 0.0284553,
                                          child: FittedBox(
                                              child: Text("hypothetical".tr))),
                                    ]),
                                    Row(children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: Get.height * 0.0118564),
                                        width: Get.width * 0.0583333,
                                        height: Get.height * 0.0284553,
                                        child: Radio(
                                            value: "theHighestPrice",
                                            groupValue: controller.filtering,
                                            onChanged: controller.onChangeFilterValue),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.0243056,
                                      ),
                                      SizedBox(
                                          height: Get.height * 0.0284553,
                                          child: FittedBox(
                                              child: Text("theHighestPrice".tr))),
                                    ]),
                                    Row(children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: Get.height * 0.0118564),
                                        width: Get.width * 0.0583333,
                                        height: Get.height * 0.0284553,
                                        child: Radio(
                                            value: "theLowestPrice",
                                            groupValue: controller.filtering,
                                            onChanged: controller.onChangeFilterValue),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.0243056,
                                      ),
                                      SizedBox(
                                          height: Get.height * 0.0284553,
                                          child: FittedBox(
                                              child: Text("theLowestPrice".tr))),
                                    ]),
                                    Row(children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: Get.height * 0.0118564),
                                        width: Get.width * 0.0583333,
                                        height: Get.height * 0.0284553,
                                        child: Radio(
                                            value: "fromTheMostRecentDate",
                                            groupValue: controller.filtering,
                                            onChanged: controller.onChangeFilterValue),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.0243056,
                                      ),
                                      SizedBox(
                                          height: Get.height * 0.0284553,
                                          child: FittedBox(
                                              child: Text(
                                                  "fromTheMostRecentDate".tr))),
                                    ]),
                                  ],
                                )
                              ]),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin:  EdgeInsets.symmetric(vertical: Get.height*0.0201558),
                    child: PrimaryButton(
                      onPressed: controller.goToAfterSearch,
                      text: "show()Results".tr,
                      backgroundColor: AppColor.primaryColor,
                      textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          letterSpacing: 0.8,
                          color: AppColor.textBodyColorTwo,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

    ));
  }
}
