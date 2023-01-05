import 'dart:async';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:cahf/modules.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as showRootbundel;


class AppConfig extends ChangeNotifier {
  AnimationController? controller;
  late Animation<double> animation;

  String data = "";

  AssetsAudioPlayer get assetsAudioPlayer => AssetsAudioPlayer.withId('music');
  final List<StreamSubscription> subscriptions = [];

  bool nextDone = true;
  bool prevDone = true;

  final height = 60.0;
  final height2 = -20.0;

  ScrollController scrollController = ScrollController();

  animateToIndex(i) =>
      scrollController.animateTo(i == 0 ? height2 * i : height * i,
          duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);

  late BannerAd bannerAdHome;
  late BannerAd bannerAdPrivacy;
  late BannerAd bannerAd;
  late BannerAd bannerAd2;
  bool isBannerAdReadyHome = false;
  bool isBannerAdReadyPrivacy = false;
  bool isBannerAdReady = false;
  bool isBannerAdReady2 = false;

  InterstitialAd? interstitialAd;
  InterstitialAd? interstitialAdHome;
  bool isInterstitialAdReady = false;
  bool isInterstitialAdReadyHome = false;

  void loadInterstitialVideoAd() {
    print("This is loadInterstitialVideoAd ${AdHelper.interstitialVideoAdUnitId}");

    InterstitialAd.load(
      adUnitId: AdHelper.interstitialVideoAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          this.interstitialAd = ad;
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {},
          );
          isInterstitialAdReady = true;
          notifyListeners();
        },
        onAdFailedToLoad: (err) {
          print('Failed to load an interstitial ad: ${err.message}');
          isInterstitialAdReady = false;
          notifyListeners();

        },
      ),
    );
  }


  void loadInterstitialVideoAdHome() {
    print("This is vide ${AdHelper.interstitialVideoAdUnitIdHome}");
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialVideoAdUnitIdHome,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          this.interstitialAdHome = ad;
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {},
          );
          isInterstitialAdReadyHome = true;
          notifyListeners();
        },
        onAdFailedToLoad: (err) {
          isInterstitialAdReadyHome = false;
          notifyListeners();
        },
      ),
    );
  }

  void loadBanner() {
   bannerAd= BannerAd(
      adUnitId: AdHelper.bannerAdUnitId!,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          isBannerAdReady = true;
          print("This isBannerAdReady = true ");
          notifyListeners();
        },
        onAdFailedToLoad: (ad, err) {
          isBannerAdReady = false;
          print("This isBannerAdReady = false ");
          notifyListeners();
          ad.dispose();
        },
      ),
    );
   bannerAd2= BannerAd(
     adUnitId: AdHelper.bannerAdUnitId2!,
     request: AdRequest(),
     size: AdSize.banner,
     listener: BannerAdListener(
       onAdLoaded: (_) {
         isBannerAdReady2 = true;
         notifyListeners();
       },
       onAdFailedToLoad: (ad, err) {
         isBannerAdReady2 = false;
         notifyListeners();
         ad.dispose();
       },
     ),
   );
  }
  void loadBannerHome() {
print("Home");
    bannerAdHome= BannerAd(
      adUnitId: AdHelper.bannerAdUnitIdHome!,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          isBannerAdReadyHome = true;
          notifyListeners();
          print("load");
        },
        onAdFailedToLoad: (ad, err) {
          isBannerAdReadyHome = false;
          notifyListeners();
          ad.dispose();
        },
      ),
    );
    bannerAdPrivacy= BannerAd(
      adUnitId: AdHelper.bannerAdUnitPrivacy!,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          isBannerAdReadyPrivacy = true;
          notifyListeners();
        },
        onAdFailedToLoad: (ad, err) {
          isBannerAdReadyPrivacy = false;
          notifyListeners();
          ad.dispose();
        },
      ),
    );
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    sl<NavigationService>().navigateToAndRemove(Routes.home);
  }

  getPricavyPolicy() async {
    String responseText;
    responseText =
        await showRootbundel.rootBundle.loadString(FileAssets.privacyPolicy);
    data = responseText;
    notifyListeners();
  }

  void openPlayer(bool auto) async {
    print("openPlayer");

    await assetsAudioPlayer.open(
      Playlist(
        audios: audios,
        startIndex: 0,
      ),
      showNotification: true,
      autoStart: auto,
    );
  }

  void initSongs() {
    assetsAudioPlayer.playlistFinished.listen((finish) {
      if (finish && audios.isNotEmpty) {
        openPlayer(true);
      }
    });
    assetsAudioPlayer.isPlaying.value != true
        ? openPlayer(false)
        : print(" No");
    assetsAudioPlayer.isPlaying.value != true ? print("ys") : print(" No");

    assetsAudioPlayer.playlistFinished.listen((event) async {
      if (audios.isEmpty) {
        // setState(() {
        assetsAudioPlayer.open(
          Playlist(
            audios: audios,
            startIndex: 0,
          ),
          // loopMode: LoopMode.playlist,
          showNotification: true,
          autoStart: false,
        );
        notifyListeners();
        // });
      }
    });

    subscriptions.add(assetsAudioPlayer.playlistAudioFinished.listen((data) {
      print('playlistAudioFinished : $data');
    }));
    subscriptions.add(assetsAudioPlayer.audioSessionId.listen((sessionId) {
      print('audioSessionId : $sessionId');
    }));
    subscriptions
        .add(AssetsAudioPlayer.addNotificationOpenAction((notification) {
      return false;
    }));
  }

  void next() async {
    if (nextDone) {
      nextDone = false;
      await assetsAudioPlayer.next();
      animateToIndex(assetsAudioPlayer.current.value?.index);
      nextDone = true;
      notifyListeners();
    }
  }

  void prev() async {
    if (prevDone) {
      prevDone = false;
      await assetsAudioPlayer.previous();
      animateToIndex(assetsAudioPlayer.current.value?.index);
      prevDone = true;
      notifyListeners();
    }
  }
}

class CustomSizedBox extends StatelessWidget {
  final double height;
  final double width;

  const CustomSizedBox(this.height, this.width);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
