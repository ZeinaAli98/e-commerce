
import 'package:fasateen/lib/core/localization/language/arabic.dart';
import 'package:fasateen/lib/core/localization/language/english.dart';
import 'package:get/get.dart';

class MyTranslation extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    "ar":arabicLanguage,
    "en":englishLanguage,
  };

}