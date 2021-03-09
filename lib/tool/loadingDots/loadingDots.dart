import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class LoadingDots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100,
      child: Center(
        child:new FlareActor("assets/images/loading5dots.flr",animation: "Untitled",),
      ),
    );
  }
}
