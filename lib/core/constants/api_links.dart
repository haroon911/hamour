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
  static const String server = "http://192.168.1.3/hamour";
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
}
