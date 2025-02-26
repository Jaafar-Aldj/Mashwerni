class AppLink {
  static const String server = "http://10.0.2.2/mashwerni";
  static const String test = "$server/test.php";

  // Image
  static const String imageStatic = "http://192.168.43.225/mashwerni/upload";
  static const String imageCategories = "$imageStatic/categories";
  static const String imageItems = "$imageStatic/items";

  // Auth
  static const String auth = "$server/auth";
  static const String signUp = "$auth/signup.php";
  static const String checkEmailVerifyCode = "$auth/verifycode.php";
  static const String login = "$auth/login.php";
  static const String resend = "$auth/resend.php";
  static const String userAccount = "$auth/user_account.php";
  static const String managerAccount = "$auth/manager_account.php";
  static const String managerCheck = "$auth/manager_check.php";

  // Forget Password
  static const String forgetpassword = "$server/forgetpassword";
  static const String checkEmailForgetPassword =
      "$forgetpassword/checkemail.php";
  static const String resetPassword = "$forgetpassword/resetpassword.php";
  static const String verifyCodeForgetPassword =
      "$forgetpassword/verifycode.php";

  // Home
  static const String home = "$server/home/home.php";
  static const String items = "$server/trip/items.php";
  static const String searchItems = "$server/trip/search.php";
  static const String categories = "$server/categories/view.php";
  static const String myTrips = "$server/mytrips/user_mytrips.php";

  // Favorite
  static const String addFav = "$server/trip/add_favorite.php";
  static const String removeFav = "$server/trip/remove_favorite.php";
  static const String viewMyFavorite = "$server/trip/view_my_favorite.php";
  static const String deleteFavorite = "$server/trip/delete_favorite.php";

  // Booking
  static const String book = "$server/booking/book.php";
  static const String bookingCount = "$server/booking/count_to_user.php";

  //  =====================Manager===================
  static const String addTrip = "$server/trip/add_trip.php";
  static const String bookingCountManager =
      "$server/booking/count_to_manager.php";
  static const String managerMyTrips = "$server/mytrips/manager_mytrips.php";
  static const String tripBooked = "$server/mytrips/trip_booked.php";
}
