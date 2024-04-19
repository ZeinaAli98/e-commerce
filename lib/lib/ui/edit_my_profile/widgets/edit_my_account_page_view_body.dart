
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/ui/authentication/sign_in/widget/number_text_field.dart';
import 'package:fasateen/lib/ui/edit_my_profile/edit_my_acount_controller.dart';
import 'package:fasateen/lib/ui/global_widgets/date_bottom_sheet.dart';
import 'package:fasateen/lib/ui/global_widgets/go_back.dart';
import 'package:fasateen/lib/ui/global_widgets/page_large_description.dart';
import 'package:fasateen/lib/ui/global_widgets/personal_photo.dart';
import 'package:fasateen/lib/ui/global_widgets/primary_button.dart';
import 'package:fasateen/lib/ui/global_widgets/primary_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/services/services.dart';
import '../../../static/image_asset.dart';

class EditMyAccountPageViewBody extends GetView<EditMyAccountControllerImp> {
   EditMyAccountPageViewBody({
    super.key,
  });
  MyServices myServices = Get.put(MyServices());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          color: AppColor.whiteBackground,
          child: Column(
            children: [
              const GoBack(),
              SizedBox(
                height: Get.height * 0.0426829,
                width: Get.width,
              ),
              LargeTitleAndImage(
                text: "editAccountInformation".tr,
                imageAsset: ImageAsset.editImagePage,
              ),
              SizedBox(
                height: Get.height * 0.0355691,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: Get.width * 0.0413194),
                height: Get.height * 0.6,
                child: ListView(scrollDirection: Axis.vertical, children: [
                  PersonalPhoto(
                    onTap: controller.uploadTheImage,
                  ),
                  Form(
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.0296409,
                        ),
                        NameTextField(
                          validator: controller.nameValidation,
                          controller: controller.fullNameController,
                          textInputType: TextInputType.name,
                          labelText: "fullName".tr,
                        ),
                        myServices.sharedPreferences.getString("lang") == "en"?
                        NumberTextField(
                          labelText: "phone".tr,
                          contrroller: controller.phoneController,
                        ):
                        NumberTextFieldAr(
                          labelText: "phone".tr,
                          contrroller: controller.phoneController,
                        ),
                        myServices.sharedPreferences.getString("lang") == "en"?
                        NumberTextField(
                          labelText: "whatsAppNumber".tr,
                          contrroller: controller.wPhoneController,
                        ):
                        NumberTextFieldAr(
                          labelText: "whatsAppNumber".tr,
                          contrroller: controller.wPhoneController,
                        ),
                        NameTextField(
                          controller: controller.cityController,
                          textInputType: TextInputType.name,
                          labelText: "city".tr,
                        ),
                        Obx(()
                          => GestureDetector(
                            onTap: () {
                              print("Table Calender pressed....");
                              Get.bottomSheet(
                                DateBottomSheet(
                                  selectedDate: controller.today, // Pass the selected date here
                                  onDateChanged: controller.showDateChange, // Pass the callback for date changes
                                  onPressed: controller.goBack, // Pass the function to dismiss the bottom sheet
                                ),
                              );

                            },
                            child:  NameTextField(
                                hintText: controller.formatter,

                                enable: false,
                                suffixIcon: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: Get.width * 0.0364583),
                                  height: Get.height * 0.0663957,
                                  child: SvgPicture.asset(
                                    ImageAsset.calendarIcon,
                                  ),
                                ),
                                textInputType: TextInputType.name,
                                labelText: "birth".tr,
                              ),
                            ),
                        ),

                        DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButtonFormField(
                              borderRadius: BorderRadius.circular(15),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                                labelText: "gender".tr,
                                floatingLabelStyle:
                                    TextStyle(color: AppColor.primaryColor),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(color: AppColor.primaryColor),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 1),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              key: controller.dropdownButtonFormFieldKey,
                              value: controller.dropdownButtonFormFieldValue,
                              items: [
                                DropdownMenuItem(
                                  value: "1",
                                  child: Theme(
                                    data: Theme.of(context).copyWith(
                                      buttonTheme:
                                          ButtonTheme.of(context).copyWith(
                                        alignedDropdown: true,
                                      ),
                                    ),
                                    child: Text("Female".tr),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: "2",
                                  child: Text("Male".tr),
                                ),
                              ],
                              onChanged: controller.onChanged,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.0296409,
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              const Spacer(),
              PrimaryButton(
                onPressed: controller.editInfo,
                text: "saveModifications".tr,
                backgroundColor: AppColor.primaryColor,
                textStyle: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: AppColor.textBodyColorTwo),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
