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
        preferredSize: Size.fromHeight(111.0),
        child: SafeArea(
          child: AppBar(
            title: Text("Images",
                style: TextStyle(color: Colors.black, fontSize: 17)),
            centerTitle: true,
            flexibleSpace: Container(
              height: 110,
              padding: EdgeInsets.only(top: 30.0),
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'assets/logo1.png',
                    width: 80,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[Colors.orange, Colors.blueAccent])),
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
