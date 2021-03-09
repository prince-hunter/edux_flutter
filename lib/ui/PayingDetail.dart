// The copyright (c) irocn 2021-



import 'package:edux_app/features/VideoPlayerX.dart';
import 'package:flutter/material.dart';

class PayingDetail extends StatefulWidget{
  String videoHash;
  String videoName;

  PayingDetail(this.videoHash, this.videoName);
  @override
  State<StatefulWidget> createState() => PayingDetailState();
}

class PayingDetailState extends State<PayingDetail>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          VideoPlayerX(widget.videoHash, widget.videoName),
        ],
      ),
    );
  }
}
