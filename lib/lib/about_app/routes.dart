
import 'package:fasateen/lib/data/events/event_page_view.dart';
import 'package:fasateen/lib/static/app_routes.dart';
import 'package:fasateen/lib/ui/add_advertisement/add_advertisement_info_view.dart';
import 'package:fasateen/lib/ui/authentication/sign_in/login_page_view.dart';
import 'package:fasateen/lib/ui/authentication/sign_up/sign_up_one/sign_up_view.dart';
import 'package:fasateen/lib/ui/authentication/sign_up/sign_up_two/sign_up_two_view.dart';
import 'package:fasateen/lib/ui/authentication/verification/verification_page_view.dart';
import 'package:fasateen/lib/ui/category/categories_page_view.dart';
import 'package:fasateen/lib/ui/category_pill_page/category_page_view.dart';
import 'package:fasateen/lib/ui/discount/discount_page_view.dart';
import 'package:fasateen/lib/ui/edit_my_profile/edit_my_account_page_view.dart';
import 'package:fasateen/lib/ui/home/home_page_view.dart';
import 'package:fasateen/lib/ui/language/language_page_view.dart';
import 'package:fasateen/lib/ui/my_account/my_account_page_view.dart';
import 'package:fasateen/lib/ui/notifications/notifications_page_view.dart';
import 'package:fasateen/lib/ui/privacy_policy/privacy_policy_page_view.dart';
import 'package:fasateen/lib/ui/search/filter_pages/after_searching_filter_page_view.dart';
import 'package:fasateen/lib/ui/search/filter_pages/search_with_filter_page_view.dart';
import 'package:fasateen/lib/ui/search/search_page_view.dart';
import 'package:fasateen/lib/ui/sellers/sellers_account_page_view.dart';
import 'package:fasateen/lib/ui/setting/setting_page_view.dart';
import 'package:fasateen/lib/ui/splash/splash_page_view.dart';
import 'package:fasateen/lib/ui/terms_and_conditions/terms_and_conditions_page_view.dart';

import '../ui/contact_us/contact_us_page_view.dart';

import '../ui/favorite/favorite_page_view.dart';
import '../ui/indexed_stack/indexed_stack_view.dart';
import '../ui/product/product_page_view.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes ={
  AppRoute.splash                   : (context)=> const SplashPageView(),
  AppRoute.login                    : (context)=> const LoginPageView(),
  AppRoute.signUpOne                : (context)=> const SignUpView(),
  AppRoute.signUpTwo                : (context)=> const SignUpTwoView(),
  AppRoute.termsAndCondition        : (context)=> const TermsAndConditionsView(),
  AppRoute.verification             : (context)=> const VerificationPageView(),
  AppRoute.indexedStack             : (context)=> const IndexedStackView(),
  AppRoute.home                     : (context)=> const HomePageView(),
  AppRoute.categoryPill             : (context)=> const CategoryPillPageView(),
  AppRoute.discount                 : (context)=> const DiscountPageView(),
  AppRoute.favorite                 : (context)=> const FavoritePageView(),
  AppRoute.setting                  : (context)=> const SettingPageView(),
  AppRoute.language                 : (context)=> const LanguagePageView(),
  AppRoute.privacyPolicy            : (context)=> const PrivacyPolicyPageView(),
  AppRoute.contactUs                : (context)=> const ConnectUsPageView(),
  AppRoute.categories               : (context)=> const CategoriesPageView(),
  AppRoute.notifications            : (context)=> const NotificationsPageView(),
  AppRoute.search                   : (context)=> const SearchPageView(),
  AppRoute.searchWithFilter         : (context)=> const SearchWithFilterPageView(),
  AppRoute.addAdvertisementInfo     : (context)=> const AddAdvertisementInfoPageView(),
  AppRoute.afterSearchingWithFilter : (context)=> const AfterSearchingWithFilterPageView(),
  AppRoute.myAccount                : (context)=> const MyAccountPageView(),
  AppRoute.editMyAccount            : (context)=> const EditMyAccountPageView(),
  AppRoute.productPage              : (context)=> const ProductPageView(),
  AppRoute.sellersAccount           : (context)=> const SellersAccountPageView(),
  AppRoute.eventPageView                 : (context)=> EventPageView(),
};