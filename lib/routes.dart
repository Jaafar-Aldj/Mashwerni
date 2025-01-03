import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:mashwerni/core/constant/routes.dart';
import 'package:mashwerni/core/middleware/mymiddleware.dart';
import 'package:mashwerni/page/screen/auth/checkemail.dart';
import 'package:mashwerni/page/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:mashwerni/page/screen/auth/login.dart';
import 'package:mashwerni/page/screen/auth/forgetpassword/resetpassword.dart';
import 'package:mashwerni/page/screen/auth/signup.dart';
import 'package:mashwerni/page/screen/auth/forgetpassword/successresetpassword.dart';
import 'package:mashwerni/page/screen/auth/successsignup.dart';
import 'package:mashwerni/page/screen/auth/forgetpassword/verifycode.dart';
import 'package:mashwerni/page/screen/language.dart';
import 'package:mashwerni/page/screen/onboarding.dart';
import 'package:mashwerni/test.dart';

List<GetPage<dynamic>>? routes = [
  // OnBoarding
  GetPage(name: "/", page: () => Language(), middlewares: [MyMiddleware()]),
  // GetPage(name: "/", page: () => Test()),
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
];
