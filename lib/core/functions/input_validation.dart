import 'package:get/get.dart';

// inputValidator(String value, int min, int max, String type) {
//   if (value.isEmpty) {
//     return "Value can't be empty";
//   }
//   if (type == "username" || type == "email" || type == "phoneNumber") {
//     if (!GetUtils.isUsername(value) ||
//         !GetUtils.isEmail(value) ||
//         !GetUtils.isPhoneNumber(value)) {
//       return "invalid $type";
//     }
//   }
//   if (value.length < min) {
//     return "can't be less than $min characters";
//   }
//   if (value.length > max) {
//     return "can't be greater than $min characters";
//   }

// }

emailInputValidator(String value) {
  if (value.isEmpty) {
    return "emailNullError".tr;
  } else if (!GetUtils.isEmail(value)) {
    return "invalidEmailError".tr;
  } else {
    return null;
  }
}

passwordInputValidator(String value) {
  if (value.isEmpty) {
    return "passNullError".tr;
  } else if (value.isNotEmpty && value.length < 8) {
    return "shortPassError".tr;
  } else {
    return null;
  }
}

confiormInputValidator(String value, String pass, String conformPass) {
  if (value.isEmpty) {
    return "matchNullError".tr;
  } else if (value.isNotEmpty && value.length < 8) {
    return "shortPassError".tr;
  } else if (pass != conformPass) {
    return "matchPassError".tr;
  } else {
    return null;
  }
}

phoneInputValidator(String value) {
  if (value.isEmpty) {
    return "phoneNullErorr".tr;
  } else if (!GetUtils.isPhoneNumber(value)) {
    return "invalidPhone".tr;
  } else if (value.isNotEmpty && value.length < 9) {
    return "shortPhone".tr;
  } else {
    return null;
  }
}

textInputValidator(String value) {
  if (value.isEmpty) {
    return "textNullErorr".tr;
  } else {
    return null;
  }
}
