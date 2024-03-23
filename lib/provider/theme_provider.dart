import 'package:commonsprojects/common_imports.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;
  ThemeData? selectedThemeData;
  bool isSatellite = false;
  bool isSatelliteForAllVehicles = false;

  ThemeData lightTheme = ThemeData(
    primaryColor: AppColorConstants.colorPrimary,
    fontFamily: AppAssetsConstants.defaultFont,
    dividerColor: AppColorConstants.dividerColorLight,
    scaffoldBackgroundColor: AppColorConstants.appWhite,
    textTheme:  const TextTheme(
      displayLarge: TextStyle(
        color: AppColorConstants.appBlack,
        fontWeight: FontWeight.w700,
        fontSize: 15,
      ),
      displayMedium: TextStyle(
        color: AppColorConstants.appBlack,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      displaySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColorConstants.appBlack,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
      ),
    ),
  );

  ThemeData darkTheme = ThemeData(
    primaryColor: AppColorConstants.colorPrimary,
    fontFamily: AppAssetsConstants.defaultFont,
    dividerColor: AppColorConstants.dividerColorDark,
    scaffoldBackgroundColor: AppColorConstants.appBlack,
    textTheme:  const TextTheme(
      displayLarge: TextStyle(
        color: AppColorConstants.appWhite,
        fontWeight: FontWeight.w700,
        fontSize: 15,
      ),
      displayMedium: TextStyle(
        color: AppColorConstants.appWhite,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      displaySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColorConstants.appWhite,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
      ),
    ),
  );

  ThemeProvider() {
    Brightness brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    isDarkMode = brightness == Brightness.dark;
    selectedThemeData = isDarkMode ? darkTheme : lightTheme;
    checkTheme();
  }

  void swapTheme({Brightness? brightness}) async {
    if (brightness == null) {
      selectedThemeData = selectedThemeData == lightTheme ? darkTheme : lightTheme;
    } else {
      isDarkMode = brightness == Brightness.dark;
      selectedThemeData = isDarkMode ? darkTheme : lightTheme;
    }
    isDarkMode = selectedThemeData == lightTheme ? false : true;
    setPrefBoolValue(AppSharedPreference.isTheme, isDarkMode);
    notifyListeners();
  }


  void checkTheme() async {
    if (await checkPrefKey(AppSharedPreference.isTheme)) {
      isDarkMode = await getPrefBoolValue(AppSharedPreference.isTheme);
      selectedThemeData = isDarkMode ? darkTheme : lightTheme;
      notifyListeners();
    } else {
      setPrefBoolValue(AppSharedPreference.isTheme, isDarkMode);
      notifyListeners();
    }
  }
}
