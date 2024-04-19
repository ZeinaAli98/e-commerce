
import 'package:fasateen/lib/ui/search/filter_pages/widgets/search_bar_with_red_point.dart';
import 'package:fasateen/lib/ui/search/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AfterSearchingWithFilterPageView
    extends GetView<SearchPageControllerImp> {
  const AfterSearchingWithFilterPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SearchBarWithRedPoint(),
          ],
        ),
      ),
    );
  }
}

