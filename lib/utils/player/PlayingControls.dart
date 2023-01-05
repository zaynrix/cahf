import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayingControls extends StatelessWidget {
  final bool isPlaying;
  final LoopMode? loopMode;
  final bool isPlaylist;
  final Function()? onPrevious;
  final Function() onPlay;
  final Function()? onNext;
  final Function()? toggleLoop;
  final Function()? onStop;

  PlayingControls({
    required this.isPlaying,
    this.isPlaylist = false,
    this.loopMode,
    this.toggleLoop,
    this.onPrevious,
    required this.onPlay,
    this.onNext,
    this.onStop,
  });

  Widget _loopIcon(BuildContext context) {
    if (loopMode == LoopMode.none) {
      return NeumorphicButton(
        style: NeumorphicStyle(
          color: Colors.white30,
          shadowLightColor: Colors.transparent,
          boxShape: NeumorphicBoxShape.circle(),
        ),
        padding: EdgeInsets.all(12),
        onPressed: () {
          if (toggleLoop != null) toggleLoop!();
        },
        child: Icon(Icons.loop),
      );
    } else if (loopMode == LoopMode.playlist) {
      return NeumorphicButton(
        style: NeumorphicStyle(
          color: Colors.white,
          shadowLightColor: Colors.transparent,
          boxShape: NeumorphicBoxShape.circle(),
        ),
        padding: EdgeInsets.all(12),
        onPressed: () {
          if (toggleLoop != null) toggleLoop!();
        },
        child: Icon(Icons.loop),
      );
    } else {
      //single
      return Stack(
        alignment: Alignment.center,
        children: [
          NeumorphicButton(
            style: NeumorphicStyle(
              color: Colors.white,
              shadowLightColor: Colors.transparent,
              boxShape: NeumorphicBoxShape.circle(),
            ),
            padding: EdgeInsets.all(12),
            onPressed: () {
              if (toggleLoop != null) toggleLoop!();
            },
            child: Icon(Icons.loop),
          ),
          Center(
            child: Text(
              '1',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        GestureDetector(
          onTap: () {
            if (toggleLoop != null) toggleLoop!();
          },
          child: _loopIcon(context),
        ),
        SizedBox(
          width: 12.w,
        ),
        NeumorphicButton(
          style: NeumorphicStyle(
            color: Colors.white60,
            shadowLightColor: Colors.transparent,
            boxShape: NeumorphicBoxShape.circle(),
          ),
          onPressed: isPlaylist ? onPrevious : null,
          child: Icon(Icons.skip_previous),
          padding: EdgeInsets.all(18),
          // onPressed: isPlaylist ? onNext : null,
          // child: Icon(Icons.skip_next),
        ),
        SizedBox(
          width: 12.w,
        ),
        NeumorphicButton(
          style: NeumorphicStyle(
            color: Colors.white60,
            shadowLightColor: Colors.transparent,
            boxShape: NeumorphicBoxShape.circle(),
          ),
          padding: EdgeInsets.all(20),
          onPressed: onPlay,
          child: Icon(
            isPlaying ? Icons.pause : Icons.play_arrow,
            size: 32.sp,
            color: isPlaying ? Colors.red : Colors.black,
          ),
        ),
        SizedBox(
          width: 12.w,
        ),
        NeumorphicButton(
          style: NeumorphicStyle(
            color: Colors.white60,
            shadowLightColor: Colors.transparent,
            boxShape: NeumorphicBoxShape.circle(),
          ),
          padding: EdgeInsets.all(18),
          // padding: EdgeInsets.all(18),
          onPressed: isPlaylist ? onNext : null,
          child: Icon(Icons.skip_next),
        ),
        SizedBox(
          width: 12.w,
        ),
        if (onStop != null)
          NeumorphicButton(
            style: NeumorphicStyle(
              color: Colors.white60,
              shadowLightColor: Colors.transparent,
              boxShape: NeumorphicBoxShape.circle(),
            ),
            padding: EdgeInsets.all(12),
            onPressed: onStop,
            child: Icon(Icons.stop),
          ),
      ],
    );
  }
}
