import 'package:edux_app/api/ipfs_api_v1.dart';
import 'package:edux_app/model/Content.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';


class VideoPlayerX extends StatefulWidget {
  String videoHash;
  String videoName;

  VideoPlayerX(this.videoHash, this.videoName);
  @override
  State<StatefulWidget> createState() => VideoPlayerState();

}

class VideoPlayerState extends State<VideoPlayerX>{
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
        IpfsApi().serverURL + '/ipfs/'+ widget.videoHash);

    _chewieController = ChewieController(
      aspectRatio: 16 / 9,
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Video player', style: TextStyle(color: Colors.white),),
      ),
        body:Column(
            children: <Widget>[
               AspectRatio(
                    aspectRatio: 16 / 9,
                      child:Chewie(
                    controller: _chewieController,
                  )),
              Row(
                  children: <Widget>[
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            _chewieController.dispose();
                            _chewieController = ChewieController(
                              videoPlayerController: _videoPlayerController,
                              autoPlay: true,
                              looping: true,
                            );
                          });
                        },
                        child: Padding(
                          child: Text(widget.videoName),
                          padding: EdgeInsets.symmetric(vertical: 0.0),
                        ),
                      ),
                    ),
                  ]
              ),])
    );
  }
}
