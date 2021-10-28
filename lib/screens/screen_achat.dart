import 'package:easyeconomy/models/easy_economy_models.dart';
import 'package:flutter/material.dart';

class ScreenAchat extends StatefulWidget {
  final List<DesciprtionUniverselle> listDesription;
  ScreenAchat({required this.listDesription, Key? key}) : super(key: key);

  @override
  _ScreenAchatState createState() => _ScreenAchatState();
}

class _ScreenAchatState extends State<ScreenAchat> {
  double totalAchats = 0;
  double totalPrevision() {
    double totalPrev = 0;
    for (var i = widget.listDesription.length - 1; i >= 0; i--) {
      totalPrev = totalPrev + widget.listDesription[i].previsions;
      totalAchat(i);
    }
    return totalPrev;
  }

  totalAchat(int index) {
    for (var i = widget.listDesription[index].achat.length - 1; i >= 0; i--) {
      totalAchats = totalAchats + widget.listDesription[index].achat[i];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      height: 110,
      child: Card(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 25.0,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white70),
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.blueAccent, Colors.orange])),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  // icon
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'achat',
                          style: TextStyle(fontSize: 13, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Card(
                        color: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 25.0,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white70),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [Colors.orange, Colors.blueAccent])),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              totalAchats.toString(),
                              style:
                                  TextStyle(fontSize: 13, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.shop,
                    size: 30,
                    color: Colors.white,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Prévision",
                          style: TextStyle(fontSize: 13, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Card(
                        color: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 25.0,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white70),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [Colors.orange, Colors.blueAccent])),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              totalPrevision().toString(),
                              style:
                                  TextStyle(fontSize: 13, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                  // text
                ],
              ),
            ),
          )),
    );
  }
}
