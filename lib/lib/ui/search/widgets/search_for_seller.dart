
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/ui/search/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../static/api.dart';
import '../../../static/app_routes.dart';
import '../../my_account/my_account_controller.dart';

class SearchForSellers extends GetView<SearchPageControllerImp> {
    SearchForSellers({
    super.key,
    required this.searchList,
    required this.textEditing,
    required this.timer,
    required this.isLoading,
  });

  final bool isLoading;
  final List searchList;
  final String textEditing;
  // ignore: prefer_typing_uninitialized_variables
  final timer;
  MyAccountControllerImp myAccountControllerImp=Get.put(MyAccountControllerImp());
  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        children: isLoading
            ? <Widget>[
          const SizedBox(
            height: 5,
          ),
          Center(
            child: CircularProgressIndicator(
              color: AppColor.primaryColor,
            ),
          ),
        ]
            : searchList.isEmpty
            ? [
          FutureBuilder(
              future: timer,
              builder:
                  (BuildContext context, AsyncSnapshot<String> text) {
                return textEditing.split("").isNotEmpty
                    ? Center(
                  child: Text(text.data ?? ""),
                )
                    : const Center(
                  child: Text(
                    "",
                  ),
                );
              })
        ]
            : searchList
            .map(
              (e) => Container(
            margin: const EdgeInsets.symmetric(vertical: 7.5,horizontal: 10),
            child: Row(children: [
              const Spacer(),
              Container(
                width: 340,
                height: 91,
                decoration: BoxDecoration(
                  color: AppColor.whiteBackground,
                  borderRadius: BorderRadius.circular(10),
                ),
                child:GestureDetector(
                  child: Row(children: [
                               const Spacer(),
                               Container(
                                 width: 320,
                                 height: 91,
                                 margin: const EdgeInsets.symmetric(
                                     vertical: 6, horizontal: 10),
                                 padding: const EdgeInsets.symmetric(
                                   horizontal: 10,
                                 ),
                                 decoration: BoxDecoration(
                                   color: AppColor.whiteBackground,
                                   borderRadius: BorderRadius.circular(10),
                                 ),
                                 child: Row(
                                   children: [
                                     Column(children: [
                                       const Spacer(),
                                       SizedBox(
                                         width: 63,
                                         height: 63,
                                         child: ClipRRect(
                                           borderRadius: BorderRadius.circular(50),
                                           child:
                                           Image.network(
                                             e.image,
                                             errorBuilder:
                                                 (context, error, stackTrace) =>
                                             const Center(child: Text("hello")),
                                           ),
                                         ),
                                       ),
                                       const Spacer(),
                                     ]),
                                     const SizedBox(
                                       width: 20,
                                     ),
                                     Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         const Spacer(),
                                         Text(
                                         e.fullName ,
                                           style: Theme.of(context)
                                               .textTheme
                                               .displaySmall!
                                               .copyWith(color: AppColor.textHeadColor),
                                         ),
                                         const SizedBox(
                                           height: 10,
                                         ),
                                         Text(
                                             "${myAccountControllerImp.myProductsList.length.toString()} product".tr,
                                           style: Theme.of(context).textTheme.bodySmall!,
                                         ),
                                         const Spacer(),
                                       ],
                                     )
                                   ],
                                 ),
                               ),
                               const Spacer(),
                             ] ,
                           ),
                  onTap: (){

                  },
                ),
              ),
              const Spacer(),
            ]),
          ),
        )
            .toList());
  }
}

