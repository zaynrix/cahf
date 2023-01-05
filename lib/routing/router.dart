
import 'package:flutter/material.dart';
import 'package:cahf/modules.dart';
import 'package:provider/provider.dart';

class RouterX {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      // ------------- Splash Screen ---------------

      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider.value(
            value: sl<AppConfig>(),
            child: SplashScreen(),
          ),
        );



      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider.value(
            value: sl<AppConfig>(),
            child: Home(),
          ),
        );
      case Routes.songsScreen:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider.value(
            value: sl<AppConfig>(),
            child: SongsScreen(),
          ),
        );
      // ------------- Default Route ---------------
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

class ScreenArguments {
  final String? title;
  final void Function()? fuc;
  final void Function()? resend;
  final IconData? iconData;
  final Key? key;

  ScreenArguments({this.title, this.fuc, this.resend, this.iconData, this.key});
}
