import 'dart:async';

import 'package:commonsprojects/common_imports.dart';

final getIt = GetIt.instance;

init() {}

Future<void> main() async {
  AppConfig.create(
    appName: AppStringConstants.appNameDev,
    baseUrl: "",
    flavor: Flavor.dev,
  );

  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    init();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    runApp(
      ChangeNotifierProvider<ThemeProvider>(
        create: (BuildContext context) => ThemeProvider(),
        child: const MyApp(),
      ),
    );
  }, (error, stack) {});
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static MyAppState? of(BuildContext context) => context.findAncestorStateOfType<MyAppState>();

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: GetMaterialApp(
          title: AppConfig.shared.appName,
          navigatorKey: Get.key,
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.rightToLeft,
          transitionDuration: const Duration(microseconds: 800),
          scrollBehavior: ScrollHelper(),
          getPages: RouteHelper.routes,
          initialRoute: RouteHelper.routeInitial,
          theme: themeProvider.selectedThemeData,
          locale: Get.deviceLocale,
          navigatorObservers: <NavigatorObserver>[BotToastNavigatorObserver()],
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
              child: child = botToastBuilder(context, child),
            );
          },
        ),
      );
    });
  }
}
