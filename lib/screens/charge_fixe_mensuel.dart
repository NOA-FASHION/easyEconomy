import 'package:accordion/accordion.dart';
import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:easyeconomy/models/easy_economy_models.dart';
import 'package:easyeconomy/screens/build_charge_fixe.dart';
import 'package:easyeconomy/screens/screen_indicateur_montant.dart';
import 'package:flutter/material.dart';
import 'package:nanoid/nanoid.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ChargeFixeMensuel extends StatefulWidget {
  ChargeFixeMensuel({Key? key}) : super(key: key);

  @override
  _ChargeFixeMensuelState createState() => _ChargeFixeMensuelState();
}

class _ChargeFixeMensuelState extends State<ChargeFixeMensuel> {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late PersistentBottomSheetController _bottomSheetController;
  late String nomCharge;
  late String nomRevenu;

  double montantCharge = 0;
  String unityChallenge = "RevenuFixe";
  late bool simuOuchargeFixe;
  late IconData icones = Icons.info;
  void initState() {
    super.initState();
    simuOuchargeFixe = false;
  }

  int iconData = 57403;
  final List<int> icons = [
    57403,
    983709,
    57399,
    57400,
    59195,
    57404,
    57406,
    57408,
    60979,
    57413,
    57416,
    60988,
    59211,
    57421,
    59216,
    60998,
    62776,
    59230,
    61012,
    62784,
    61022,
    59245,
    61029,
    59266,
    59272,
    59277,
    59280,
    62835,
    61075,
    62856,
    59307,
    61087,
    59312,
    59318,
    59325,
    57542,
    59348,
    59349,
    59358,
    62916,
    59371,
    62934,
    59407,
    61190,
    61194,
    59419,
    57632,
    61200,
    61205,
    59435,
    61215,
    59445,
    59449,
    63001,
    59451,
    57663,
    57666,
    59459,
    59467,
    59467,
    61257,
    59482,
    63037,
    57713,
    57712,
    61283,
    59510,
    59517,
    59522,
    59525,
    59526,
    59534,
    59533,
    57755,
    57759,
    59571,
    59572,
    57785,
    57790,
    59583,
    59596,
    61377,
    57814,
    61381,
    59600,
    57818,
    59608,
    63169,
    59630,
    57857,
    59647,
    59653,
    59657,
    59665,
    59667,
    59679,
    57892,
    63235,
    59686,
    61466,
    59692,
    61475,
    61476,
    63255,
    63256,
    59709,
    59730,
    59735,
    57955,
    59779,
    61558,
    59792,
    61571,
    63396,
    63404,
    59858,
    61637,
    59860,
    59883,
    63436,
    61680,
    63455,
    59921,
    63477,
    61709,
    61725,
    63502,
    61730,
    59968,
    59978,
    59991,
    61778,
    58231,
    61803,
    60033,
    63592,
    60046,
    61821,
    61827,
    60058,
    61836,
    60064,
    60065,
    63623,
    61863,
    63642,
    60130,
    60141,
    60149,
    63724,
    58391,
    58406,
    61997,
    983078,
    58467,
    60258,
    60271,
    58538,
    983190,
    60347,
    58584,
    62149,
    60388,
    58607,
    58626,
    983280,
    60466,
    60483,
    983336,
    60496,
    60495,
    60506,
    983404,
    62334,
    60562,
    58824,
    62398,
    60634,
    58857,
    60637,
    983491,
    983521,
    983571,
    60746,
    62683,
    59080,
    62600,
    62566,
    59004,
    60780,
    983518,
    58859,
    58840,
    62333,
    60391
  ];

