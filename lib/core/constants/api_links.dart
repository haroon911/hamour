/// for real phone setup
/// first from computer we go to cmd and write ipconfig
/// second we copy the ip and write it down here>>> then done :)
// const String serverLinkName = "http://192.168.1.5/hamour";
// const String serverLinkName = "http://10.0.2.2/hamour"; // for emulator
// const String serverLinkName = "http://127.0.0.1/hamour"; //for pc
// const String linkSignup = "$serverLinkName/auth/signup.php";
// const String linkLogin = "$serverLinkName/auth/login.php";
// //Note Crud Links
// const String linkAddNote = "$serverLinkName/notes/add.php";
// const String linkEditNote = "$serverLinkName/notes/edit.php";
// const String linkDeleteNote = "$serverLinkName/notes/delete.php";
// const String linkViewNote = "$serverLinkName/notes/view.php";
// const String linkImageRoot = "$serverLinkName/upload/";

class ApiLinks {
  //keep changin serverLinkName with your server link or in local write your ipconfig in cmd
  static const String _ipAddress = "192.168.1.4";
  static const String server = "http://$_ipAddress/hamour";
  static const String _imageLink = "$server/upload";
  //test
  static const String test = "$server/test.php";
  // ----------------- Auth Links
  static const String signup = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String signupVerification = "$server/auth/verification.php";
  // ----------------- Forgot Password Links
  static const String resetPassword =
      "$server/forgot_password/reset_password.php";
  static const String checkEmail = "$server/forgot_password/check_email.php";
  static const String verificationReset =
      "$server/forgot_password/verification.php";
  //------------------ category
  static const String categories = "$server/components/categories.php";
  static const String home = "$server/home.php";
  // ++++++++++++++ images importing
  static const String categoryImages = "$_imageLink/categories";
  static const String offerImages = "$_imageLink/offers";
  static const String productImages = "$_imageLink/products";
  // ----------------  Products
  static const String products = "$server/components/products.php";
  // ============ store_repositry
  static const String addOnStore = "$server/components/store_repositry/add.php";
  static const String removeFromStore = "$server/components/store_repositry/remove.php";
  static const String storeProducts = "$server/components/store_repositry/view.php";
}
