import 'package:fasateen/lib/ui/terms_and_conditions/terms_and_conditions_controller.dart';
import 'package:fasateen/lib/ui/terms_and_conditions/widgets/terms_body.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsAndConditionsView extends GetView<TermsAndConditionsImp> {
  const TermsAndConditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const TermsBody();
  }
}