  Widget formfieldDropDown() {
    return Column(
      children: [
        TextFormField(
          textCapitalization: TextCapitalization.sentences,
          onSaved: (value) {
            nomCharge = value!;
          },
          validator: (value) {
            if (value!.isEmpty) {
              return "Merci d'entrer un nom ";
            }
            return null;
          },
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(15.0)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.0, color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(15.0)),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              labelText: "Nom",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0))),
        ),
        SizedBox(
          height: 15.0,
        ),
        TextFormField(
          textCapitalization: TextCapitalization.sentences,
          onSaved: (value) {
            montantCharge = double.parse(value!);
          },
          validator: (value) {
            if (value!.isEmpty) {
              return "Merci d'entrer un montant ";
            }
            return null;
          },
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(15.0)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.0, color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(15.0)),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              labelText: "Montant",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0))),
        ),
        SizedBox(
          height: 15.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(15.0)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.0, color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(15.0)),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0))),
          value: unityChallenge,
          onChanged: (value) {
            updateController(value);
          },
          onSaved: (value) {
            updateController(value);
          },
          items: <DropdownMenuItem<String>>[
            DropdownMenuItem(
              value: "ChargeFixe",
              child: Row(
                children: [
                  Icon(Icons.update, size: 30.0, color: Colors.red),
                  SizedBox(width: 10),
                  Text("ChargeFixe", style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            DropdownMenuItem(
              value: "RevenuFixe",
              child: Row(
                children: [
                  Icon(Icons.auto_fix_normal, size: 30.0, color: Colors.green),
                  SizedBox(width: 10),
                  Text(
                    "RevenuFixe",
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15.0,
        ),
      ],
    );
  }

  Widget gridIcon() {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white70),
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.blueAccent, Colors.orange])),
        height: 400,
        child: Scrollbar(
          thickness: 3,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: icons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.9,
                        crossAxisCount: 6,
                        crossAxisSpacing: 1.0,
                        mainAxisSpacing: 1.0),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 0.2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              onPressed: () {
                                _bottomSheetController.setState!(() {
                                  iconData = icons[index];
                                  icones = IconData(icons[index],
                                      fontFamily: 'MaterialIcons');
                                });
                              },
                              icon: Icon(
                                IconData(icons[index],
                                    fontFamily: 'MaterialIcons'),
                                size: 25,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    EasyController variable = Provider.of<EasyController>(context);
    List<MontantUniverselle> _listMontantUniverselle =
        variable.getMontantUniverselle();
    List<MontantUniverselle> _listMontPrevision =
        variable.getMontantPrevision();
    return Material(
      child: Scaffold(
        key: scaffoldkey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(287.0),
          child: SafeArea(
            child: AppBar(
              elevation: 0,
              title: Text("Charge fixe mensuelle"),
              centerTitle: true,
              flexibleSpace: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 30.0),
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/logo1.png',
                      width: 100,
                      height: 100,
                    ),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: <Color>[Colors.orange, Colors.blueAccent])),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ScreenIndicatorMontant(
                                simuOuchargeFixe: simuOuchargeFixe,
                                titre: "Prévisons charges",
                                icones: Icons.price_change_rounded,
                                listMontantUniverselle: _listMontantUniverselle,
                                listMontantPrevision: _listMontPrevision,
                              ),
                              ScreenIndicatorMontant(
                                simuOuchargeFixe: simuOuchargeFixe,
                                titre: "Prévisions revenus",
                                icones: Icons.money,
                                listMontantUniverselle: _listMontantUniverselle,
                                listMontantPrevision: _listMontPrevision,
                              ),
                              ScreenIndicatorMontant(
                                simuOuchargeFixe: simuOuchargeFixe,
                                titre: "Solde prévisionnel",
                                icones: Icons.preview,
                                listMontantUniverselle: _listMontantUniverselle,
                                listMontantPrevision: _listMontPrevision,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: <Color>[Colors.orange, Colors.blueAccent])),
                  ),
                ],
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
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.orange, Colors.blueAccent])),
            child: BuildChargeFixe(),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: buildBottomSheet(),
      ),
    );
  }

  updateController(dynamic value) {
    _bottomSheetController.setState!(() {
      unityChallenge = value;
    });
  }

  FloatingActionButton buildBottomSheet() {
    return FloatingActionButton(
        // child: Lottie.asset('assets/float.json'),
        child: Icon(Icons.add),
        backgroundColor: Colors.orange[900],
        onPressed: () {
          _bottomSheetController = scaffoldkey.currentState!.showBottomSheet(
            (context) {
              return Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListView(
                        padding: EdgeInsets.all(10.0),
                        children: [
                          // IconButton(
                          //   alignment: Alignment.topRight,
                          //   icon: Icon(
                          //     Icons.cancel,
                          //     color: Colors.black,
                          //   ),
                          //   onPressed: () {
                          //     Navigator.pop(context);
                          //   },
                          // ),
                          SizedBox(
                            height: 5.0,
                          ),
                          formfieldDropDown(),
                          Center(child: Text("Icone de description")),
                          Icon(icones, size: 50.0, color: Colors.red),
                          Accordion(
                            maxOpenSections: 1,
                            leftIcon:
                                Icon(Icons.description, color: Colors.white),
                            children: [
                              AccordionSection(
                                isOpen: false,
                                header: Text("Choisir une icone",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17)),
                                content: gridIcon(),
                              ),
                            ],
                          ),
                          Center(
                            child: IconButton(
                              iconSize: 60,
                              alignment: Alignment.topRight,
                              icon: Icon(
                                Icons.check_circle,
                                color: Colors.orange[900],
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  Provider.of<EasyController>(context,
                                          listen: false)
                                      .addMontanUniverselle(
                                          id: nanoid(10),
                                          montant: montantCharge,
                                          nom: nomCharge,
                                          unity: unityChallenge,
                                          icones: iconData);

                                  Navigator.pop(context);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
            },
          );
        });
  }
}
