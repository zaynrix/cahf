import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:cahf/modules.dart';

class SongsScreen extends StatefulWidget {
  const SongsScreen({Key? key}) : super(key: key);

  @override
  State<SongsScreen> createState() => _SongsScreenState();
}

class _SongsScreenState extends State<SongsScreen> {
  @override
  void initState() {
    sl<AppConfig>().loadBanner();
    sl<AppConfig>().loadInterstitialVideoAd();

    sl<AppConfig>().bannerAd.load();
    sl<AppConfig>().bannerAd2.load();
    sl<AppConfig>().initSongs();
    super.initState();
  }

  @override
  void dispose() {
    sl<AppConfig>().interstitialAd?.dispose();
    sl<AppConfig>().bannerAd.dispose();
    sl<AppConfig>().bannerAd2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<AppConfig>(
        builder: (context, value, child) => Scaffold(
          backgroundColor: Colors.grey.withOpacity(0.5),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageAssets.splashBackground),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (value.isBannerAdReady)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        // color: Colors.red,
                        // height: 20,
                        width: value.bannerAd.size.width.toDouble(),
                        height: value.bannerAd.size.height.toDouble(),
                        child: AdWidget(ad: value.bannerAd),
                      ),
                    ),
                  ),
                Expanded(
                  child: value.assetsAudioPlayer.builderCurrent(
                      builder: (BuildContext context, Playing playing) {
                    return SongsSelector(
                      audios: audios,
                      onPlaylistSelected: (myAudios) {
                        value.assetsAudioPlayer.open(
                          Playlist(audios: myAudios),
                          autoStart: true,
                          showNotification: true,
                          headPhoneStrategy:
                              HeadPhoneStrategy.pauseOnUnplugPlayOnPlug,
                          audioFocusStrategy: AudioFocusStrategy.request(
                              resumeAfterInterruption: true),
                        );
                      },
                      onSelected: (myAudio) async {
                        // if (_isInterstitialAdReady) {
                        //   _loadInterstitialVideoAd();
                        //
                        //   _interstitialAd?.show();
                        //
                        //   // }
                        // }

                        await value.assetsAudioPlayer.open(
                          myAudio,
                          autoStart: true,
                          showNotification: true,
                          playInBackground: PlayInBackground.enabled,
                          audioFocusStrategy: AudioFocusStrategy.request(
                            resumeAfterInterruption: true,
                          ),
                          headPhoneStrategy: HeadPhoneStrategy.pauseOnUnplug,
                          notificationSettings: NotificationSettings(),
                        );
                      },
                      playing: playing,
                    );
                  }),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: value.assetsAudioPlayer.builderCurrent(
                      builder: (context, Playing playing) {
                    return Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            topRight: Radius.circular(10.r),
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          value.assetsAudioPlayer.builderLoopMode(
                            builder: (context, loopMode) {
                              return PlayerBuilder.isPlaying(
                                  player: value.assetsAudioPlayer,
                                  builder: (context, isPlaying) {
                                    return PlayingControls(
                                      loopMode: loopMode,
                                      isPlaying: isPlaying,
                                      isPlaylist: true,
                                      onStop: () {
                                        value.assetsAudioPlayer.stop();
                                      },
                                      toggleLoop: () {
                                        value.assetsAudioPlayer.toggleLoop();
                                      },
                                      onPlay: () {
                                        if (value.isInterstitialAdReady) {
                                          value.interstitialAd?.show();
                                        }
                                        value.assetsAudioPlayer.playOrPause();
                                      },
                                      onNext: () {
                                        value.next();
                                      },
                                      onPrevious: () {
                                        value.prev();
                                      },
                                    );
                                  });
                            },
                          ),
                          value.assetsAudioPlayer.builderRealtimePlayingInfos(
                              builder: (context, RealtimePlayingInfos infos) {
                            return Column(
                              children: [
                                PositionSeekWidget(
                                  currentPosition: infos.currentPosition,
                                  duration: infos.duration,
                                  seekTo: (to) {
                                    value.assetsAudioPlayer.seek(to);
                                  },
                                ),
                              ],
                            );
                          }),
                        ],
                      ),
                    );
                  }),
                ),
                if (value.isBannerAdReady2)
                  Visibility(
                    visible: false,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: value.bannerAd2.size.width.toDouble(),
                          height: value.bannerAd2.size.height.toDouble(),
                          child: AdWidget(ad: value.bannerAd2),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
