import "package:get/get.dart";

class HamourTranslations extends Translations {
  @override
  // TODON: implementing keys
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "appName": "هامور",
          ...onBoardingAr,
          ...authAr,
          "categories": "الفئات",
          "see_more": "تصفح المزيد",
          "search": "بحث",
          "dashboard": "لوحة التحكم",
          "balance": "الرصيد",
          "price": "السعر",
          "riyal": "ريال",
          "addToRepo": "الاضافة الى المخزن؟",
          "searchHere": "البحث عن المنتجات...",
          "repositry": "قائمة منتجاتي",
          "home": "الرئيسية",
        },
        "en": {
          "appName": "Hamour",
          ...onBoardingEn,
          ...authEn,
          "categories": "Categories",
          "see_more": "See More",
          "dashboard": "Dash board",
          "balance": "Balance",
          "price": "Price",
          "riyal": "Riyal",
          "addToRepo": "Add to repositry?",
          "searchHere": "Search here",
          "repositry": "Repositry",
          "home": "Home",
        },
      };

  Map<String, String> onBoardingEn = {
    "choose language": "Choose Language",
    "next": "next",
    "skip": "skip",
    "Get Started": "Get Started",
    "onBoardingTitle1": "create your store",
    "onBoardingTitle2": "easy Payments and sales",
    "onBoardingTitle3": "share your products",
    "onBoardingTitle4": "sell and buy them without fees",
    "onBoardingBody1":
        "by creating your store\n you can now start your bussnes\n easily with little amount of money",
    "onBoardingBody2":
        "by creating your store\n you can now start your bussnes\n easily with little amount of money",
    "onBoardingBody3":
        "by creating your store\n you can now start your bussnes\n easily with little amount of money",
    "onBoardingBody4":
        "by creating your store\n you can now start your bussnes\n easily with little amount of money",
  };
  Map<String, String> onBoardingAr = {
    "choose language": "اختر اللغة",
    "next": "التالي",
    "skip": "تخطي",
    "Get Started": "فلنبدء",
    "onBoardingTitle1": "انشى متجرك الالكتروني",
    "onBoardingTitle2": "بيع واشتري وانت ب البيت",
    "onBoardingTitle3": "شارك منتجاتك ",
    "onBoardingTitle4": "هل انت مستعد لتصبح هامور؟",
    "onBoardingBody1":
        "عبر انشائك حساب لدينا سيصبح بأمكانك تصفح العديد من المنتجات",
    "onBoardingBody2":
        "عبر انشائك حساب لدينا سيصبح بأمكانك تصفح العديد من المنتجات",
    "onBoardingBody3":
        "عبر مشاركة منتجاتك في وسائل التواصل الاجتماعي ستسرع من عمليات نجاحك",
    "onBoardingBody4": "اصبح هامور واشترك معنا الان",
  };

  Map<String, String> authEn = {
//Start Login Screen

    "login": "Login",
    "signup": "Sign up",
    "welcome": "welcome to you in hamour",
    "loginText": "Login to your account so you can surff many products",
    "email": "Email",
    "password": "Password",
    "forgotPassword": "Forgot password",
    "forgotPasswordText": "Enter your email to recive the verification code",
    "send": "Send",
    "emailText": "Enter Your Email",
    "passwordText": "Enter your password",
    "remember me": "Remember me later",
    "don't have and account?": "don't have an account yet?",
    "emailNullError": "Please Enter Your Email",
    "invalidEmailError": "Please Enter a Valid Email",
    "passNullError": "Please Enter Your Password",
    "shortPassError": "Password is too short",
    "matchNullError": "please conform the password",
    "matchPassError": "Password don't match",
    "shortPhone": "phone number is too short ",
    "invalidPhone": "invalid number",
    "phoneNullErorr": "phone number can't be empty",
    "textNullErorr": "invalid input",
    "wellDone": "Well Done",
    "wellDoneText": "Verified Successfully",
    //End Login Screen
    //Start of Sign up Screen
    "storeName": "Store",
    "storeText": "Enter your store name",
    "Store name": "Store name",
    "Enter your store name": "Enter your store name ",
    "phoneNumber": "Phone number",
    "phoneText": "Enter your phone number",
    "signupText": "Sign up for a new account free",
    "already a user?": "Already a user?",
    "conformText": "re-enter your password",
    "conformPassword": "confirm password",
    "sign up as": "Or sign up as",
    "supplier": "Supplier",
    "store": "store",
    "supplierName": "Supplier name",
    "supplierText": "Enter supplier name",
    "commercialNumber": "commercial number",
    "commercialNumberText": "Enter your commercial number",
    "varification": "Verify Code",
    "varificationText": "please Enter your verification code that we sent to",
    "resetPassword": "Reset Password",
    "resetPasswordText": "Reset your new password",
    "reset": "Reset",
    "goBack": "Go back to",
    "newPassword": "new password",
    "newPasswordText": "Enter your new password",
    "codeExpire": "This Code will be expired in ",
    "codeNotSend": "did't get the code? try to ",
    "resend": "resend the code",
    "exit": "Exit",
    "exitText": "exit from app?",
    "cancel": "Cancel",
    "confirm": "Confirm",
    "warning": "Warning",
    "userExist": "User already exist",
    "verificationErrText": "code is not correct",
    "notExist": "either email or password is wrong",
    "EmailnotExist": "email not found",
    //End of Sign up Screen
  };
  Map<String, String> authAr = {
    //Start Login Screen
    "login": "تسجيل الدخول",
    "signup": "تسجيل الاشتراك",
    "welcome": "مرحباً بك في هامور",
    "loginText": "سجل دخولك لتصفح العديد من المنتجات",
    "email": "الايميل",
    "password": "كلمة السر",
    "forgotPassword": "نسيت كلمة السر",
    "forgotPasswordText": "ادخل بريدك الالكتروني لاستلام كود التفعيل",
    "send": "ارسال",
    "emailText": "ادخل ايميلك",
    "passwordText": "ادخل كلمة السر",
    "createAccount": "انشاء حساب",
    "remember me": "تذكرني لاحقاً",
    "don't have and account?": "لاتملك حساب؟",
    "emailNullError": "الرجاء ادخل الايميل",
    "invalidEmailError": "رجاء ادخل ايميل صالح",
    "passNullError": "الرجاء ادخل كلمة سر",
    "shortPassError": "كلمة السر صغيرة جداً",
    "matchNullError": " ادخل تأكيد كلمة السر",
    "matchPassError": "كلمة السر غير صالحة",
    "shortPhone": "رقم الهاتف قصير",
    "invalidPhone": "رقم الهاتف غير صحيح",
    "phoneNullErorr": "فضلا ادخل رقم الهاتف",
    "textNullErorr": "فضلا املئ الحقل",
    //End Login Screen
    //Start of Sign up Screen
    "storeName": "اسم المتجر",
    "storeText": "فضلا ادخل اسم متجرك",
    "phoneNumber": "رقم الهاتف",
    "phoneText": "ادخل رقم الهاتف",
    "signupText": "قم بتسجيل اشتراكك الان مجاناً",
    "already a user?": "لديك حساب؟",
    "conformText": "اعد ادخال كلمة السر مرة اخرى",
    "conformPassword": "تأكيد كلمة السر",
    "sign up as": "سجل اشتراك كـ",
    "supplier": "مورد",
    "supplierName": "اسم المورد",
    "supplierText": "ادخل اسم المورد",

    "store": "متجر",
    "commercialNumber": "الرقم التجاري",
    "commercialNumberText": "ادخل الرقم التجاري",
    "varification": "كود المصادقة",
    "varificationText": "ادخل كود التفعيل الذي تم ارساله الى",
    "resetPassword": "اعادة تعيين كلمة السر",
    "resetPasswordText": "تمت المصادقة بنجاح ادخل كلمة السر الجديدة",
    "reset": "اعادة تعيين",
    "goBack": "العودة الى",
    "newPassword": "كلمة السر الجديدة",
    "newPasswordText": "ادخل كلمة السر الجديدة",
    "codeExpire": "ينتهي كود التفعيل بعد ",
    "codeNotSend": "لم تحصل على كود التفعيل؟ جرب ",
    "resend": "اعادة ارسال كود التفعيل",
    "wellDone": "أحسنت",
    "wellDoneText": "تم التحقق بنجاح",
    "exit": "خروج",
    "exitText": "الخروج من التطبيق؟",
    "cancel": "الغاء",
    "confirm": "تأكيد",
    "warning": "تنبية",
    "userExist": "بيانات المستخدم موجود مسبقاً",
    "verificationErrText": "رقم التحقق غير صحيح",
    "notExist": "كلمة السر او الايميل غير صحيح",
    "EmailnotExist": "الايميل غير موجود",
    // "forgot password": "تأكيد كلمة السر",
    //End of Sign up Screen
  };
}
