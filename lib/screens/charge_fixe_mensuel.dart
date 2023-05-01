import 'package:accordion/accordion.dart';
import 'package:currency_textfield/currency_textfield.dart';
import 'package:draggable_home/draggable_home.dart';

import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:easyeconomy/models/easy_economy_models.dart';

import 'package:easyeconomy/screens/build_charge_fixe.dart';
import 'package:easyeconomy/screens/cacul_montant_widget.dart';
import 'package:easyeconomy/screens/calcul_montant.dart';
import 'package:easyeconomy/screens/constant.dart';
import 'package:easyeconomy/screens/simulator_gestion.dart';

import 'package:flutter/material.dart';
import 'package:nanoid/nanoid.dart';
import 'package:provider/provider.dart';

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
  var controller = CurrencyTextFieldController(
      currencySymbol: '\$', decimalSymbol: ".", thousandSymbol: ",");
  double montantCharge = 0;
  String unityChallenge = "RevenuFixe";
  late bool simuOuchargeFixe;
  late IconData icones = Icons.info;
  void initState() {
    super.initState();
    simuOuchargeFixe = false;
  }

  void slectedIcon(int index) {
    _bottomSheetController.setState!(() {
      iconData = GlobalConstant.icons[index];
      icones =
          IconData(GlobalConstant.icons[index], fontFamily: 'MaterialIcons');
    });
  }

  int iconData = 57403;

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
    List<MontantUniverselle> _listMontantUniverselle =
        variable.getMontantUniverselle();
    List<MontantUniverselle> _listMontPrevision =
        variable.getMontantPrevision();

    double montantChargessString = CalculMontant().montantCharges(
        _listMontantUniverselle, _listMontPrevision, simuOuchargeFixe);
    double montantRevenuString = CalculMontant().montantRevenu(
        _listMontantUniverselle, _listMontPrevision, simuOuchargeFixe);
    double montantTotalsString = CalculMontant().montantTotals(
        _listMontantUniverselle, _listMontPrevision, simuOuchargeFixe);
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
            backgroundColor: Colors.transparent,
            appBarColor: Colors.orange,
            body: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.orange, Colors.blueAccent])),
                child: BuildChargeFixe(),
              ),
            ],
            headerWidget: ChangeNotifierProvider.value(
              value: variable,
              child: Header(
                context: context,
                variable: variable,
                listMontantUniverselle: _listMontantUniverselle,
                listMontPrevision: _listMontPrevision,
                montantChargesDouble: montantChargessString,
                montantRevenuDouble: montantRevenuString,
                montantTotalsDouble: montantTotalsString,
                simuOuchargeFix: simuOuchargeFixe,
                transactionPasse: false,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaccourciMontant(
                  montant: montantChargessString,
                  colors: Colors.red.shade900,
                ),
                RaccourciMontant(
                  montant: montantRevenuString,
                  colors: Colors.green.shade900,
                ),
                RaccourciMontant(
                  montant: montantTotalsString,
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
                                content: GridIconWidegt(onPressed: slectedIcon),
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

class RaccourciMontant extends StatelessWidget {
  final double montant;
  final Color colors;
  const RaccourciMontant(
      {Key? key, required this.montant, required this.colors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 25.0,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            montant.toStringAsFixed(2) + " \$",
            style: TextStyle(
                fontSize: 13, color: colors, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
