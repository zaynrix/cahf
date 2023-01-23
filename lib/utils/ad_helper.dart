import 'dart:io';

class AdHelper {
  static bool test = true;
  static String bannerTest = "ca-app-pub-3940256099942544/6300978111";
  static String interstitialVideoTest =
      "ca-app-pub-3940256099942544/8691691433";

  static String bannerHome = "ca-app-pub-4048387074884321/5395637222";
  static String bannerPrivacy = "ca-app-pub-4048387074884321/3507840487";
  static String bannerId = "ca-app-pub-4048387074884321/2254468564";
  static String bannerId2 = "ca-app-pub-4048387074884321/7255513803";
  static String interstitialVideo = "ca-app-pub-4048387074884321/4629350467";
  static String interstitialVideoHome =
      "ca-app-pub-4048387074884321/8377023780";

  static String? get bannerAdUnitIdHome {
    //
    if (test == true) {
      //
      print("This tester");
      return bannerTest;
    } else {
      print("This Liver");
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
      return bannerTest;
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
      return bannerTest;
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
      return bannerTest;
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

  static String get interstitialVideoAdUnitId {
    if (test == true) {
      print("Video");
      return interstitialVideoTest;
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
      return interstitialVideoTest;
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
