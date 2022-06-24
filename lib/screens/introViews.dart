import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:easyeconomy/screens/homeEconomy.dart';
import 'package:easyeconomy/screens/switch.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

import 'package:provider/provider.dart';
import 'package:tab_container/tab_container.dart';
import 'package:url_launcher/url_launcher.dart';

class IntroViewsPage extends StatelessWidget {
  static const routeName = '/IntroViewsPage';

  List<PageViewModel> pageViewModel(
      BuildContext context, EasyController variable) {
    List<Widget> _getTabs3(BuildContext context) => <Widget>[
          Icon(
            Icons.settings,
          ),
          Icon(
            Icons.remove_red_eye,
          ),
          Icon(
            Icons.info,
          ),
        ];
    final pages = [
      ///////////pageView1
      PageViewModel(
          bubbleBackgroundColor: Color.fromRGBO(43, 132, 170, 1),
          pageColor: Colors.grey,
          bubble: Image.asset('assets/logo1.png'),
          body: SingleChildScrollView(
            child: SizedBox(
              height: 160,
              child: TabContainer(
                color: Color.fromRGBO(43, 132, 170, 1),
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    padding: const EdgeInsets.all(15.0),
                    child: SingleChildScrollView(
                      child: Text(
                        "La première étape consiste, à rentrer vos charges et revenus fixes. dans l'onglet 'revenus et charges fixes mensuels'.",
                        maxLines: 3,
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Text(
                        "Vous aurez une idée rapide de vos capacités de consomation.",
                        maxLines: 5,
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox.fromSize(
                          size: Size(50, 50), // button width and height
                          child: ClipOval(
                              child: Material(
                                  color: Colors.blue,
                                  child: InkWell(
                                    // splash color
                                    splashColor: Colors.white,
                                    onTap: () async {
                                      _launchMapsUrl(
                                          "https://esyeconomy.freshdesk.com/support/solutions/articles/73000552862-charges-et-revenus-fixe");
                                    },
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.info,
                                          size: 20,
                                          color: Colors.white,
                                        ), // icon
                                        Text(
                                          "AIDE",
                                          style: TextStyle(
                                              fontSize: 10, color: Colors.white),
                                        ), // text
                                      ],
                                    ),
                                  )))),
                    ),
                  ),
                ],
                tabs: [
                  Icon(
                    Icons.settings,
                  ),
                  Icon(
                    Icons.remove_red_eye,
                  ),
                  Icon(
                    Icons.info,
                  ),
                ],
                isStringTabs: false,
              ),
            ),
          ),
          title: Text(
            'ETAPE 1',
            style: TextStyle(color: Colors.black),
          ),
          titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
          bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
          mainImage: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Card(
                color: Colors.transparent,
                elevation: 15,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/6.png',
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: ChangeNotifierProvider.value(
                    value: variable, child: SwitchEdit()),
              )
            ],
          )),

      ///////////pageView2
      PageViewModel(
        bubbleBackgroundColor: Color.fromRGBO(43, 132, 170, 1),
        pageColor: Colors.white,
        iconImageAssetPath: 'assets/logo1.png',
        body: SingleChildScrollView(
          child: SizedBox(
            height: 160,
            child: TabContainer(
              color: Color.fromRGBO(43, 132, 170, 1),
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: Text(
                      "Documenter vos futures transactions. Par exemple ajouter les photos d'un contrat d'un prêt bancaire ou les informations de vos échéances. ",
                      maxLines: 4,
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: Text(
                      "Chaque validation d'un prêt bancaire par exemple, mettra à jour le nombre d'échéances restantes.",
                      maxLines: 5,
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox.fromSize(
                        size: Size(50, 50), // button width and height
                        child: ClipOval(
                            child: Material(
                                color: Colors.blue,
                                child: InkWell(
                                  // splash color
                                  splashColor: Colors.white,
                                  onTap: () async {
                                    _launchMapsUrl(
                                        "https://esyeconomy.freshdesk.com/support/solutions/articles/73000552865-documenter-vos-transactions");
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.info,
                                        size: 20,
                                        color: Colors.white,
                                      ), // icon
                                      Text(
                                        "AIDE",
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.white),
                                      ), // text
                                    ],
                                  ),
                                )))),
                  ),
                ),
              ],
              tabs: [
                Icon(
                  Icons.settings,
                ),
                Icon(
                  Icons.remove_red_eye,
                ),
                Icon(
                  Icons.info,
                ),
              ],
              isStringTabs: false,
            ),
          ),
        ),
        title: Text(
          'ETAPE 2',
          style: TextStyle(color: Colors.black),
        ),
        mainImage: Card(
          color: Colors.transparent,
          elevation: 15,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/7.png',
            ),
          ),
        ),
        titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
        bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
      ),

      ///////////pageView3
      PageViewModel(
        bubbleBackgroundColor: Color.fromRGBO(43, 132, 170, 1),
        pageColor: const Color(0xFF607D8B),
        iconImageAssetPath: 'assets/logo1.png',
        body: SingleChildScrollView(
          child: SizedBox(
            height: 160,
            child: TabContainer(
              color: Color.fromRGBO(43, 132, 170, 1),
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: Text(
                      "Budgétiser vos dépenses futures. Pour mener à bien votre simulation vous pourrez soit remettre à zero vos tansactions ponctuelles ou désactiver une opération inutile. ",
                      maxLines: 5,
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: Text(
                      "Le simulateur hérite de toutes vos charges et revenus fixes. En rentrant vos dépenses et revenus ponctuels, vous aurez une idée rapide de vos capacités de consomation. ",
                      maxLines: 5,
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox.fromSize(
                        size: Size(50, 50), // button width and height
                        child: ClipOval(
                            child: Material(
                                color: Colors.blue,
                                child: InkWell(
                                  // splash color
                                  splashColor: Colors.white,
                                  onTap: () async {
                                    _launchMapsUrl(
                                        "https://esyeconomy.freshdesk.com/support/solutions/articles/73000552901-simulateur-de-gestion");
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.info,
                                        size: 20,
                                        color: Colors.white,
                                      ), // icon
                                      Text(
                                        "AIDE",
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.white),
                                      ), // text
                                    ],
                                  ),
                                )))),
                  ),
                ),
              ],
              tabs: [
                Icon(
                  Icons.settings,
                ),
                Icon(
                  Icons.remove_red_eye,
                ),
                Icon(
                  Icons.info,
                ),
              ],
              isStringTabs: false,
            ),
          ),
        ),
        title: Text('ETAPE 3'),
        mainImage: Card(
          color: Colors.transparent,
          elevation: 15,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/8.png',
              alignment: Alignment.center,
            ),
          ),
        ),
        titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
        bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
      ),

      ///////////pageView4
      PageViewModel(
        bubbleBackgroundColor: Color.fromRGBO(43, 132, 170, 1),
        pageColor: Color.fromRGBO(123, 142, 183, 1),
        iconImageAssetPath: 'assets/logo1.png',
        body: SingleChildScrollView(
          child: SizedBox(
            height: 160,
            child: TabContainer(
              color: Color.fromRGBO(43, 132, 170, 1),
              children: [
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 1.1,
                      padding: const EdgeInsets.all(15.0),
                      child: SingleChildScrollView(
                        child: Text(
                          "L'onglet 'gestion mensuelle' vous permettra de gérer vos finances périodiquement. Chaque mois hérite automatiquement de toutes vos charges et revenus fixes. ",
                          maxLines: 4,
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: Text(
                      "En rentrant vos dépenses et revenus ponctuels, vous pourrez accéder aux informations nécessaires  pour une gestion efficace  de vos finances.",
                      maxLines: 5,
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox.fromSize(
                        size: Size(50, 50), // button width and height
                        child: ClipOval(
                            child: Material(
                                color: Colors.blue,
                                child: InkWell(
                                  // splash color
                                  splashColor: Colors.white,
                                  onTap: () async {
                                    _launchMapsUrl(
                                        "https://esyeconomy.freshdesk.com/support/solutions/articles/73000552905-gestion-mensuelle");
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.info,
                                        size: 20,
                                        color: Colors.white,
                                      ), // icon
                                      Text(
                                        "AIDE",
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.white),
                                      ), // text
                                    ],
                                  ),
                                )))),
                  ),
                ),
              ],
              tabs: [
                Icon(
                  Icons.settings,
                ),
                Icon(
                  Icons.remove_red_eye,
                ),
                Icon(
                  Icons.info,
                ),
              ],
              isStringTabs: false,
            ),
          ),
        ),
        title: Text('ETAPE 4'),
        mainImage: Card(
          color: Colors.transparent,
          elevation: 15,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/9.png',
              alignment: Alignment.center,
            ),
          ),
        ),
        titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
        bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
      ),

      ///////////pageView5
      PageViewModel(
        bubbleBackgroundColor: Color.fromRGBO(43, 132, 170, 1),
        pageColor: Colors.orangeAccent,
        iconImageAssetPath: 'assets/logo1.png',
        body: SingleChildScrollView(
          child: SizedBox(
            height: 170,
            child: TabContainer(
              color: Color.fromRGBO(43, 132, 170, 1),
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: Text(
                      "Maintenant que vos transactions futures sont visibles, il ne vous restera qu'à valider par un swipe vers la gauche chaque mouvement d'argent. Par exemple l'arrivée de votre salaire.",
                      maxLines: 4,
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: Text(
                      "Les transactions validées se retourveront dans la liste 'Transactions validées'. Si vous tapez sur le tableau de bord 'transactions à venir' vous aurez accès à 'transactions validées'. ",
                      maxLines: 5,
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox.fromSize(
                        size: Size(50, 50), // button width and height
                        child: ClipOval(
                            child: Material(
                                color: Colors.blue,
                                child: InkWell(
                                  // splash color
                                  splashColor: Colors.white,
                                  onTap: () async {
                                    _launchMapsUrl(
                                        "https://esyeconomy.freshdesk.com/support/solutions/articles/73000552906-validation-des-transactions");
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.info,
                                        size: 20,
                                        color: Colors.white,
                                      ), // icon
                                      Text(
                                        "AIDE",
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.white),
                                      ), // text
                                    ],
                                  ),
                                )))),
                  ),
                ),
              ],
              tabs: _getTabs3(context),
              isStringTabs: false,
            ),
          ),
        ),
        title: Text(
          'ETAPE 5',
          style: TextStyle(color: Colors.black),
        ),
        mainImage: Card(
          color: Colors.transparent,
          elevation: 15,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/11.png',
              alignment: Alignment.center,
            ),
          ),
        ),
        titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
        bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
      ),
      ///////////pageView6
      PageViewModel(
        bubbleBackgroundColor: Color.fromRGBO(43, 132, 170, 1),
        pageColor: Colors.orangeAccent,
        iconImageAssetPath: 'assets/logo1.png',
        body: SingleChildScrollView(
          child: SizedBox(
            height: 160,
            child: TabContainer(
              color: Color.fromRGBO(43, 132, 170, 1),
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: Text(
                      "Vous pouvez lorsque vous faites vos emplettes, par exemple vos courses du mois, ajouter les informations de vos articles tel que le prix et le type d'article.",
                      maxLines: 4,
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: Text(
                      "Easytodo se chargera de vous donner en live le montant total de vos achats. ",
                      maxLines: 5,
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox.fromSize(
                        size: Size(50, 50), // button width and height
                        child: ClipOval(
                            child: Material(
                                color: Colors.blue,
                                child: InkWell(
                                  // splash color
                                  splashColor: Colors.white,
                                  onTap: () async {
                                    _launchMapsUrl(
                                        "https://esyeconomy.freshdesk.com/support/solutions/articles/73000552907-liste-des-courses");
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.info,
                                        size: 20,
                                        color: Colors.white,
                                      ), // icon
                                      Text(
                                        "AIDE",
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.white),
                                      ), // text
                                    ],
                                  ),
                                )))),
                  ),
                ),
              ],
              tabs: [
                Icon(
                  Icons.settings,
                ),
                Icon(
                  Icons.remove_red_eye,
                ),
                Icon(
                  Icons.info,
                ),
              ],
              isStringTabs: false,
            ),
          ),
        ),
        title: Text(
          'ETAPE 6',
          style: TextStyle(color: Colors.black),
        ),
        mainImage: Card(
          color: Colors.transparent,
          elevation: 15,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/10.png',
              alignment: Alignment.center,
            ),
          ),
        ),
        titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
        bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
      ),
    ];
    return pages;
  }

  @override
  Widget build(BuildContext context) {
    EasyController variable = Provider.of<EasyController>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IntroViews Flutter', //title of app
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), //ThemeData
      home: Builder(
        builder: (context) => IntroViewsFlutter(
          pageViewModel(context, variable),
          background: Colors.blue,
          showNextButton: true,
          showBackButton: true,
          onTapDoneButton: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider.value(
                    value: variable, child: Home())));
            // Navigator.push(
            //     context,
            //     WaveTransition(
            //         center: FractionalOffset(0.90, 0.90),
            //         duration: Duration(milliseconds: 1000),
            //         child: ChangeNotifierProvider.value(
            //             value: variable, child: Home())));
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => Home(
            //       index: 1,
            //     ),
            //   ), //MaterialPageRoute
            // );
          },
          pageButtonTextStyles: TextStyle(
            color: Colors.blue,
            fontSize: 13.0,
          ),
        ), //IntroViewsFlutter
      ), //Builder
    ); //Material App
  }
}

void _launchMapsUrl(String lien) async {
  launchUrl(
    Uri.parse(lien),
  );
}
