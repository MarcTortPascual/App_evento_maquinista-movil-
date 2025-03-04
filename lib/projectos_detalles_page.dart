
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';



class Ytvideo extends StatefulWidget {
  String videoUrl;

  Ytvideo({Key? key, required this.videoUrl,this.hide_control  = false,this.is_muted = true}) : super(key: key);
  bool hide_control,is_muted ;
  @override
  _YtvideoState createState() => _YtvideoState();
}

class _YtvideoState extends State<Ytvideo> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        loop: true,
        mute: widget.is_muted ,
        hideControls: widget.hide_control  ,

      ),
      
    );
    
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.red,
      onReady: () {
        debugPrint('Player is ready.');
      },
    );
  }
}