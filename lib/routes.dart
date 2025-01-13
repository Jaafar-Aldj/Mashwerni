// ignore_for_file: unused_import

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:mashwerni/core/constant/routes.dart';
import 'package:mashwerni/core/middleware/mymiddleware.dart';
import 'package:mashwerni/page/screen/auth/checkemail.dart';
import 'package:mashwerni/page/screen/forgetpassword/forgetpassword.dart';
import 'package:mashwerni/page/screen/auth/login.dart';
import 'package:mashwerni/page/screen/forgetpassword/resetpassword.dart';
import 'package:mashwerni/page/screen/auth/signup.dart';
import 'package:mashwerni/page/screen/forgetpassword/successresetpassword.dart';
import 'package:mashwerni/page/screen/auth/successsignup.dart';
import 'package:mashwerni/page/screen/forgetpassword/verifycode.dart';
import 'package:mashwerni/page/screen/home.dart';
import 'package:mashwerni/page/screen/language.dart';
import 'package:mashwerni/page/screen/onboarding.dart';
import 'package:mashwerni/test.dart';
import 'package:mashwerni/testpage.dart';

List<GetPage<dynamic>>? routes = [
  // OnBoarding
  GetPage(name: "/", page: () => Language(), middlewares: [MyMiddleware()]),
  // GetPage(name: "/", page: () => TestPage()),
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

  // Home
  GetPage(name: AppRoute.home, page: () => Home()),
];
