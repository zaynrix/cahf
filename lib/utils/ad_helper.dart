import 'dart:io';

class AdHelper {
  static bool test = false;
  static String bannerHome = "ca-app-pub-4048387074884321/2391455547";
  static String bannerPrivacy = "ca-app-pub-4048387074884321/9918591770";
  static String bannerId = "ca-app-pub-4048387074884321/2456417619";
  static String bannerId2 = "ca-app-pub-4048387074884321/4826047191";
  static String interstitialVideo = "ca-app-pub-4048387074884321/7260638846";
  static String interstitialVideoHome =
      "ca-app-pub-4048387074884321/6779640151";

  static String? get bannerAdUnitIdHome {
    if (test == true) {
      return bannerHome;
    } else {
      if (Platform.isAndroid) {
        return bannerHome;
      } else if (Platform.isIOS) {
        return bannerHome;
      } else {
        throw new UnsupportedError('Unsupported platform');
      }
    }
  }

  static String? get bannerAdUnitPrivacy {
    if (test == true) {
      return bannerPrivacy;
    } else {
      if (Platform.isAndroid) {
        return bannerPrivacy;
      } else if (Platform.isIOS) {
        return bannerPrivacy;
      } else {
        throw new UnsupportedError('Unsupported platform');
      }
    }
  }

  static String? get bannerAdUnitId {
    if (test == true) {
      return bannerId;
    } else {
      if (Platform.isAndroid) {
        return bannerId;
      } else if (Platform.isIOS) {
        return bannerId;
      } else {
        throw new UnsupportedError('Unsupported platform');
      }
    }
  }

  static String? get bannerAdUnitId2 {
    if (test == true) {
      return bannerId2;
    } else {
      if (Platform.isAndroid) {
        return bannerId2;
      } else if (Platform.isIOS) {
        return bannerId2;
      } else {
        throw new UnsupportedError('Unsupported platform');
      }
    }
  }



  // static String get interstitialAdUnitId {
  //   if (test==true) {
  //     return "ca-app-pub-3940256099942544/1033173712";
  //   } else {
  //     if (Platform.isAndroid) {
  //       return "ca-app-pub-1852376068783494/5191249407";
  //     } else if (Platform.isIOS) {
  //       return "ca-app-pub-1852376068783494/5191249407";
  //     } else {
  //       throw new UnsupportedError("Unsupported platform");
  //     }
  //   }
  // }

  static String get interstitialVideoAdUnitId {
    if (test == true) {
      print("Video");
      return interstitialVideo;
    } else {
      if (Platform.isAndroid) {
        return interstitialVideo;
      } else if (Platform.isIOS) {
        return interstitialVideo;
      } else {
        throw new UnsupportedError("Unsupported platform");
      }
    }
  }

  static String get interstitialVideoAdUnitIdHome {
    if (test == true) {
      print("Home");
      return interstitialVideoHome;
    } else {
      if (Platform.isAndroid) {
        return interstitialVideoHome;
      } else if (Platform.isIOS) {
        return interstitialVideoHome;
      } else {
        throw new UnsupportedError("Unsupported platform");
      }
    }
  }
}
