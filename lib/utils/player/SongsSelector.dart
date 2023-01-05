import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../interceptors/di.dart';
import '../appConfig.dart';
import '../elements/BlockButtonWidget.dart';

class SongsSelector extends StatefulWidget {
  final Playing? playing;
  final List<Audio> audios;
  final Function(Audio) onSelected;
  final Function(List<Audio>) onPlaylistSelected;

  SongsSelector(
      {required this.playing,
      required this.audios,
      required this.onSelected,
      required this.onPlaylistSelected});

  @override
  _SongsSelectorState createState() => _SongsSelectorState();
}

class _SongsSelectorState extends State<SongsSelector> {
  bool isWords = true;

  @override
  Widget build(BuildContext context) {
    // Scroll to first selected item


    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        BlockButtonWidget(
          padd: EdgeInsets.symmetric(horizontal: 5.h),
          ic: Icons.play_circle_fill,
          icColor: Colors.red,
          text: Text(
            "تشغيل القائمة",
            style: TextStyle(
                fontSize: 20.sp, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          color: Colors.black54,
          isgrad: false,
          onPressed: () {
            widget.onPlaylistSelected(widget.audios);
          },
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Container(
            // height: 48,
            decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          isWords = true;
                        });
                      },
                      child: Text(
                        'القائمة',
                        style: TextStyle(
                            fontSize: isWords == true ? 20 : 16,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold,
                            color:
                                isWords == true ? Colors.white : Colors.grey),
                      )),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: InkWell(
                //       onTap: () {
                //         setState(() {
                //           isWords = false;
                //         });
                //       },
                //       child: Text(
                //         "كلمات",
                //         style: TextStyle(
                //             fontSize: isWords != true ? 20 : 16,
                //             color:
                //                 isWords != true ? Colors.white : Colors.grey),
                //       )),
                // ),
              ],
            ),
          ),
        ),
        SizedBox(

          height: 5,
        ),
        Expanded(
          child: ListView.builder(
            controller: sl<AppConfig>().scrollController,
            shrinkWrap: true,
            itemBuilder: (context, position) {

              final item = widget.audios[position];
              final isPlaying =
                  item.path == widget.playing?.audio.assetAudioPath;
              return isWords == true
                  ?  Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  widget.onSelected(item);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: !isPlaying
                                          ? Colors.black45
                                          : Colors.white24,
                                      // border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(item.metas.title.toString(),
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontSize: 20.sp,
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : isPlaying
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Text(
                                item.metas.extra!["word"].toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    letterSpacing: 5.0, color: Colors.white,fontSize: 18.sp),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                            ],
                          ),
                        )
                      : Container();
            },
            itemCount: widget.audios.length,
          ),
        ),
      ],
    );
  }
}
