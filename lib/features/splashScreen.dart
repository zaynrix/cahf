import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cahf/modules.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  with SingleTickerProviderStateMixin{

    var locator = sl<AppConfig>();
  @override
  void initState() {
    // TODO: implement initState
    locator.controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    //Implement animation here
    locator.animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(locator.controller!);
    super.initState();
  }



    @override
    void dispose() {
      // TODO: implement dispose
      locator.controller!.dispose();
      super.dispose();
    }
  @override

  Widget build(BuildContext context) {
    locator.controller!.forward();
    return Hero(
      tag: "heroLogo2",
      child: FadeTransition(
        opacity: locator.animation,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageAssets.splashBackground),
              fit: BoxFit.fill,
            ),
          ),
          // color: config.primaryColor,
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeTransition(
                    //Use your animation here
                    opacity: locator.animation,
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.5,
                      height: MediaQuery.of(context).size.width*0.5,
                      decoration: BoxDecoration(
                        // color: const Color(0xff7c94b6),
                        image: DecorationImage(
                          image: AssetImage(ImageAssets.splashLogoPng),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(100.0)),
                        border: Border.all(
                          // color: Colors.white,
                          width: 0.0,
                        ),
                      ),
                    ),
                  ),
                  CustomSizedBox(120.h, 0),
                  // SizedBox(height: config.App(context).appWidth(30)),
                  Text(AppStrings().appName,
                      style: TextStyle(
                          fontFamily: "Cairo",
                          decoration: TextDecoration.none,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 44)),
                  CustomSizedBox(50.h, 0),

                  // SizedBox(height: config.App(context).appWidth(10)),
                  ColorLoader5(),
                ],
              )),
        ),
      ),
    );
  }
}
