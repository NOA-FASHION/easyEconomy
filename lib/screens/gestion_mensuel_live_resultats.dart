import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:easyeconomy/models/easy_economy_models.dart';
import 'package:easyeconomy/screens/build_gestion_mensuel_live.dart';
import 'package:easyeconomy/screens/build_gestion_mensuel_resultats.dart';
import 'package:easyeconomy/screens/screen_indicateur_montant.dart';
import 'package:flutter/material.dart';
import 'package:nanoid/nanoid.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class GestionMensuelLiveResultats extends StatefulWidget {
  final String idGestionMontantUniverselle;
  final int indexMontantUniverselle;
  GestionMensuelLiveResultats(
      {required this.idGestionMontantUniverselle,
      required this.indexMontantUniverselle});

  @override
  _GestionMensuelLiveResultatsState createState() =>
      _GestionMensuelLiveResultatsState();
}

class _GestionMensuelLiveResultatsState
    extends State<GestionMensuelLiveResultats> {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // late PersistentBottomSheetController _bottomSheetController;
  late String nomCharge;
  late String nomRevenu;
  late bool simuOuchargeFixe;
  double montantCharge = 0;
  String unityChallenge = "depensePonctuelle";

  void initState() {
    super.initState();
    simuOuchargeFixe = true;
  }

  @override
  Widget build(BuildContext context) {
    EasyController variable = Provider.of<EasyController>(context);
    List<MontantUniverselle> _listMontantUniverselle = variable
        .getGestionMontantUniverselle(widget.idGestionMontantUniverselle);
    List<MontantUniverselle> _listMontantUniverselleLive = variable
        .getGestionMontantUniverselleLive(widget.idGestionMontantUniverselle);
    return Material(
      child: Scaffold(
        key: scaffoldkey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(260.0),
          child: SafeArea(
            child: AppBar(
              title: Text("Transactions validées"),
              centerTitle: true,
              flexibleSpace: Column(
                children: [
                  Container(
                    height: 90,
                    padding: EdgeInsets.only(top: 20.0),
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/logo.png',
                      width: 140,
                      height: 140,
                    ),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: <Color>[Colors.orange, Colors.blueAccent])),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10.0),
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
                                titre: "Charges validées",
                                icones: Icons.price_change_rounded,
                                listMontantUniverselle: _listMontantUniverselle,
                                listMontantPrevision:
                                    _listMontantUniverselleLive,
                              ),
                              ScreenIndicatorMontant(
                                simuOuchargeFixe: simuOuchargeFixe,
                                titre: "Revenus Validés",
                                icones: Icons.money,
                                listMontantUniverselle: _listMontantUniverselle,
                                listMontantPrevision:
                                    _listMontantUniverselleLive,
                              ),
                              ScreenIndicatorMontant(
                                simuOuchargeFixe: simuOuchargeFixe,
                                titre: "Solde validé",
                                icones: Icons.preview,
                                listMontantUniverselle: _listMontantUniverselle,
                                listMontantPrevision:
                                    _listMontantUniverselleLive,
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
            child: BuildGestionMensuelResultats(
              idGestionMontantUniverselle: widget.idGestionMontantUniverselle,
              indexGestionMensuel: widget.indexMontantUniverselle,
            ),
          ),
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        // floatingActionButton: buildBottomSheet(),
      ),
    );
  }

  // updateController(dynamic value) {
  //   _bottomSheetController.setState!(() {
  //     unityChallenge = value;
  //   });
  // }

  // FloatingActionButton buildBottomSheet() {
  //   return FloatingActionButton(
  //       // child: Lottie.asset('assets/float.json'),
  //       child: Icon(Icons.add),
  //       backgroundColor: Colors.orange[900],
  //       onPressed: () {
  //         _bottomSheetController = scaffoldkey.currentState!.showBottomSheet(
  //           (context) {
  //             return Container(
  //                 alignment: Alignment.center,
  //                 height: MediaQuery.of(context).size.height * 0.5,
  //                 child: Form(
  //                   key: formKey,
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(10.0),
  //                     child: ListView(
  //                       padding: EdgeInsets.all(10.0),
  //                       children: [
  //                         IconButton(
  //                           alignment: Alignment.topRight,
  //                           icon: Icon(
  //                             Icons.cancel,
  //                             color: Colors.black,
  //                           ),
  //                           onPressed: () {
  //                             Navigator.pop(context);
  //                           },
  //                         ),
  //                         SizedBox(
  //                           height: 15.0,
  //                         ),
  //                         TextFormField(
  //                           textCapitalization: TextCapitalization.sentences,
  //                           onSaved: (value) {
  //                             nomCharge = value!;
  //                           },
  //                           validator: (value) {
  //                             if (value!.isEmpty) {
  //                               return "Merci d'entrer un nom ";
  //                             }
  //                             return null;
  //                           },
  //                           decoration: InputDecoration(
  //                               focusedBorder: OutlineInputBorder(
  //                                   borderSide: BorderSide(
  //                                       width: 2.0, color: Colors.blueAccent),
  //                                   borderRadius: BorderRadius.circular(15.0)),
  //                               enabledBorder: OutlineInputBorder(
  //                                   borderSide: BorderSide(
  //                                       width: 1.0, color: Colors.blueAccent),
  //                                   borderRadius: BorderRadius.circular(15.0)),
  //                               contentPadding: EdgeInsets.symmetric(
  //                                   horizontal: 20, vertical: 10),
  //                               labelText: "Nom",
  //                               border: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(15.0))),
  //                         ),
  //                         SizedBox(
  //                           height: 15.0,
  //                         ),
  //                         TextFormField(
  //                           textCapitalization: TextCapitalization.sentences,
  //                           onSaved: (value) {
  //                             montantCharge = double.parse(value!);
  //                           },
  //                           validator: (value) {
  //                             if (value!.isEmpty) {
  //                               return "Merci d'entrer un montant ";
  //                             }
  //                             return null;
  //                           },
  //                           decoration: InputDecoration(
  //                               focusedBorder: OutlineInputBorder(
  //                                   borderSide: BorderSide(
  //                                       width: 2.0, color: Colors.blueAccent),
  //                                   borderRadius: BorderRadius.circular(15.0)),
  //                               enabledBorder: OutlineInputBorder(
  //                                   borderSide: BorderSide(
  //                                       width: 1.0, color: Colors.blueAccent),
  //                                   borderRadius: BorderRadius.circular(15.0)),
  //                               contentPadding: EdgeInsets.symmetric(
  //                                   horizontal: 20, vertical: 10),
  //                               labelText: "Montant",
  //                               border: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(15.0))),
  //                         ),
  //                         SizedBox(
  //                           height: 15.0,
  //                         ),

  //                         SizedBox(
  //                           height: 15.0,
  //                         ),
  //                         DropdownButtonFormField<String>(
  //                           decoration: InputDecoration(
  //                               focusedBorder: OutlineInputBorder(
  //                                   borderSide: BorderSide(
  //                                       width: 2.0, color: Colors.blueAccent),
  //                                   borderRadius: BorderRadius.circular(15.0)),
  //                               enabledBorder: OutlineInputBorder(
  //                                   borderSide: BorderSide(
  //                                       width: 1.0, color: Colors.blueAccent),
  //                                   borderRadius: BorderRadius.circular(15.0)),
  //                               contentPadding: EdgeInsets.symmetric(
  //                                   horizontal: 20, vertical: 10),
  //                               border: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(15.0))),
  //                           value: unityChallenge,
  //                           onChanged: (value) {
  //                             updateController(value);
  //                           },
  //                           onSaved: (value) {
  //                             updateController(value);
  //                           },
  //                           items: <DropdownMenuItem<String>>[
  //                             DropdownMenuItem(
  //                               value: "depensePonctuelle",
  //                               child: Row(
  //                                 children: [
  //                                   Icon(Icons.update,
  //                                       size: 30.0, color: Colors.red),
  //                                   SizedBox(width: 10),
  //                                   Text("depensePonctuelle",
  //                                       style: TextStyle(color: Colors.red)),
  //                                 ],
  //                               ),
  //                             ),
  //                             DropdownMenuItem(
  //                               value: "RevenuPonctuel",
  //                               child: Row(
  //                                 children: [
  //                                   Icon(Icons.auto_fix_normal,
  //                                       size: 30.0, color: Colors.green),
  //                                   SizedBox(width: 10),
  //                                   Text(
  //                                     "RevenuPonctuel",
  //                                     style: TextStyle(color: Colors.green),
  //                                   ),
  //                                 ],
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                         SizedBox(
  //                           height: 15.0,
  //                         ),
  //                         // selectdropdown(
  //                         //     unityChallenge,
  //                         //     Provider.of<Challengecontroller>(context)
  //                         //         .getChallenges()),
  //                         Center(
  //                           child: IconButton(
  //                             iconSize: 60,
  //                             alignment: Alignment.topRight,
  //                             icon: Icon(
  //                               Icons.check_circle,
  //                               color: Colors.orange[900],
  //                             ),
  //                             onPressed: () {
  //                               if (formKey.currentState!.validate()) {
  //                                 formKey.currentState!.save();
  //                                 {}

  //                                 Provider.of<EasyController>(context,
  //                                         listen: false)
  //                                     .addGestionMensuelMontantUniv(
  //                                         id: nanoid(10),
  //                                         montant: montantCharge,
  //                                         nom: nomCharge,
  //                                         unity: unityChallenge,
  //                                         index:
  //                                             widget.indexMontantUniverselle);

  //                                 Navigator.pop(context);
  //                               }
  //                             },
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ));
  //           },
  //         );
  //       });
  // }
}
