import 'package:accordion/accordion.dart';
import 'package:currency_textfield/currency_textfield.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:easyeconomy/models/easy_economy_models.dart';
import 'package:easyeconomy/screens/build_gestion_mensuel_live.dart';

import 'package:easyeconomy/screens/calcul_montant_mensuel.dart';
import 'package:easyeconomy/screens/calcul_montant_mensuel_widget.dart';
import 'package:easyeconomy/screens/charge_fixe_mensuel.dart';
import 'package:easyeconomy/screens/constant.dart';
import 'package:easyeconomy/screens/simulator_gestion.dart';

import 'package:flutter/material.dart';
import 'package:nanoid/nanoid.dart';

import 'package:provider/provider.dart';

class GestionMensuelLive extends StatefulWidget {
  final String idGestionMontantUniverselle;
  final int indexMontantUniverselle;
  GestionMensuelLive(
      {required this.idGestionMontantUniverselle,
      required this.indexMontantUniverselle});

  @override
  _GestionMensuelLiveState createState() => _GestionMensuelLiveState();
}

class _GestionMensuelLiveState extends State<GestionMensuelLive> {
  bool _checkbox = false;
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late PersistentBottomSheetController _bottomSheetController;
  var controller = CurrencyTextFieldController(
      currencySymbol: '\$', decimalSymbol: ".", thousandSymbol: ",");
  late String nomCharge;
  late String nomRevenu;
  late bool simuOuchargeFixe;
  double montantCharge = 0;
  String unityChallenge = "depensePonctuelle";
  late IconData icones = Icons.info;
  int iconData = 57403;

  void initState() {
    super.initState();
    simuOuchargeFixe = true;
  }

