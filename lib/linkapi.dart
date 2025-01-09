class AppLink {
  static const String server = "http://10.0.2.2/mashwerni";
  static const String test = "$server/test.php";

  // Auth
  static const String auth = "$server/auth";
  static const String signUp = "$auth/signup.php";
  static const String checkEmailVerifyCode = "$auth/verifycode.php";
  static const String login = "$auth/login.php";

  // Forget Password
  static const String forgetpassword = "$server/forgetpassword";
  static const String checkEmailForgetPassword =
      "$forgetpassword/checkemail.php";
  static const String resetPassword = "$forgetpassword/resetpassword.php";
  static const String verifyCodeForgetPassword =
      "$forgetpassword/verifycode.php";
}
