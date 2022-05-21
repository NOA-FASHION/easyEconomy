import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:easyeconomy/screens/homeEconomy.dart';
import 'package:easyeconomy/screens/introViews.dart';
import 'package:easyeconomy/screens/purchase.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

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
    EasyController variable = Provider.of<EasyController>(context);
    double widthC = MediaQuery.of(context).size.width * 100;
    return Scaffold(
        bottomNavigationBar: CircleNavBar(
          activeIcons: const [
            Icon(Icons.person, color: Colors.deepPurple),
            Icon(Icons.home, color: Colors.deepPurple),
            Icon(Icons.favorite, color: Colors.deepPurple),
          ],
          inactiveIcons: const [
            Text("My"),
            Text("Home"),
            Text("Like"),
          ],
          color: Colors.grey.shade400,
          height: 60,
          circleWidth: 60,
          initIndex: widget.index,
          onChanged: (v) {
            if (v == 0) {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.bottomToTop,
                      child: ChangeNotifierProvider.value(
                          value: variable,
                          child: PurchaseApp(
                            index: 0,
                          ))));
            } else if (v == 1) {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.bottomToTop,
                      child: ChangeNotifierProvider.value(
                          value: variable,
                          child: Home(
                            index: 1,
                          ))));
            } else if (v == 2) {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.bottomToTop,
                      child: ChangeNotifierProvider.value(
                          value: variable,
                          child: Setting(
                            index: 2,
                          ))));
            }
          },
          // tabCurve: ,
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
          cornerRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(24),
            bottomLeft: Radius.circular(24),
          ),
          shadowColor: Colors.deepPurple,
          elevation: 10,
        ),
        backgroundColor: Colors.grey.shade50,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //==========================================================================================
              // build Top Section of Profile (include : Image & main info & card of info[photos ... ] )
              //==========================================================================================
              _buildHeader(context, widthC),

              SizedBox(height: 10.0),

              //==========================================================================================
              //  build Bottom Section of Profile (include : email - phone number - about - location )
              //==========================================================================================
              _buildInfo(context, widthC),
            ],
          ),
        ));
  }

  Widget _buildHeader(BuildContext context, double width) {
    return Stack(
      children: <Widget>[
        Ink(
          height: 250,
          color: Colors.deepOrangeAccent,
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 50),
          child: Column(
            children: <Widget>[
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                color: Colors.deepOrange,
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
        Container(
            margin: const EdgeInsets.only(top: 210),
            child: _buildInfoCard(context))
      ],
    );
  }

  Widget _buildInfoCard(context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Card(
            elevation: 5.0,
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
      width: width,
      margin: const EdgeInsets.all(10),
      alignment: AlignmentDirectional.center,
      child: Column(
        children: <Widget>[
          Text('Lorem Ipsum',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text('Flutter',
              style: TextStyle(
                  color: Colors.grey.shade50, fontStyle: FontStyle.italic))
        ],
      ),
    );
  }

  Widget _buildInfo(BuildContext context, double width) {
    EasyController variable = Provider.of<EasyController>(context);
    return Container(
        padding: EdgeInsets.all(10),
        child: Card(
          color: Colors.white,
          child: Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    ListTile(
                      leading:
                          Icon(Icons.email, color: Colors.deepOrangeAccent),
                      title: Text("E-Mail",
                          style: TextStyle(fontSize: 18, color: Colors.black)),
                      subtitle: Text("email@gmailc.com",
                          style:
                              TextStyle(fontSize: 15, color: Colors.black54)),
                    ),
                    Divider(),
                    ListTile(
                      leading:
                          Icon(Icons.phone, color: Colors.deepOrangeAccent),
                      title: Text("Phone Number",
                          style: TextStyle(fontSize: 18, color: Colors.black)),
                      subtitle: Text("11-111111-11",
                          style:
                              TextStyle(fontSize: 15, color: Colors.black54)),
                    ),
                    Divider(),
                    ListTile(
                      leading:
                          Icon(Icons.person, color: Colors.deepOrangeAccent),
                      title: Text("About",
                          style: TextStyle(fontSize: 18, color: Colors.black)),
                      subtitle: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                          style:
                              TextStyle(fontSize: 15, color: Colors.black54)),
                    ),
                    Divider(),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.bottomToTop,
                                child: ChangeNotifierProvider.value(
                                    value: variable, child: IntroViewsPage())));
                      },
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      leading:
                          Icon(Icons.start, color: Colors.deepOrangeAccent),
                      title: Text("Introduction",
                          style: TextStyle(fontSize: 18, color: Colors.black)),
                      subtitle: Text("Help",
                          style:
                              TextStyle(fontSize: 15, color: Colors.black54)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
