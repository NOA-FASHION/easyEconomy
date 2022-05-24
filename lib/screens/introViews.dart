import 'package:easyeconomy/screens/homeEconomy.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class IntroViewsPage extends StatelessWidget {
  static const routeName = '/IntroViewsPage';

  final pages = [
    PageViewModel(
        pageColor: Colors.grey,
        bubble: Image.asset('assets/air-hostess.png'),
        body: SingleChildScrollView(
          child: Container(
            height: 200,
            child: Column(
              children: [
                Text(
                  "La première étape consiste, à rentrer vos charge et revenus fixe. dans l'onglet revenus fixe mensuel",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                Text(
                  "Vous aurez une idée rapide de vos capacité de consomation  ",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                )
              ],
            ),
          ),
        ),
        title: Text(
          'ETAPE 1',
          style: TextStyle(color: Colors.black),
        ),
        titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
        bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
        mainImage: Image.asset(
          'assets/6.png',
        )),
    PageViewModel(
      pageColor: Colors.white,
      iconImageAssetPath: 'assets/waiter.png',
      body: Text(
        'We  work  for  the  comfort ,  enjoy  your  stay  at  our  beautiful  hotels',
        style: TextStyle(color: Colors.black),
      ),
      title: Text(
        'ETAPE 2',
        style: TextStyle(color: Colors.black),
      ),
      mainImage: Image.asset(
        'assets/7.png',
      ),
      titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
    PageViewModel(
      pageColor: const Color(0xFF607D8B),
      iconImageAssetPath: 'assets/taxi-driver.png',
      body: Text(
        'Easy  cab  booking  at  your  doorstep  with  cashless  payment  system',
      ),
      title: Text('ETAPE 3'),
      mainImage: Image.asset(
        'assets/8.png',
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
    PageViewModel(
      pageColor: Color.fromRGBO(123, 142, 183, 1),
      iconImageAssetPath: 'assets/taxi-driver.png',
      body: Text(
        'Easy  cab  booking  at  your  doorstep  with  cashless  payment  system',
      ),
      title: Text('ETAPE 4'),
      mainImage: Image.asset(
        'assets/9.png',
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
    PageViewModel(
      pageColor: Colors.white,
      iconImageAssetPath: 'assets/taxi-driver.png',
      body: Text(
        'Easy  cab  booking  at  your  doorstep  with  cashless  payment  system',
        style: TextStyle(color: Colors.black),
      ),
      title: Text(
        'ETAPE 5',
        style: TextStyle(color: Colors.black),
      ),
      mainImage: Image.asset(
        'assets/10.png',
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IntroViews Flutter', //title of app
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), //ThemeData
      home: Builder(
        builder: (context) => IntroViewsFlutter(
          pages,
          showNextButton: true,
          showBackButton: true,
          onTapDoneButton: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(
                  index: 1,
                ),
              ), //MaterialPageRoute
            );
          },
          pageButtonTextStyles: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ), //IntroViewsFlutter
      ), //Builder
    ); //Material App
  }
}
