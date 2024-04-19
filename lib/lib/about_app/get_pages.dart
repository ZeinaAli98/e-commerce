
import 'package:fasateen/lib/about_app/middleware.dart';
import 'package:fasateen/lib/static/app_routes.dart';
import 'package:fasateen/lib/ui/authentication/sign_in/login_controller.dart';
import 'package:fasateen/lib/ui/authentication/sign_in/login_page_view.dart';
import 'package:fasateen/lib/ui/authentication/sign_up/sign_up_one/sign_up_controller.dart';
import 'package:fasateen/lib/ui/authentication/sign_up/sign_up_one/sign_up_view.dart';
import 'package:fasateen/lib/ui/authentication/sign_up/sign_up_two/sign_up_controller_two.dart';
import 'package:fasateen/lib/ui/authentication/sign_up/sign_up_two/sign_up_two_view.dart';
import 'package:fasateen/lib/ui/authentication/verification/verification_controller.dart';
import 'package:fasateen/lib/ui/authentication/verification/verification_page_view.dart';
import 'package:fasateen/lib/ui/category/categories_controller.dart';
import 'package:fasateen/lib/ui/category/categories_page_view.dart';
import 'package:fasateen/lib/ui/discount/discount_controller.dart';
import 'package:fasateen/lib/ui/discount/discount_page_view.dart';
import 'package:fasateen/lib/ui/favorite/favorite_controller.dart';
import 'package:fasateen/lib/ui/favorite/favorite_page_view.dart';
import 'package:fasateen/lib/ui/home/home_controller.dart';
import 'package:fasateen/lib/ui/home/home_page_view.dart';
import 'package:fasateen/lib/ui/notifications/notifcation_controller.dart';
import 'package:fasateen/lib/ui/notifications/notifications_page_view.dart';
import 'package:fasateen/lib/ui/search/filter_pages/search_with_filter_controller.dart';
import 'package:fasateen/lib/ui/search/filter_pages/search_with_filter_page_view.dart';
import 'package:fasateen/lib/ui/search/search_controller.dart';
import 'package:fasateen/lib/ui/search/search_page_view.dart';
import 'package:fasateen/lib/ui/setting/setting_controller.dart';
import 'package:fasateen/lib/ui/setting/setting_page_view.dart';

import '../data/events/event_page_view.dart';
import '../data/events/eventcontroller.dart';
import '../ui/add_advertisement/add_advertisement_controller.dart';
import '../ui/add_advertisement/add_advertisement_info_view.dart';
import '../ui/category_pill_page/category_page_controller.dart';
import '../ui/category_pill_page/category_page_view.dart';
import '../ui/contact_us/contact_us_page_view.dart';
import '../ui/contact_us/contactcontroller.dart';
import '../ui/edit_my_profile/edit_my_account_page_view.dart';
import '../ui/edit_my_profile/edit_my_acount_controller.dart';
import '../ui/indexed_stack/indexed_stack_controller.dart';
import '../ui/indexed_stack/indexed_stack_view.dart';
import '../ui/language/language_controller.dart';
import '../ui/language/language_page_view.dart';
import '../ui/my_account/my_account_controller.dart';
import '../ui/my_account/my_account_page_view.dart';
import '../ui/privacy_policy/privacy_policy_page_view.dart';
import '../ui/privacy_policy/privacycontroller.dart';
import '../ui/product/product_controller.dart';
import '../ui/product/product_page_view.dart';
import '../ui/search/filter_pages/after_searching_filter_page_view.dart';

import 'package:get/get.dart';

import '../ui/sellers/sellers_account_controller.dart';
import '../ui/sellers/sellers_account_page_view.dart';
import '../ui/terms_and_conditions/terms_and_conditions_controller.dart';
import '../ui/terms_and_conditions/terms_and_conditions_page_view.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(
      name: AppRoute.login,
      page: () => const LoginPageView(),
      binding: LoginBinding(),
      middlewares: [AuthMiddleWare()]),
  GetPage(
      name: AppRoute.signUpOne,
      page: () => const SignUpView(),
      binding: SignUpBinding()),
  GetPage(
      name: AppRoute.signUpTwo,
      page: () => const SignUpTwoView(),
      binding: SignUpTwoBinding()),
  GetPage(
      name: AppRoute.verification,
      page: () => const VerificationPageView(),
      binding: VerificationBinding()),
  GetPage(
      name: AppRoute.indexedStack,
      page: () => const IndexedStackView(),
      binding: IndexStackBinding()),
  GetPage(
      name: AppRoute.home,
      page: () => const HomePageView(),
      binding: HomeBinding()),
  GetPage(
      name: AppRoute.favorite,
      page: () => const FavoritePageView(),
      binding: FavoriteBinding()),
  GetPage(
      name: AppRoute.discount,
      page: () => const DiscountPageView(),
      binding: DiscountBinding()),
  GetPage(
      name: AppRoute.setting,
      page: () => const SettingPageView(),
      binding: SettingBinding()),
  GetPage(
      name: AppRoute.notifications,
      page: () => const NotificationsPageView(),
      binding: NotificationBinding()),
  GetPage(
      name: AppRoute.search,
      page: () => const SearchPageView(),
      binding: SearchBinding()),
  GetPage(
      name: AppRoute.categories,
      page: () => const CategoriesPageView(),
      binding: CategoryBinding()),
  GetPage(
      name: AppRoute.categoryPill,
      page: () => const CategoryPillPageView(),
      binding: CategoryPillPageBinding()),
  GetPage(
      name: AppRoute.searchWithFilter,
      page: () => const SearchWithFilterPageView(),
      binding: SearchWithFilterBinding()),
  GetPage(
      name: AppRoute.afterSearchingWithFilter,
      page: () => const AfterSearchingWithFilterPageView(),
      binding: SearchBinding()),
  GetPage(
      name: AppRoute.productPage,
      page: () => const ProductPageView(),
      binding: ProductBinding()),
  GetPage(
      name: AppRoute.addAdvertisementInfo,
      page: () => const AddAdvertisementInfoPageView(),
      binding: AddAdvertisementBinding()),
  GetPage(
      name: AppRoute.myAccount,
      page: () => const MyAccountPageView(),
      binding: MyAccountBinding()),
  GetPage(
      name: AppRoute.editMyAccount,
      page: () => const EditMyAccountPageView(),
      binding: EditMyAccountBinding()),
  GetPage(
      name: AppRoute.sellersAccount,
      page: () => const SellersAccountPageView(),
      binding: SellersAccountBinding()),
  GetPage(
      name: AppRoute.eventPageView,
      page: () =>  EventPageView(),
      binding: EventsBinding()),
  GetPage(
      name: AppRoute.language,
      page: () => const LanguagePageView(),
      binding: LanguageBinding()),
  GetPage(
      name: AppRoute.termsAndCondition,
      page: () => const TermsAndConditionsView(),
      binding: TermsAndConditionBinding()),
  GetPage(
      name: AppRoute.privacyPolicy,
      page: () => const PrivacyPolicyPageView(),
      binding: PrivacyPolicyBinding()),
  GetPage(
      name: AppRoute.contactUs,
      page: () => const ConnectUsPageView(),
      binding: ConnectUsBinding()),

];
