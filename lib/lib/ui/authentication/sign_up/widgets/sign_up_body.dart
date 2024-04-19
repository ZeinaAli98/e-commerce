
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/static/image_asset.dart';
import 'package:fasateen/lib/ui/authentication/sign_in/widget/login_background.dart';
import 'package:fasateen/lib/ui/authentication/sign_in/widget/login_text.dart';
import 'package:fasateen/lib/ui/authentication/sign_up/sign_up_one/sign_up_controller.dart';
import 'package:fasateen/lib/ui/global_widgets/page_large_description.dart';
import 'package:fasateen/lib/ui/global_widgets/primary_button.dart';
import 'package:fasateen/lib/ui/global_widgets/primary_text_body.dart';
import 'package:fasateen/lib/ui/global_widgets/primary_text_field.dart';

import '../../../../core/services/services.dart';
import '../../sign_in/widget/number_text_field.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignUpViewBody extends GetView<SignUpControllerImp> {
   SignUpViewBody({
    super.key,});
  MyServices myServices = Get.put(MyServices());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: LoginBackground(
          child: Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                width: Get.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.17,
                    ),
                    LargeTitleAndImage(
                      imageAsset: ImageAsset.authImage,
                      text: "createANewAccount".tr,
                    ),
                    PrimaryTextBody(text: "pleaseSubmitYourInformation".tr),
                    Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                           SizedBox(
                            height:  Get.height*0.0177846,
                          ),
                          NameTextField(
                            validator: controller.nameValidation,
                            controller: controller.firstNameController,
                            textInputType: TextInputType.name,
                            labelText: "firstName".tr,
                          ),
                          NameTextField(
                            validator: controller.nameValidation,
                            controller: controller.lastNameController,
                            textInputType: TextInputType.name,
                            labelText: "lastName".tr,
                          ),
                          myServices.sharedPreferences.getString("lang") == "en"?
                          NumberTextField(
                            labelText: "phone".tr,
                            contrroller: controller.phoneNumberController,
                            validator: controller.phoneNumberValidation,
                          ):
                          NumberTextFieldAr(
                            labelText: "phone".tr,
                            contrroller: controller.phoneNumberController,
                            validator: controller.phoneNumberValidation,
                          ),
                          myServices.sharedPreferences.getString("lang") == "en"?
                          NumberTextField(
                            labelText: "whatsAppPhone".tr,
                            contrroller: controller.whatsappNumberController,
                            validator: controller.whatsappNumberValidation,
                          ):
                          NumberTextFieldAr(
                            labelText: "whatsAppPhone".tr,
                            contrroller: controller.whatsappNumberController,
                            validator: controller.whatsappNumberValidation,
                          ),

                          GetBuilder<SignUpControllerImp>(builder: (controller)=>
                            PrimaryTextField(
                              controller: controller.passwordController,
                              obscureText:controller.isShowPassword,
                              iconData:Icons.visibility_outlined,
                              onTapIcon: (){
                                controller.showPassword();
                              },
                              labelText: "Enter your password".tr,
                              validator:
                              controller.passwordValidation,
                            ),


                          ),
                          GetBuilder<SignUpControllerImp>(builder: (controller)=>
                              PrimaryTextField(
                              controller: controller.confirmationPasswordController,
                                obscureText:controller.isShowPassword,
                                iconData:Icons.visibility_outlined,
                                onTapIcon: (){
                                  controller.showPassword();
                                },
                              labelText: "Password confirmation".tr,
                              validator:
                              controller.passwordConfirmationValidation,
                            ),
                          ),
                          Row(children: [
                             SizedBox(
                              width: Get.width*0.0486111,
                            ),
                            SizedBox(
                              width: Get.width*0.0486111,
                              height: Get.height*0.0237127,
                              child: GetBuilder(
                                  init: SignUpControllerImp(),
                                  builder: (controller) {
                                    return Checkbox(
                                      value: controller.isChecked,
                                      onChanged: controller.onChangeValue,
                                      activeColor: AppColor.termsAndConditions,
                                      checkColor: AppColor.textBodyColorTwo,
                                      side: const BorderSide(width: 1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    );
                                  }),
                            ),
                             SizedBox(
                              width: Get.width*0.0243056
                            ),
                            Text(
                              "byClickingCreate".tr,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ]),
                          Row(children: [
                             SizedBox(
                              width: Get.width*0.1215278,
                            ),
                            GestureDetector(
                              onTap: controller.termsAndConditions,
                              child: Text(
                                "termsAndConditions".tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                  color: AppColor.termsAndConditions,
                                ),
                              ),
                            ),
                          ]),
                           SizedBox(
                            height: Get.height*0.0237127,
                          ),
                          PrimaryButton(
                            onPressed:controller.goToVerification,
                            text: "createANewAccount".tr,
                            backgroundColor: AppColor.primaryColor,
                            textStyle:
                            Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: AppColor.textBodyColorTwo,
                            ),
                          ),
                          Container(
                            margin:  EdgeInsets.symmetric(vertical: Get.height*0.0118564),
                            child: GestureDetector(
                              onTap: controller.loginPage,
                              child: LoginText(
                                text: "signIn".tr,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
