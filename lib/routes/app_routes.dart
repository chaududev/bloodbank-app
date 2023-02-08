import 'package:bloodapp2/presentation/history_sign_screen/binding/history_sign_binding.dart';
import 'package:bloodapp2/presentation/history_sign_screen/history_sign_screen.dart';
import 'package:bloodapp2/presentation/home_index_screen/home_index_screen.dart';
import 'package:bloodapp2/presentation/home_index_screen/binding/home_index_binding.dart';
import 'package:bloodapp2/presentation/home_urgent_screen/home_urgent_screen.dart';
import 'package:bloodapp2/presentation/home_urgent_screen/binding/home_urgent_binding.dart';
import 'package:bloodapp2/presentation/home_urgentdetail_screen/home_urgentdetail_screen.dart';
import 'package:bloodapp2/presentation/home_urgentdetail_screen/binding/home_urgentdetail_binding.dart';
import 'package:bloodapp2/presentation/blooddonation_loginwarning_screen/blooddonation_loginwarning_screen.dart';
import 'package:bloodapp2/presentation/blooddonation_loginwarning_screen/binding/blooddonation_loginwarning_binding.dart';
import 'package:bloodapp2/presentation/blooddonation_register_one_screen/blooddonation_register_one_screen.dart';
import 'package:bloodapp2/presentation/blooddonation_register_one_screen/binding/blooddonation_register_one_binding.dart';
import 'package:bloodapp2/presentation/blooddonation_register_screen/blooddonation_register_screen.dart';
import 'package:bloodapp2/presentation/blooddonation_register_screen/binding/blooddonation_register_binding.dart';
import 'package:bloodapp2/presentation/blooddonation_registered_screen/blooddonation_registered_screen.dart';
import 'package:bloodapp2/presentation/blooddonation_registered_screen/binding/blooddonation_registered_binding.dart';
import 'package:bloodapp2/presentation/profile_index_screen/profile_index_screen.dart';
import 'package:bloodapp2/presentation/profile_index_screen/binding/profile_index_binding.dart';
import 'package:bloodapp2/presentation/profile_register_screen/profile_register_screen.dart';
import 'package:bloodapp2/presentation/profile_register_screen/binding/profile_register_binding.dart';
import 'package:bloodapp2/presentation/profile_login_screen/profile_login_screen.dart';
import 'package:bloodapp2/presentation/profile_login_screen/binding/profile_login_binding.dart';
import 'package:bloodapp2/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:bloodapp2/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:bloodapp2/presentation/update_account_info/binding/update_account_binding.dart';
import 'package:bloodapp2/presentation/update_account_info/update_account_info_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static String homeIndexScreen = '/home_index_screen';

  static String homeNewsdetailScreen = '/home_newsdetail_screen';

  static String homeUrgentScreen = '/home_urgent_screen';

  static String homeUrgentdetailScreen = '/home_urgentdetail_screen';

  static String blooddonationLoginwarningScreen =
      '/blooddonation_loginwarning_screen';

  static String blooddonationRegisterOneScreen =
      '/blooddonation_register_one_screen';

  static String blooddonationRegisterScreen = '/blooddonation_register_screen';

  static String blooddonationRegisteredScreen =
      '/blooddonation_registered_screen';

  static String profileIndexScreen = '/profile_index_screen';

  static String profileRegisterScreen = '/profile_register_screen';

  static String profileLoginScreen = '/profile_login_screen';

  static String appNavigationScreen = '/app_navigation_screen';

  static String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: homeIndexScreen,
      page: () => HomeIndexScreen(),
      bindings: [
        HomeIndexBinding(),
      ],
    ),
    // GetPage(
    //   name: homeNewsdetailScreen,
    //   page: () => HomeNewsdetailScreen(),
    //   bindings: [
    //     HomeNewsdetailBinding(),
    //   ],
    // ),
    GetPage(
      name: homeUrgentScreen,
      page: () => HomeUrgentScreen(),
      bindings: [
        HomeUrgentBinding(),
      ],
    ),
    GetPage(
      name: homeUrgentdetailScreen,
      page: () => HomeUrgentdetailScreen(),
      bindings: [
        HomeUrgentdetailBinding(),
      ],
    ),
    GetPage(
      name: blooddonationLoginwarningScreen,
      page: () => BlooddonationLoginwarningScreen(),
      bindings: [
        BlooddonationLoginwarningBinding(),
      ],
    ),
    GetPage(
      name: blooddonationRegisterOneScreen,
      page: () => BlooddonationRegisterOneScreen(),
      bindings: [
        BlooddonationRegisterOneBinding(),
      ],
    ),
    GetPage(
      name: blooddonationRegisterScreen,
      page: () => BlooddonationRegisterScreen(),
      bindings: [
        BlooddonationRegisterBinding(),
      ],
    ),
    GetPage(
      name: blooddonationRegisteredScreen,
      page: () => BlooddonationRegisteredScreen(),
      bindings: [
        BlooddonationRegisteredBinding(),
      ],
    ),
    GetPage(
      name: profileIndexScreen,
      page: () => ProfileIndexScreen(),
      bindings: [
        ProfileIndexBinding(),
      ],
    ),
    GetPage(
      name: profileRegisterScreen,
      page: () => ProfileRegisterScreen(),
      bindings: [
        ProfileRegisterBinding(),
      ],
    ),
    GetPage(
      name: profileLoginScreen,
      page: () => LoginScreen(),
      bindings: [
        ProfileLoginBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => HomeIndexScreen(),
      bindings: [
        HomeIndexBinding(),
      ],
    ),
    GetPage(
      name: "/history_sign",
      page: () => HistorySignScreen(),
      bindings: [
        HistorySignBinding(),
      ],
    ),
    GetPage(
      name: "/user_update_info",
      page: () => UpdateInfoAccountScreen(),
      bindings: [
        UpdateAccountInfoBinding(),
      ],
    )
  ];
}
