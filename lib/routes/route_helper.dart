import 'package:commonsprojects/common_imports.dart';

class RouteHelper {
  static const String routeInitial = '/';

  static List<GetPage> routes = [
    GetPage(name: routeInitial, page: () => const SplashPage()),
  ];
}
