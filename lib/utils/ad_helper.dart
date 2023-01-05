import 'dart:io';

class AdHelper {
  static bool test = true;
  static String bannerTest = "ca-app-pub-3940256099942544/6300978111";
  static String interstitialVideoTest = "ca-app-pub-3940256099942544/8691691433";


  static String bannerHome = "ca-app-pub-4048387074884321/2391455547";
  static String bannerPrivacy = "ca-app-pub-4048387074884321/9918591770";
  static String bannerId = "ca-app-pub-4048387074884321/2456417619";
  static String bannerId2 = "ca-app-pub-4048387074884321/4826047191";
  static String interstitialVideo = "ca-app-pub-4048387074884321/7260638846";
  static String interstitialVideoHome =
      "ca-app-pub-4048387074884321/6779640151";

  static String? get bannerAdUnitIdHome {
    if (test == true) {
      return bannerTest;
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
