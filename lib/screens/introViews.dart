import 'package:easyeconomy/screens/homeEconomy.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

///  this class uses this library : intro_views_flutter
///  the link to it : https://pub.dev/packages/intro_views_flutter#-installing-tab-

class IntroViewsPage extends StatelessWidget {
  static const routeName = '/IntroViewsPage';

  /// -----------------------------------------------
  /// making list of pages needed to pass in IntroViewsFlutter constructor.
  /// -----------------------------------------------
  final pages = [
    /// -----------------------------------------------
    /// PageViewModel dart class for storing data in it
    /// -----------------------------------------------
    PageViewModel(
        pageColor: const Color(0xFF03A9F4),
        // iconImageAssetPath: 'assets/air-hostess.png',
        /// -----------------------------------------------
        /// bubble Image for indicator.
        /// -----------------------------------------------
        bubble: Image.asset('assets/air-hostess.png'),

        /// -----------------------------------------------
        /// Text details.
        /// -----------------------------------------------
        body: Text(
          'Haselfree  booking  of  flight  tickets  with  full  refund  on  cancelation',
        ),

        /// -----------------------------------------------
        /// Text header .
        /// -----------------------------------------------
        title: Text(
          'Flights',
        ),
        titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
        bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),

        /// -----------------------------------------------
        /// Main image.
        /// -----------------------------------------------
        mainImage: Image.asset(
          'assets/airplane.png',
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        )),
    PageViewModel(
      pageColor: const Color(0xFF8BC34A),
      iconImageAssetPath: 'assets/waiter.png',
      body: Text(
        'We  work  for  the  comfort ,  enjoy  your  stay  at  our  beautiful  hotels',
      ),
      title: Text('Hotels'),
      mainImage: Image.asset(
        'assets/hotel.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
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
      title: Text('Cabs'),
      mainImage: Image.asset(
        'assets/taxi.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    /// -----------------------------------------------
    /// Build main content with MaterialApp widget.
    /// -----------------------------------------------
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IntroViews Flutter', //title of app
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), //ThemeData
      home: Builder(
        /// -----------------------------------------------
        /// Build Into with IntroViewsFlutter widget.
        /// -----------------------------------------------
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