  void slectedIcon(int index) {
    _bottomSheetController.setState!(() {
      iconData = GlobalConstant.icons[index];
      icones =
          IconData(GlobalConstant.icons[index], fontFamily: 'MaterialIcons');
    });
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
                    itemCount: GlobalConstant.icons.length,
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
                                  iconData = GlobalConstant.icons[index];
                                  icones = IconData(GlobalConstant.icons[index],
                                      fontFamily: 'MaterialIcons');
                                });
                              },
                              icon: Icon(
                                IconData(GlobalConstant.icons[index],
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
    // List<MontantUniverselle> _listMontantUniverselle = variable
    //     .getGestionMontantUniverselle(widget.idGestionMontantUniverselle);
    // List<MontantUniverselle> _listMontantUniverselleLive = variable
    //     .getGestionMontantUniverselleLive(widget.idGestionMontantUniverselle);
    List<MontantUniverselle> _listMontantUniverselle = variable
        .getIndexGestionMontantUniverselle(widget.indexMontantUniverselle);
    List<MontantUniverselle> _listMontantUniverselleLive = variable
        .getIndexGestionMontantUniverselleLive(widget.indexMontantUniverselle);

    double montantChargeDouble = CalculMontantMensuel().montantCharge(
      _listMontantUniverselle,
    );
    double montantChargeLiveDouble = CalculMontantMensuel().montantChargeLive(
      _listMontantUniverselleLive,
    );
    double montantRevenuDouble = CalculMontantMensuel().montantRevenu(
      _listMontantUniverselle,
    );
    double montantRevenuLiveDouble = CalculMontantMensuel().montantRevenuLive(
      _listMontantUniverselleLive,
    );
    double montantTotalsDouble = CalculMontantMensuel().montantTotals(
      _listMontantUniverselle,
    );
    double montantTotalsLiveDouble = CalculMontantMensuel().montantTotalsLive(
      _listMontantUniverselleLive,
    );
    return Material(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.orange, Colors.blueAccent])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          key: scaffoldkey,
          body: DraggableHome(
            headerExpandedHeight: 0.38,
            backgroundColor: Colors.transparent,
            appBarColor: Colors.orange,
            body: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.orange, Colors.blueAccent])),
                child: BuildGestionMensuelLive(
                  idGestionMontantUniverselle:
                      widget.idGestionMontantUniverselle,
                  indexGestionMensuel: widget.indexMontantUniverselle,
                ),
              ),
            ],
            headerWidget: ChangeNotifierProvider.value(
              value: variable,
              child: HeadderMensuel(
                context: context,
                listMontantUniverselle: _listMontantUniverselle,
                idGestionMontantUniverselle: widget.idGestionMontantUniverselle,
                indexMontantUniverselle: widget.indexMontantUniverselle,
                listMontantUniverselleLive: _listMontantUniverselleLive,
                montantCharge: montantChargeDouble,
                montantChargeLive: montantChargeLiveDouble,
                montantRevenu: montantRevenuDouble,
                montantRevenuLive: montantRevenuLiveDouble,
                montantTotals: montantTotalsDouble,
                montantTotalsLive: montantTotalsLiveDouble,
                simuOuchargeFixe: simuOuchargeFixe,
                variable: variable,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaccourciMontant(
                  montant: montantChargeDouble,
                  colors: Colors.red.shade900,
                ),
                RaccourciMontant(
                  montant: montantRevenuDouble,
                  colors: Colors.green.shade900,
                ),
                RaccourciMontant(
                  montant: montantTotalsDouble,
                  colors: Colors.blue.shade900,
                ),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: buildBottomSheet(),
        ),
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
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListView(
                        padding: EdgeInsets.all(10.0),
                        children: [
                          SizedBox(
                            height: 5.0,
                          ),
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
                                    borderSide: BorderSide(
                                        width: 2.0, color: Colors.blueAccent),
                                    borderRadius: BorderRadius.circular(15.0)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1.0, color: Colors.blueAccent),
                                    borderRadius: BorderRadius.circular(15.0)),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                labelText: "Nom",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0))),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TextFormField(
                            controller: controller,
                            textCapitalization: TextCapitalization.sentences,
                            onSaved: (value) {
                              montantCharge = controller.doubleValue;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Merci d'entrer un montant ";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2.0, color: Colors.blueAccent),
                                    borderRadius: BorderRadius.circular(15.0)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1.0, color: Colors.blueAccent),
                                    borderRadius: BorderRadius.circular(15.0)),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
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
                                    borderSide: BorderSide(
                                        width: 2.0, color: Colors.blueAccent),
                                    borderRadius: BorderRadius.circular(15.0)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1.0, color: Colors.blueAccent),
                                    borderRadius: BorderRadius.circular(15.0)),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
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
                                value: "depensePonctuelle",
                                child: Row(
                                  children: [
                                    Icon(Icons.update,
                                        size: 30.0, color: Colors.red),
                                    SizedBox(width: 10),
                                    Text("depensePonctuelle",
                                        style: TextStyle(color: Colors.red)),
                                  ],
                                ),
                              ),
                              DropdownMenuItem(
                                value: "RevenuPonctuel",
                                child: Row(
                                  children: [
                                    Icon(Icons.auto_fix_normal,
                                        size: 30.0, color: Colors.green),
                                    SizedBox(width: 10),
                                    Text(
                                      "RevenuPonctuel",
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
                                content: GridIconWidegt(onPressed: slectedIcon),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                elevation: 5.0,
                                color: Colors.green,
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text(
                                    "Valider la transaction".toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Checkbox(
                                value: _checkbox,
                                onChanged: (value) {
                                  setState(() {
                                    _bottomSheetController.setState!(() {
                                      _checkbox = !_checkbox;
                                    });
                                  });
                                },
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

                                  if (_checkbox) {
                                    Provider.of<EasyController>(context,
                                            listen: false)
                                        .addGestionMensuelMontantUnivLive(
                                            id: nanoid(10),
                                            montant: montantCharge,
                                            nom: nomCharge,
                                            unity: unityChallenge,
                                            index:
                                                widget.indexMontantUniverselle,
                                            icones: iconData);

                                    Navigator.pop(context);
                                  } else {
                                    Provider.of<EasyController>(context,
                                            listen: false)
                                        .addGestionMensuelMontantUniv(
                                            id: nanoid(10),
                                            montant: montantCharge,
                                            nom: nomCharge,
                                            unity: unityChallenge,
                                            index:
                                                widget.indexMontantUniverselle,
                                            icones: iconData);

                                    Navigator.pop(context);
                                  }
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
