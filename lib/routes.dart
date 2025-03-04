// ignore_for_file: unused_import

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:mashwerni/core/constant/routes.dart';
import 'package:mashwerni/core/middleware/mymiddleware.dart';
import 'package:mashwerni/page/screen/auth/checkemail.dart';
import 'package:mashwerni/page/screen/auth/manageraccount.dart';
import 'package:mashwerni/page/screen/auth/managercheck.dart';
import 'package:mashwerni/page/screen/auth/useraccount.dart';
import 'package:mashwerni/page/screen/auth/userormanager.dart';
import 'package:mashwerni/page/screen/forgetpassword/forgetpassword.dart';
import 'package:mashwerni/page/screen/auth/login.dart';
import 'package:mashwerni/page/screen/forgetpassword/resetpassword.dart';
import 'package:mashwerni/page/screen/auth/signup.dart';
import 'package:mashwerni/page/screen/forgetpassword/successresetpassword.dart';
import 'package:mashwerni/page/screen/auth/successsignup.dart';
import 'package:mashwerni/page/screen/forgetpassword/verifycode.dart';
import 'package:mashwerni/page/screen/home.dart';
import 'package:mashwerni/page/screen/homescreen.dart';
import 'package:mashwerni/page/screen/items.dart';
import 'package:mashwerni/page/screen/language.dart';
import 'package:mashwerni/page/screen/manager/addtrip.dart';
import 'package:mashwerni/page/screen/manager/managerhomescreen.dart';
import 'package:mashwerni/page/screen/manager/managertripview.dart';
import 'package:mashwerni/page/screen/manager/tripbooked.dart';
import 'package:mashwerni/page/screen/myfavorite.dart';
import 'package:mashwerni/page/screen/onboarding.dart';
import 'package:mashwerni/page/screen/tripdetails.dart';
import 'package:mashwerni/page/screen/profile.dart';
import 'package:mashwerni/page/screen/settings.dart';
import 'package:mashwerni/page/screen/mytrips.dart';
import 'package:mashwerni/page/screen/tripview.dart';
import 'package:mashwerni/page/widget/home/customitemslisthome.dart';
import 'package:mashwerni/test.dart';
import 'package:mashwerni/testpage.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: "/",
    page: () => Language(),
    middlewares: [MyMiddleware()],
  ),
  // GetPage(name: "/", page: () => Language()),
  GetPage(name: AppRoute.onBoarding, page: () => OnBoarding()),

  // Auth
  GetPage(name: AppRoute.signUp, page: () => SignUp()),
  GetPage(name: AppRoute.login, page: () => Login()),
  GetPage(name: AppRoute.successSignUp, page: () => SuccessSignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => ForgetPassword()),
  GetPage(name: AppRoute.resetPassword, page: () => ResetPassword()),
  GetPage(
      name: AppRoute.successResetPassword, page: () => SuccessResetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => VerifyCode()),
  GetPage(name: AppRoute.checkEmail, page: () => CheckEmail()),
  GetPage(name: AppRoute.userOrManager, page: () => UserOrManager()),
  GetPage(name: AppRoute.userAccount, page: () => UserAccount()),
  GetPage(name: AppRoute.managerAccount, page: () => ManagerAccount()),
  GetPage(name: AppRoute.managerCheck, page: () => ManagerCheck()),

  // Home
  GetPage(name: AppRoute.homeScreen, page: () => HomeScreen()),
  GetPage(name: AppRoute.items, page: () => ItemsPage()),
  GetPage(name: AppRoute.trip, page: () => TripDetails()),
  GetPage(name: AppRoute.myFavorite, page: () => MyFavorite()),
  GetPage(name: AppRoute.home, page: () => Home()),
  GetPage(name: AppRoute.profile, page: () => Profile()),
  GetPage(name: AppRoute.settings, page: () => Settings()),
  GetPage(name: AppRoute.myTrips, page: () => MyTrips()),
  GetPage(name: AppRoute.tripView, page: () => TripView()),

  // ==========================Manager=====================
  GetPage(name: AppRoute.managerHomeScreen, page: () => ManagerHomeScreen()),
  GetPage(name: AppRoute.addTrip, page: () => AddTrip()),
  GetPage(name: AppRoute.managerTripView, page: () => ManagerTripView()),
  GetPage(name: AppRoute.tripBooked, page: () => TripBooked()),
];
