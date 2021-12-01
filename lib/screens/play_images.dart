import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class PlayPicture extends StatelessWidget {
  final String patchPicture;
  const PlayPicture({Key? key, required this.patchPicture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: SafeArea(
          child: AppBar(
            title: Text("Images"),
            centerTitle: true,
            flexibleSpace: Container(
              height: 130,
              padding: EdgeInsets.only(top: 40.0, right: 30.0),
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    width: 60,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[Colors.purple, Colors.blue])),
            ),
          ),
        ),
      ),
      body: Shimmer(
        duration: Duration(seconds: 3),
        interval: Duration(seconds: 5),
        color: Colors.white,
        enabled: true,
        direction: ShimmerDirection.fromLTRB(),
        child: ListView(
          children: [
            Image.file(File(patchPicture)),
          ],
        ),
      ),
    );
  }
}
