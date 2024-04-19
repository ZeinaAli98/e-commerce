
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/static/image_asset.dart';
import 'package:fasateen/lib/static/methods.dart';
import 'package:fasateen/lib/ui/authentication/sign_in/login_controller.dart';
import 'package:fasateen/lib/ui/authentication/sign_in/widget/login_background.dart';
import 'package:fasateen/lib/ui/authentication/sign_in/widget/login_text.dart';
import 'package:fasateen/lib/ui/authentication/sign_in/widget/number_text_field.dart';
import 'package:fasateen/lib/ui/global_widgets/page_large_description.dart';
import 'package:fasateen/lib/ui/global_widgets/primary_button.dart';
import 'package:fasateen/lib/ui/global_widgets/primary_text_body.dart';
import 'package:fasateen/lib/ui/global_widgets/primary_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/localization/language/arabic.dart';
import '../../../../core/localization/language/english.dart';
import '../../../../core/services/services.dart';
import '../../../../static/popupcondition.dart';

class LoginBody extends GetView<LoginPageControllerImp> {
  LoginBody({
    super.key,
  });
 final List dropDownList =[
   "العربية ","English"
   ];
  MyServices myServices = Get.put(MyServices());
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
              child: Expanded(
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                      Obx(() =>  Container(
                        height: Get.height* 0.045,
                        width: Get.width* 0.26,
                        decoration: BoxDecoration(borderRadius:BorderRadius.circular(15),border:Border.all(color:AppColor.primaryColor)),
                        alignment: Alignment.topCenter,
                        margin: EdgeInsets.symmetric(horizontal: Get.width* 0.048,vertical: Get.height* 0.021),
                        padding: EdgeInsets.symmetric(horizontal: Get.width* 0.003148,),
                        child: DropdownButton<String>(
                        padding:EdgeInsets.symmetric(horizontal: Get.width* 0.01) ,
                        focusColor: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(15),
                        value: controller.selectedItem.value==""? "English":controller.selectedItem.value,
                        onChanged: (newValue){
                         controller.upDateSelectedItem(newValue.toString());
                          if(newValue.toString()=="English"){
                            Get.updateLocale(Locale("en"));
                            myServices.sharedPreferences.setString("lang","en");

                          }else{
                            Get.updateLocale(Locale("ar"));
                            myServices.sharedPreferences.setString("lang","ar");
                          }
                       },
                       items:
                       dropDownList.map<DropdownMenuItem<String>>((value) {
                         return DropdownMenuItem<String>(
                             value: value,
                             child:Text(value)
                         );
                       }).toList(),

                     ),
                     ))  ,
                      SizedBox(
                        height: Get.height * 0.17,
                      ),
                      Center(
                        child: LargeTitleAndImage(
                          text: "signIn".tr,
                          imageAsset: ImageAsset.authImage,
                        ),
                      ),
                      Center(
                        child: PrimaryTextBody(
                          text: "willSendMessage".tr,
                        ),
                      ),
                      SizedBox(height: Get.height*0.0355691,),
                      Center(
                        child: Form(
                          key: controller.formKey,
                          child: Column(children: [
                            myServices.sharedPreferences.getString("lang") == "en"?
                            NumberTextField(
                              colored: controller.colored,
                              onChanged: controller.onChangePassword,
                              labelText: "phone".tr,
                              contrroller: controller.phoneNumberController,
                              validator: controller.phoneNumberValidation,

                            ):
                            NumberTextFieldAr(
                              colored: controller.colored,
                              onChanged: controller.onChangePassword,
                              labelText: "phone".tr,
                              contrroller: controller.phoneNumberController,
                              validator: controller.phoneNumberValidation,

                            )
                            ,

                            GetBuilder<LoginPageControllerImp>(
                              builder: (controller) =>
                                  PrimaryTextField(
                                    obscureText: controller.isShowPassword,
                                    iconData:Icons.visibility_outlined,
                                    onTapIcon: (){
                                      controller.showPassword();
                                    },
                                    controller: controller.passwordController,
                                    validator: controller.passwordValidation,
                                    labelText: "Enter your password".tr,
                                  ),
                            ),
                          ]),
                        ),
                      ),
                      Center(
                        child: PrimaryButton(
                          onPressed: controller.openTheBottomSheet,
                          text: "signIn".tr,
                          backgroundColor: AppColor.primaryColor,
                          textStyle: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: AppColor.textBodyColorTwo),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.0237127,
                      ),
                      Center(
                        child: LoginText(
                          onTap:controller.goToSingUp,
                          text: "createANewAccount".tr,
                        ),
                      ),

                    ],)



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
