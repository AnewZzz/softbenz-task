import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:softbenz/view/screens/base_page.dart';
import 'package:softbenz/view/screens/error_page.dart';
import 'package:softbenz/view/screens/splash_screen.dart';

class GoRouteNavigation {
  static final GoRouter _router = GoRouter(
    initialLocation: SplashScreen.routeName,
    observers: [BotToastNavigatorObserver()],
    routes: [
      //SPLASH SCREEN//
      GoRoute(
          path: SplashScreen.routeName,
          name: 'splashscreen',
          builder: (context, state) => const SplashScreen()),

      //BASEPAGE//

      GoRoute(
          path: BasePage.routeName,
          name: 'basepage',
          builder: (context, state) => const BasePage()),

      GoRoute(
          path: CustomErrorPage.routeName,
          name: 'errorPage',
          builder: (context, state) => CustomErrorPage(
                errorDetails: state.extra as FlutterErrorDetails?,
              )),
    ],
  );

  GoRouter get goRouter => _router;
}
