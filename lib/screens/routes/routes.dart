import 'package:flutter/widgets.dart';
import 'package:login_01/screens/home-screen.dart';
import 'package:login_01/screens/search-screen.dart';
import 'package:login_01/screens/login-screen.dart';
import 'package:sailor/sailor.dart';

const LoginRoute = "/loginPage";
const HomeRoute = "/homePage";

class Routes {
  static final sailor = Sailor();

  static void createRoutes() {
    sailor.addRoute(
      SailorRoute(
        name: LoginRoute,
        builder: (context, args, params) {
          return LoginScreen();
        },
        defaultTransitionCurve: Curves.easeInCubic,
        defaultTransitionDuration: Duration(milliseconds: 600),
        defaultTransitions: [SailorTransition.fade_in],
      ),
    );
    sailor.addRoute(
      SailorRoute(
        name: HomeRoute,
        builder: (context, args, params) {
          return HomePage();
        },
        defaultTransitionCurve: Curves.easeInCubic,
        defaultTransitionDuration: Duration(milliseconds: 600),
        defaultTransitions: [SailorTransition.fade_in],
      ),
    );
  }
}
