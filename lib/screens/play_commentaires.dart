import 'package:flutter/material.dart';

class PlayCommentaire extends StatelessWidget {
  final String commentaire;

  const PlayCommentaire({Key? key, required this.commentaire})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: SafeArea(
          child: AppBar(
            centerTitle: true,
            flexibleSpace: Container(
              padding: EdgeInsets.only(right: 30.0),
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
      body: Container(
        padding: EdgeInsets.all(20),
        child: SizedBox(
            width: mediaQueryData.size.width,
            child: SelectableText(commentaire,
                cursorColor: Colors.red,
                showCursor: true,
                toolbarOptions: ToolbarOptions(
                    copy: true, selectAll: true, cut: false, paste: false),
                style: Theme.of(context).textTheme.bodyText2)),
      ),
    );
  }
}
