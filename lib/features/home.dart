import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:cahf/modules.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    sl<AppConfig>().loadBannerHome();
    sl<AppConfig>().loadInterstitialVideoAdHome();
    sl<AppConfig>().bannerAdHome.load();
    sl<AppConfig>().bannerAdPrivacy.load();
    sl<AppConfig>().getPricavyPolicy();
    super.initState();
  }
@override
  void dispose() {
  sl<AppConfig>().bannerAdHome.dispose();
  sl<AppConfig>().bannerAdPrivacy.dispose();
  sl<AppConfig>().interstitialAdHome!.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.5),
      body: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageAssets.splashBackground),
            fit: BoxFit.fill,
          ),
        ),
        child: Consumer<AppConfig>(
          builder: (context, value, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (value.isBannerAdReadyHome)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: value.bannerAdHome.size.width.toDouble(),
                      height: value.bannerAdHome.size.height.toDouble(),
                      child: AdWidget(ad: value.bannerAdHome),
                    ),
                  ),
                ),
              Spacer(),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  // color: const Color(0xff7c94b6),
                  image: DecorationImage(
                    image: AssetImage(ImageAssets.splashLogoPng),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  border: Border.all(
                    // color: Colors.white,
                    width: 2.0,
                  ),
                ),
              ),
              Spacer(),
              Text(AppStrings().appName,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 44)),
              CustomSizedBox(30.h, 0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: BlockButtonWidget(
                        padd: EdgeInsets.symmetric(horizontal: 5),
                        ic: Icons.play_circle_fill,
                        icColor: Colors.green,
                        text: Text(
                          "بدأ الاستماع",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        color: Colors.black54,
                        isgrad: false,
                        onPressed: () {
                          if (value.isInterstitialAdReadyHome)
                            value.interstitialAdHome?.show();
                          sl<NavigationService>()
                              .navigateTo(Routes.songsScreen);
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
              CustomSizedBox(30.h, 0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(children: [
                  Expanded(
                    child: BlockButtonWidget(
                        ic: Icons.stars,
                        icColor: Colors.yellow,
                        text: Text(
                          "قيمنا + تعليق",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        color: Colors.black54,
                        isgrad: false,
                        onPressed: () {
                          Helper()
                              .launchUrlSite(AppConstants().currentApplication);
                        }),
                  ),
                  CustomSizedBox(0, 10.w),
                ]),
              ),
              CustomSizedBox(30.h, 0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(children: [
                  Expanded(
                    child: BlockButtonWidget(
                        ic: Icons.add_to_photos,
                        icColor: Colors.white,
                        text: Text(
                          "تطبيقاتنا",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        color: Colors.black54,
                        isgrad: false,
                        onPressed: () {
                          Helper().launchUrlSite(AppConstants().ourApps);
                        }),
                  ),
                  SizedBox(width: 10),
                ]),
              ),
              TextButton(
                  onPressed: () {
                    showGeneralDialog(
                      context: context,
                      barrierColor: Colors.black,
                      // Background color
                      barrierDismissible: false,
                      barrierLabel: 'Dialog',
                      transitionDuration: Duration(milliseconds: 400),
                      // How long it takes to popup dialog after button click
                      pageBuilder: (_, __, ___) {
                        // Makes widget fullscreen
                        return SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView(
                              children: <Widget>[
                                ElevatedButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Icon(
                                    Icons.close,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    "${sl<AppConfig>().data}",
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.none),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                if (value.isBannerAdReadyPrivacy)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        width: value.bannerAdPrivacy.size.width.toDouble(),
                                        height: value.bannerAdPrivacy.size.height.toDouble(),
                                        child: AdWidget(ad: value.bannerAdPrivacy),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Text("Privacy Policy")),

              // ColorLoader5(),
            ],
          ),
        ),
      ),
    );
  }
}
