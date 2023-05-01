import 'package:get/get.dart';
import 'package:untitled/module/Home/screen/addservice_screen.dart';
import 'package:untitled/module/Home/screen/cancle_request_screen.dart';
import 'package:untitled/module/Home/screen/filter_screen.dart';
import 'package:untitled/module/Home/screen/guideprofile_screen.dart';
import 'package:untitled/module/Profile/screen/user_profile_screen.dart';
import 'package:untitled/module/bottom_navbar/screen/bottomnav_bar.dart';
import 'package:untitled/module/Home/screen/request_guide_screen.dart';
import 'package:untitled/module/Home/screen/home_screen.dart';
import 'package:untitled/module/signin/forget_password/enterotp_screen.dart';
import 'package:untitled/module/signin/forget_password/forgetpassword_screen.dart';
import 'package:untitled/module/signin/forget_password/createnew_password.dart';
import 'package:untitled/module/signup/screen/choose_guide.dart';
import 'package:untitled/module/splash_screen/screen/splash_screen.dart';
import 'package:untitled/module/onboarding_screen/screen/account_type_screen.dart';
import 'package:untitled/module/onboarding_screen/screen/onbording_screen.dart';
import 'package:untitled/module/signup/screen/profile_image.dart';
import 'package:untitled/module/signin/signin_screen.dart';
import 'package:untitled/module/signup/screen/signup_screen.dart';

mixin Routes {
  static const defaultTransition = Transition.rightToLeft;

  static const String splashscreen = '/SplashScreen';
  static const String onBoarding = '/OnboardingScreen';
  static const String accountType = '/AccountTypeScreen';
  static const String signInScreen = '/SignInScreen';
  static const String signupScreen = '/SignupScreen';

  static const String profileImage = '/ProfileImage';
  static const String chooseGuide = '/chooseGuid';
  static const String forgetEmail = '/ForgetPassword';

  static const String setNewPassword = '/SetNewPassword';
  static const String enterOtp = '/EnterOTP';


  static const String homeScreen = '/HomeScreen';
  static const String bottomNavBarScreen = '/BottomNavBarScreen';
  static const String requestGuideScreen = '/requestGuideScreen';
  static const String addServiceScreen = '/AddServiceScreen';
  static const String cancelRequestScreen = '/cancelRequestScreen';
  static const String guideProfileScreen = '/guideProfileScreen';
  static const String filerScreen = '/filerScreen';
  static const String profileScreen = '/profileScreen';


  static List<GetPage<dynamic>> pages = [
    GetPage(name: splashscreen, page: () => SplashScreen()),
    GetPage(name: onBoarding, page: () =>  OnBoardingScreen()),
    GetPage(name: accountType, page: () => const AccountTypeScreen()),
    GetPage(name: signInScreen, page: () => SignInScreen()),
    GetPage(name: signupScreen, page: () =>  SignupScreen()),
    GetPage(name: homeScreen, page: () => HomeScreen()),
    GetPage(name: profileImage, page: () => const ProfileImage()),
    GetPage(name: chooseGuide, page: () => const choose_guide()),
    GetPage(name: forgetEmail, page: () => ForgetPassword()),
    GetPage(name: setNewPassword, page: () =>  CreateNewPassword()),
    GetPage(name: enterOtp, page: () =>  EnterOTP()),
    GetPage(name: bottomNavBarScreen, page: () =>  BottomNavBar()),
    GetPage(name: requestGuideScreen, page: () =>  RequestGuideScreen()),
    GetPage(name: addServiceScreen, page: () =>  AddServiceScreen()),
    GetPage(name: cancelRequestScreen, page: () =>  CancleRequestScreen()),
    GetPage(name: guideProfileScreen, page: () =>  GuideProfileScreen()),
    GetPage(name: filerScreen, page: () =>  FilterScreen()),
    GetPage(name: profileScreen, page: () =>  ProfileScreen()),
  ];
}
