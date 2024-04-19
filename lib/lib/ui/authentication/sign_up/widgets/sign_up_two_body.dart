
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/static/image_asset.dart';
import 'package:fasateen/lib/static/methods.dart';
import 'package:fasateen/lib/ui/authentication/sign_in/widget/login_background.dart';
import 'package:fasateen/lib/ui/authentication/sign_in/widget/login_text.dart';
import 'package:fasateen/lib/ui/authentication/sign_up/sign_up_two/sign_up_controller_two.dart';
import 'package:fasateen/lib/ui/global_widgets/date_bottom_sheet.dart';
import 'package:fasateen/lib/ui/global_widgets/page_large_description.dart';
import 'package:fasateen/lib/ui/global_widgets/personal_photo.dart';
import 'package:fasateen/lib/ui/global_widgets/primary_button.dart';
import 'package:fasateen/lib/ui/global_widgets/primary_text_body.dart';
import 'package:fasateen/lib/ui/global_widgets/primary_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpTwoViewBody extends GetView<SignUpControllerTwoImp> {
  const SignUpTwoViewBody({
    super.key,});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: alertExitApp,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: LoginBackground(
            child: SizedBox(
              width: Get.width,
              child: ListView(
                children: [
                  SizedBox(
                    height: Get.height * 0.17,
                  ),
                  LargeTitleAndImage(
                    text: "createANewAccount".tr,
                    imageAsset: ImageAsset.authImage,
                  ),
                  PrimaryTextBody(text: "pleaseSubmitYourInformation".tr),
                  Container(
                    margin:  EdgeInsets.symmetric(horizontal: Get.width*0.0413194),
                    child: Form(
                      child: Column(
                        children: [
                          PersonalPhoto(
                            onTap: controller.uploadTheImage,
                          ),
                          SizedBox(
                            height: Get.height * 0.04,
                          ),
                          NameTextField(
                            controller: controller.cityTextEditing,
                            textInputType: TextInputType.name,
                            labelText: "city".tr,
                          ),
                          Obx( ()=>
                           GestureDetector(
                              onTap: () {
                                Get.bottomSheet(
                                  DateBottomSheet(
                                    selectedDate: controller.today, // Pass the selected date here
                                    onDateChanged: controller.showDateChange, // Pass the callback for date changes
                                    onPressed: controller.goBack, // Pass the function to dismiss the bottom sheet
                                  ),
                                );
                              },
                              child: NameTextField(
                                      hintText: controller.formatter,
                                     //controller.formatter
                                      readOnly: true,
                                      enable: false,
                                      suffixIcon: Container(
                                       margin:
                                        EdgeInsets.symmetric(horizontal: Get.width*0.0364583),
                                       height: Get.height*0.0663957,
                                       child: SvgPicture.asset(
                                       ImageAsset.calendarIcon,
                                    ),
                                  ),

                                  textInputType: TextInputType.name,
                                  labelText: "birth".tr,
                                ),

                            ),
                          ),
                          SizedBox(
                            height: Get.height*0.0711382,
                            width: Get.width*0.9187500,
                            child: DropdownButtonFormField(

                                isExpanded: true,
                                decoration: InputDecoration(

                                  labelText: "gender".tr,

                                  floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(color: AppColor.primaryColor),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide:const BorderSide(color:Colors.red),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(horizontal: 45),
                                ),

                                key: controller.dropdownButtonFormFieldKey,
                                value: controller.dropdownButtonFormFieldValue,
                                items: [
                                  DropdownMenuItem(
                                    value: "1",
                                    child: Text("male".tr),
                                  ),
                                  DropdownMenuItem(
                                    value: "2",
                                    child: Text("female".tr),
                                  ),
                                ],
                                onChanged: controller.onChanged),
                          ),
                        ],
                      ),
                    ),
                  ),
                   SizedBox(
                    height: Get.height*0.0177846,
                  ),
                  PrimaryButton(
                    onPressed: controller.stackIndexed,
                    text: "save".tr,
                    backgroundColor: AppColor.primaryColor,
                    textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColor.textBodyColorTwo,
                    ),
                  ),
                  Container(
                    margin:  EdgeInsets.symmetric(vertical: Get.height*0.0118564),
                    child: GestureDetector(
                      onTap: controller.stackIndexed,
                      child: LoginText(
                        text: "skip".tr,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
