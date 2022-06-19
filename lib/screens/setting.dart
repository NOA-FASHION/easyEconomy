import 'package:easyeconomy/controllers/easy_Controller.dart';

import 'package:easyeconomy/screens/introViews.dart';
import 'package:easyeconomy/screens/purchase.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';
import 'package:url_launcher/url_launcher.dart';


class Setting extends StatefulWidget {
  final int index;
  Setting({required this.index});
  static const routeName = '/Profile5';

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    // EasyController variable = Provider.of<EasyController>(context);
    double widthC = MediaQuery.of(context).size.width * 100;
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //==========================================================================================
              // build Top Section of Profile (include : Image & main info & card of info[photos ... ] )
              //==========================================================================================
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: _buildHeader(context, widthC),
              ),

              //==========================================================================================
              //  build Bottom Section of Profile (include : email - phone number - about - location )
              //==========================================================================================
              _buildInfo(context, widthC),
            ],
          ),
        ));
  }

  Widget _buildHeader(BuildContext context, double width) {
    return ShapeOfView(
      shape: BubbleShape(
          position: BubblePosition.Bottom,
          arrowPositionPercent: 0.5,
          borderRadius: 30,
          arrowHeight: 15,
          arrowWidth: 20),
      child: Stack(
        children: <Widget>[
          Ink(
            height: 230,
            width: 430,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              image: new DecorationImage(
                image: new AssetImage('assets/6.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: 200,
            margin: const EdgeInsets.only(top: 50),
            child: Column(
              children: <Widget>[
                Card(
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  color: Colors.grey.shade400,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: Colors.white,
                        width: 6.0,
                      ),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: Image.asset('assets/logo.png',
                            width: 80, height: 80, fit: BoxFit.fill)),
                  ),
                ),
                _buildMainInfo(context, width)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey.shade400, width: 3),
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 15.0,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, bottom: 16.0, right: 10.0, left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        'Photos',
                        style: new TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: new Text(
                          '15',
                          style: new TextStyle(
                              fontSize: 18.0,
                              color: Color(0Xffde6262),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  new Column(
                    children: <Widget>[
                      new Text(
                        'Followers',
                        style: new TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: new Text(
                          '3.5k',
                          style: new TextStyle(
                              fontSize: 18.0,
                              color: Color(0Xffde6262),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  new Column(
                    children: <Widget>[
                      new Text(
                        'Following',
                        style: new TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: new Text(
                          '150',
                          style: new TextStyle(
                              fontSize: 18.0,
                              color: Color(0Xffde6262),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMainInfo(BuildContext context, double width) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text('PARAMÈTRES',
            style: TextStyle(
                fontSize: 20, color: Colors.teal, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildInfo(BuildContext context, double width) {
    EasyController variable = Provider.of<EasyController>(context);
    return Container(
        padding: EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.all(28),
          child: Column(
            children: <Widget>[
              Card(
                color: Colors.white24,
                elevation: 15,
                child: ListTile(
                  leading: Icon(Icons.email, color: Colors.deepOrangeAccent),
                  title: Text("easyeconomy@gmail.com",
                      style: TextStyle(fontSize: 15, color: Colors.black)),
                  // subtitle: Text("easyeconomy@gmail.com",
                  //     style: TextStyle(fontSize: 12, color: Colors.black54)),
                ),
              ),
              Divider(
                thickness: 2,
                color: Colors.white,
              ),
              Card(
                color: Colors.white24,
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider.value(
                            value: variable, child: PurchaseApp())));
                    // Navigator.push(
                    //     context,
                    //     WaveTransition(
                    //         center: FractionalOffset(0.90, 0.90),
                    //         duration: Duration(milliseconds: 1000),
                    //         child: ChangeNotifierProvider.value(
                    //             value: variable, child: PurchaseApp())));
                  },
                  leading: Icon(Icons.store, color: Colors.deepOrangeAccent),
                  title: Text("Achat à vie",
                      style: TextStyle(fontSize: 15, color: Colors.black)),
                  // subtitle: Text("",
                  //     style: TextStyle(fontSize: 12, color: Colors.black54)),
                ),
              ),
              Divider(
                thickness: 2,
                color: Colors.white,
              ),
              Card(
                color: Colors.white24,
                child: ListTile(
                  onTap: () {
                    _launchMapsUrl(
                        'https://easyeconomy.fr/politiquedeconfidentialite.html');
                  },
                  leading: Icon(Icons.person, color: Colors.deepOrangeAccent),
                  title: Text("Politique de confidentialité",
                      style: TextStyle(fontSize: 15, color: Colors.black)),
                  // subtitle: Text("Présentation",
                  //     style: TextStyle(fontSize: 15, color: Colors.black54)),
                ),
              ),
              Divider(
                thickness: 2,
                color: Colors.white,
              ),
              Card(
                color: Colors.white24,
                child: ListTile(
                  onTap: () {
                    _launchMapsUrl('https://easyeconomy.fr/');
                  },
                  leading: Icon(Icons.person, color: Colors.deepOrangeAccent),
                  title: Text("À propos",
                      style: TextStyle(fontSize: 15, color: Colors.black)),
                  // subtitle: Text("Présentation",
                  //     style: TextStyle(fontSize: 12, color: Colors.black54)),
                ),
              ),
              Divider(
                thickness: 2,
                color: Colors.white,
              ),
              Card(
                color: Colors.white24,
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider.value(
                            value: variable, child: IntroViewsPage())));
                    // Navigator.push(
                    //     context,
                    //     WaveTransition(
                    //         center: FractionalOffset(0.90, 0.90),
                    //         duration: Duration(milliseconds: 1000),
                    //         child: ChangeNotifierProvider.value(
                    //             value: variable, child: IntroViewsPage())));
                  },
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  leading: Icon(Icons.start, color: Colors.deepOrangeAccent),
                  title: Text("Introduction",
                      style: TextStyle(fontSize: 15, color: Colors.black)),
                  // subtitle: Text("Help",
                  //     style:
                  //         TextStyle(fontSize: 15, color: Colors.black54)),
                ),
              ),
              Divider(
                thickness: 2,
                color: Colors.white,
              ),
            ],
          ),
        ));
  }
}

void _launchMapsUrl(String lien) async {
  launchUrl(
    Uri.parse(lien),
  );
}
