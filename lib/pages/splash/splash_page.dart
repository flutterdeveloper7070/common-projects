import 'package:commonsprojects/common_imports.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  SplashViewModel? splashViewModel;
  late SplashController splashController;

  @override
  Widget build(BuildContext context) {
    splashViewModel ?? (splashViewModel = SplashViewModel(this));
    return GetBuilder(
      init: SplashController(),
      builder: (SplashController controller) {
        splashController = controller;
        return Scaffold(
          body: splashViewModel?.splashBodyView(),
        );
      },
    );
  }
}
