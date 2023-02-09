import 'package:finalpro_mobile/routes/route_name.dart';
import 'package:finalpro_mobile/screens/intro/splash_screen.dart';
import 'package:finalpro_mobile/screens/main/main_screen.dart';
import 'package:get/get.dart';

class AppPage {
  static final pages = [
    GetPage(
      name: RouteName.homeR,
      page: () => MainScreen(),
    ),
    GetPage(
      name: RouteName.logoutR,
      page: () => SplashScreens(
        title: 'intro',
      ),
    )
  ];
}
