import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:cahf/modules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  AssetsAudioPlayer.setupNotificationsOpenAction((notification) {
    WidgetsFlutterBinding.ensureInitialized();
    return true;
  });

  MobileAds.instance.initialize();
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await init();
  sl<AppConfig>().loadData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          scaffoldMessengerKey: sl<NavigationService>().snackBarKey,
          debugShowCheckedModeBanner: false,
          title: 'سورة الكهف',
          theme: getApplicationTheme(),
          navigatorKey: sl<NavigationService>().navigatorKey,
          initialRoute: Routes.splash,
          onGenerateRoute: RouterX.generateRoute,
        );
      },
    );
  }
}
