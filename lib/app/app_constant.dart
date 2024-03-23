import 'package:commonsprojects/common_imports.dart';

class AppStringConstants {

  //     ======================= Strings =======================     //
  static const String appName = 'SAT Hisab Book';
  static const String appNameDev = 'Dev SAT Hisab Book';

  //     ======================= Localization Keys =======================     //

  static const String somethingWentWrong = 'somethingWentWrong';
}


class AppColorConstants {

  static Color colorPrimary = const Color(0xFF1D222A);
  static const Color appWhite = Color(0xffffffff);
  static const Color appRed = Color(0xffF64444);
  static const Color appBlack = Color(0xFF000000);
  static  Color dividerColorLight = appBlack.withOpacity(0.1);
  static  Color dividerColorDark = appWhite.withOpacity(0.1);

}

class AppAssetsConstants {

  static const String defaultFont = 'Futura';
  static const String imagePath = 'assets/images/';
  static const String iconPath = 'assets/icons/';
  static const String animPath = 'assets/anim/';

  // =================== icons ========================= //
  static const String splashAnim = '${animPath}splash_anim.json';

  // =================== images ========================= //
  static const String appLogo = '${imagePath}logo.png';
  static const String imgMaharaj = '${imagePath}img_maharaj.jpeg';

  // =================== icons ========================= //
  static const String userIcon = '${iconPath}user_Ic.svg';

}