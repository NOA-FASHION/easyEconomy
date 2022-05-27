import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:easyeconomy/screens/homeEconomy.dart';
import 'package:easyeconomy/screens/switch.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:page_transition/page_transition.dart';
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
          bubble: Image.asset('assets/air-hostess.png'),
          body: SingleChildScrollView(
            child: SizedBox(
              height: 160,
              child: TabContainer(
                color: Color.fromRGBO(43, 132, 170, 1),
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "La première étape consiste, à rentrer vos charge et revenus fixe. dans l'onglet revenus et charges fixes mensuels",
                      maxLines: 3,
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Vous aurez une idée rapide de vos capacités de consomations  ",
                      maxLines: 5,
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.start,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.info,
                                          size: 20,
                                          color: Colors.white,
                                        ), // icon
                                        Text(
                                          "AIDE",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white),
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
        iconImageAssetPath: 'assets/waiter.png',
        body: SingleChildScrollView(
          child: SizedBox(
            height: 160,
            child: TabContainer(
              color: Color.fromRGBO(43, 132, 170, 1),
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Documenter vos futur transactions. Par exemple ajouter les photos d'un contrat d'un prêt bancaire ou les informations de vos échéances. ",
                    maxLines: 4,
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Chaque validation d'un prêt bancaire par exemple, mettra a jour les informations suivantes: le restant dû et nombre d'échéance restantes.",
                    maxLines: 5,
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.start,
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
        iconImageAssetPath: 'assets/taxi-driver.png',
        body: SingleChildScrollView(
          child: SizedBox(
            height: 160,
            child: TabContainer(
              color: Color.fromRGBO(43, 132, 170, 1),
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Budgétiser vos dépenses futures. Pour mener à bien votre simulation vous pourrez soit remettre à zero vos tansactions ponctuelles ou désactivé une opération. ",
                    maxLines: 5,
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Le simulateur hérite de toutes vos charges et revenus fixe. En rentrant vos dépenses et revenue ponctuelles, vous aurez une idée rapide de vos capacités de consomations. ",
                    maxLines: 5,
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.start,
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
        iconImageAssetPath: 'assets/taxi-driver.png',
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
                      child: Text(
                        "L'onglet gestion mensuel vous permettra de gérer vos finaces mensuellement. Chaque mois hérite automatiquement de toutes vos charges et revenus fixe. ",
                        maxLines: 4,
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Envrentrant vos dépenses et revenus ponctuels, vous pourrez acceder aux informations nécessaires  pour une gestion efficace  de vos finances.",
                    maxLines: 5,
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.start,
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
        iconImageAssetPath: 'assets/taxi-driver.png',
        body: SingleChildScrollView(
          child: SizedBox(
            height: 170,
            child: TabContainer(
              color: Color.fromRGBO(43, 132, 170, 1),
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Maintenant que vous toutes vos transactions future sont visibles, il vous restera à valider par un swipe vers la gauche chaque mouvement d'argent. Par exemple l'arrivé de votre salaire.",
                    maxLines: 4,
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Les transactions validées se retourveront dans la liste 'Transactions validées'. 2 tableaux de bord sont disponible: transactions à venir et transactions validées ",
                    maxLines: 5,
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.start,
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
        iconImageAssetPath: 'assets/taxi-driver.png',
        body: SingleChildScrollView(
          child: SizedBox(
            height: 160,
            child: TabContainer(
              color: Color.fromRGBO(43, 132, 170, 1),
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Vous pouvez lorsque vous faites vos emplettes, par exemple vos courses du mois, ajouter les informations de vos articles tel que prix type d'articles.",
                    maxLines: 4,
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Easytodo se chargera de vous donner en live le montant total de vos achats. Vous aurez une idée rapide de vos capacité de consomation  ",
                    maxLines: 5,
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.start,
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
          showNextButton: false,
          showBackButton: false,
          onTapDoneButton: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.bottomToTop,
                    child: ChangeNotifierProvider.value(
                        value: variable, child: Home())));
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
            color: Colors.white,
            fontSize: 18.0,
          ),
        ), //IntroViewsFlutter
      ), //Builder
    ); //Material App
  }
}

void _launchMapsUrl(String lien) async {
  final url = lien;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
