import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:easyeconomy/screens/etape_deux.dart';
import 'package:easyeconomy/screens/etape_quatre.dart';
import 'package:easyeconomy/screens/etape_trois.dart';
import 'package:easyeconomy/screens/etape_une.dart';
import 'package:easyeconomy/screens/homeEconomy.dart';
import 'package:easyeconomy/screens/liste_de_course.dart';
import 'package:easyeconomy/screens/switch.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'package:provider/provider.dart';
import 'package:wave_transition/wave_transition.dart';

class HomeScreen extends StatelessWidget {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context, ChangeNotifier variable) {
    Navigator.push(
        context,
            WaveTransition(
                            center: FractionalOffset(0.90, 0.90),
                            duration: Duration(milliseconds: 1000),
            child:
                ChangeNotifierProvider.value(value: variable, child: Home())));
  }

  Widget _buildFullscreenImage() {
    return Image.asset(
      'assets/logo.png',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 17.0);
    EasyController variable = Provider.of<EasyController>(context);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return Material(
      child: IntroductionScreen(
        key: introKey,
        globalBackgroundColor: Colors.white,
        globalHeader: Align(
          alignment: Alignment.topRight,
          child: SafeArea(
            child: ChangeNotifierProvider.value(
                value: variable, child: SwitchEdit()),
          ),
        ),
        globalFooter: SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            child: const Text(
              'Allons-y tout de suite!',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              // _onIntroEnd(context, variable);
              Navigator.push(
                  context,
                       WaveTransition(
                            center: FractionalOffset(0.90, 0.90),
                            duration: Duration(milliseconds: 1000),
                      child: ChangeNotifierProvider.value(
                          value: variable, child: Home())));
            },
          ),
        ),
        pages: [
          PageViewModel(
            useScrollView: true,
            title: "Les meilleures pratiques".toUpperCase(),
            bodyWidget: EtapeUne(),
            decoration: pageDecoration.copyWith(
              titlePadding: EdgeInsets.only(top: 22),
              titleTextStyle: GoogleFonts.playfairDisplay(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              pageColor: Colors.transparent,
              bodyFlex: 2,
              imageFlex: 4,
              bodyAlignment: Alignment.bottomCenter,
              imageAlignment: Alignment.topCenter,
            ),
            // image: _buildImage('logo.png', 100),
            reverse: true,
          ),
          PageViewModel(
            useScrollView: true,
            title: "Les meilleures pratiques".toUpperCase(),
            bodyWidget: EtapeDeux(),
            decoration: pageDecoration.copyWith(
              titlePadding: EdgeInsets.only(top: 22),
              titleTextStyle: GoogleFonts.playfairDisplay(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              pageColor: Colors.transparent,
              bodyFlex: 2,
              imageFlex: 4,
              bodyAlignment: Alignment.bottomCenter,
              imageAlignment: Alignment.topCenter,
            ),
            // image: _buildImage('logo.png', 100),
            reverse: true,
          ),
          PageViewModel(
            useScrollView: true,
            title: "Les meilleures pratiques".toUpperCase(),
            bodyWidget: EtapeTrois(),
            decoration: pageDecoration.copyWith(
              titlePadding: EdgeInsets.only(top: 22),
              titleTextStyle: GoogleFonts.playfairDisplay(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              pageColor: Colors.transparent,
              bodyFlex: 2,
              imageFlex: 4,
              bodyAlignment: Alignment.bottomCenter,
              imageAlignment: Alignment.topCenter,
            ),
            // image: _buildImage('logo.png', 100),
            reverse: true,
          ),
          PageViewModel(
            useScrollView: true,
            title: "Les meilleures pratiques".toUpperCase(),
            bodyWidget: EtapeQuatre(),
            decoration: pageDecoration.copyWith(
              titlePadding: EdgeInsets.only(top: 22),
              titleTextStyle: GoogleFonts.playfairDisplay(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              pageColor: Colors.transparent,
              bodyFlex: 2,
              imageFlex: 4,
              bodyAlignment: Alignment.bottomCenter,
              imageAlignment: Alignment.topCenter,
            ),
            // image: _buildImage('logo.png', 100),
            reverse: true,
          ),
          PageViewModel(
            useScrollView: true,
            title: "Les meilleures pratiques".toUpperCase(),
            bodyWidget: ListDeCourse(),
            decoration: pageDecoration.copyWith(
              titlePadding: EdgeInsets.only(top: 22),
              titleTextStyle: GoogleFonts.playfairDisplay(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              pageColor: Colors.transparent,
              bodyFlex: 2,
              imageFlex: 4,
              bodyAlignment: Alignment.bottomCenter,
              imageAlignment: Alignment.topCenter,
            ),
            // image: _buildImage('logo.png', 100),
            reverse: true,
          ),
          // PageViewModel(
          //   useScrollView: true,
          //   title: "Les meilleures pratiques".toUpperCase(),
          //   bodyWidget: ListeDeMusics(),
          //   decoration: pageDecoration.copyWith(
          //     titlePadding: EdgeInsets.only(top: 22),
          //     titleTextStyle: GoogleFonts.playfairDisplay(
          //       fontWeight: FontWeight.bold,
          //       fontSize: 20,
          //     ),
          //     pageColor: Colors.transparent,
          //     bodyFlex: 2,
          //     imageFlex: 4,
          //     bodyAlignment: Alignment.bottomCenter,
          //     imageAlignment: Alignment.topCenter,
          //   ),
          //   // image: _buildImage('logo.png', 100),
          //   reverse: true,
          // ),
          // PageViewModel(
          //   useScrollView: true,
          //   title: "Les meilleures pratiques".toUpperCase(),
          //   bodyWidget: RestaurantList(),
          //   decoration: pageDecoration.copyWith(
          //     titlePadding: EdgeInsets.only(top: 22),
          //     titleTextStyle: GoogleFonts.playfairDisplay(
          //       fontWeight: FontWeight.bold,
          //       fontSize: 20,
          //     ),
          //     pageColor: Colors.transparent,
          //     bodyFlex: 2,
          //     imageFlex: 4,
          //     bodyAlignment: Alignment.bottomCenter,
          //     imageAlignment: Alignment.topCenter,
          //   ),
          //   // image: _buildImage('logo.png', 100),
          //   reverse: true,
          // ),
          // PageViewModel(
          //   useScrollView: true,
          //   title: "Les meilleures pratiques".toUpperCase(),
          //   bodyWidget: ShareChallenge(),
          //   decoration: pageDecoration.copyWith(
          //     titlePadding: EdgeInsets.only(top: 22),
          //     titleTextStyle: GoogleFonts.playfairDisplay(
          //       fontWeight: FontWeight.bold,
          //       fontSize: 20,
          //     ),
          //     pageColor: Colors.transparent,
          //     bodyFlex: 2,
          //     imageFlex: 4,
          //     bodyAlignment: Alignment.bottomCenter,
          //     imageAlignment: Alignment.topCenter,
          //   ),
          //   // image: _buildImage('logo.png', 100),
          //   reverse: true,
          // ),
        ],
        onDone: () {
          // _onIntroEnd(context, variable);
          Navigator.push(
              context,
                  WaveTransition(
                            center: FractionalOffset(0.90, 0.90),
                            duration: Duration(milliseconds: 1000),
                  child: ChangeNotifierProvider.value(
                      value: variable, child: Home())));
        },
        //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
        showSkipButton: false,
        skipOrBackFlex: 0,
        nextFlex: 0,
        showBackButton: true,
        //rtl: true, // Display as right-to-left
        back: const Icon(Icons.arrow_back),
        skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
        next: const Icon(Icons.arrow_forward),
        done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),
        controlsPadding: kIsWeb
            ? const EdgeInsets.all(12.0)
            : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        dotsContainerDecorator: const ShapeDecoration(
          color: Colors.black87,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }
}
