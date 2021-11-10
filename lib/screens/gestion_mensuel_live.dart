import 'package:accordion/accordion.dart';
import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:easyeconomy/models/easy_economy_models.dart';
import 'package:easyeconomy/screens/build_gestion_mensuel_live.dart';
import 'package:easyeconomy/screens/screen_indicateur_montant.dart';
import 'package:easyeconomy/screens/screen_indicator_montant_gestionMensuel_live.dart';
import 'package:flutter/material.dart';
import 'package:nanoid/nanoid.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import 'gestion_mensuel_live_resultats.dart';

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
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late PersistentBottomSheetController _bottomSheetController;
  late String nomCharge;
  late String nomRevenu;
  late bool simuOuchargeFixe;
  double montantCharge = 0;
  String unityChallenge = "depensePonctuelle";
  late IconData icones = Icons.info;
  final List<IconData> icons = [
    Icons.access_time_outlined,
    Icons.accessibility,
    Icons.account_balance,
    Icons.accessible_rounded,
    Icons.account_balance_wallet_outlined,
    Icons.account_box_rounded,
    Icons.account_tree_outlined,
    Icons.add_a_photo_rounded,
    Icons.add_alert,
    Icons.add_box_outlined,
    Icons.add_business_rounded,
    Icons.add_call,
    Icons.add_location,
    Icons.add_photo_alternate_outlined,
    Icons.add_shopping_cart,
    Icons.add_to_drive_sharp,
    Icons.add_to_queue_rounded,
    Icons.agriculture_sharp,
    Icons.airline_seat_flat_outlined,
    Icons.airplane_ticket,
    Icons.airplanemode_active,
    Icons.airport_shuttle_rounded,
    Icons.apartment_sharp,
    Icons.approval,
    Icons.architecture,
    Icons.archive_rounded,
    Icons.arrow_drop_down_circle_outlined,
    Icons.article,
    Icons.assistant_rounded,
    Icons.atm,
    Icons.attach_email_outlined,
    Icons.audiotrack_sharp,
    Icons.backup_rounded,
    Icons.bathroom,
    Icons.battery_charging_full,
    Icons.blender_sharp,
    Icons.book_outlined,
    Icons.build_outlined,
    Icons.bungalow_outlined,
    Icons.business,
    Icons.business_center_outlined,
    Icons.cake_rounded,
    Icons.call_to_action,
    Icons.car_rental,
    Icons.car_repair_sharp,
    Icons.card_giftcard_sharp,
    Icons.carpenter_sharp,
    Icons.charging_station_rounded,
    Icons.checkroom,
    Icons.child_friendly,
    Icons.coffee_outlined,
    Icons.commute_outlined,
    Icons.bed_rounded,
    Icons.connected_tv_rounded,
    Icons.construction,
    Icons.credit_card_rounded,
    Icons.deck_sharp,
    Icons.delivery_dining,
    Icons.devices_outlined,
    Icons.dining,
    Icons.directions_bike,
    Icons.directions_boat,
    Icons.directions_railway_outlined,
    Icons.directions_run_rounded,
    Icons.disc_full_sharp,
    Icons.dns_sharp,
    Icons.downhill_skiing_outlined,
    Icons.download,
    Icons.drafts_outlined,
    Icons.drive_eta_sharp,
    Icons.dry_cleaning_rounded,
    Icons.eco,
    Icons.electric_bike,
    Icons.electric_scooter_sharp,
    Icons.elevator,
    Icons.emoji_events_sharp,
    Icons.emoji_food_beverage_outlined,
    Icons.emoji_objects,
    Icons.engineering,
    Icons.equalizer,
    Icons.euro,
    Icons.event_seat_sharp,
    Icons.extension,
    Icons.fact_check,
    Icons.food_bank,
    Icons.free_breakfast,
    Icons.garage,
    Icons.gite,
    Icons.golf_course,
    Icons.gps_fixed,
    Icons.handyman_sharp,
    Icons.headset,
    Icons.health_and_safety,
    Icons.home_rounded,
    Icons.kayaking_sharp,
    Icons.laptop_windows_sharp,
    Icons.liquor_rounded,
    Icons.local_gas_station_sharp,
    Icons.local_grocery_store_outlined,
    Icons.local_movies_outlined,
    Icons.local_pizza,
    Icons.local_shipping_outlined,
    Icons.local_taxi,
    Icons.luggage,
    Icons.map_sharp,
    Icons.monetization_on_rounded,
    Icons.outdoor_grill_outlined,
    Icons.park_rounded,
    Icons.payments_rounded,
    Icons.payment,
    Icons.phone_android,
    Icons.pie_chart,
    Icons.plumbing_rounded,
    Icons.point_of_sale_sharp,
    Icons.print,
    Icons.receipt_long_outlined,
    Icons.sailing,
    Icons.school_rounded,
    Icons.sd_card_rounded,
    Icons.settings,
    Icons.sports_football,
    Icons.sports_esports_rounded,
    Icons.sports_motorsports_rounded,
    Icons.store_sharp,
    Icons.vpn_key,
    Icons.youtube_searched_for,
    Icons.yard_rounded,
    Icons.verified
  ];

  void initState() {
    super.initState();
    simuOuchargeFixe = true;
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
                                  icones = icons[index];
                                });
                              },
                              icon: Icon(
                                icons[index],
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
    List<MontantUniverselle> _listMontantUniverselle = variable
        .getGestionMontantUniverselle(widget.idGestionMontantUniverselle);
    List<MontantUniverselle> _listMontantUniverselleLive = variable
        .getGestionMontantUniverselleLive(widget.idGestionMontantUniverselle);
    return Material(
      child: Scaffold(
        key: scaffoldkey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(337.0),
          child: SafeArea(
            child: AppBar(
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 27, top: 17),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        splashColor: Colors.white,
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.bottomToTop,
                                  child: ChangeNotifierProvider.value(
                                      value: variable,
                                      child: GestionMensuelLiveResultats(
                                        idGestionMontantUniverselle:
                                            widget.idGestionMontantUniverselle,
                                        indexMontantUniverselle:
                                            widget.indexMontantUniverselle,
                                      ))));
                        },
                        child: Icon(
                          Icons.backpack,
                          size: 20,
                          color: Colors.white,
                        ),
                      ), // icon
                      Text(
                        "transaction",
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ), // text
                    ],
                  ),
                ),
              ],
              title: Text("Mois en cours"),
              centerTitle: true,
              flexibleSpace: Column(
                children: [
                  Container(
                    height: 90,
                    padding: EdgeInsets.only(top: 40.0),
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/logo.png',
                      width: 55,
                      height: 130,
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
                              ScreenIndicatorMontantGestionLive(
                                titre: _listMontantUniverselleLive.length > 0
                                    ? 'Charges restantes'
                                    : "Prévisons charges",
                                icones: Icons.price_change_rounded,
                                gestionListMontantUniverselle:
                                    _listMontantUniverselle,
                                gestionListMontantUniverselleLive:
                                    _listMontantUniverselleLive,
                                titre1: 'Charges live',
                              ),
                              ScreenIndicatorMontantGestionLive(
                                titre: _listMontantUniverselleLive.length > 0
                                    ? 'revenus restants'
                                    : "Prévisions revenus",
                                icones: Icons.money,
                                gestionListMontantUniverselle:
                                    _listMontantUniverselle,
                                gestionListMontantUniverselleLive:
                                    _listMontantUniverselleLive,
                                titre1: 'Revenus live',
                              ),
                              ScreenIndicatorMontantGestionLive(
                                titre: _listMontantUniverselleLive.length > 0
                                    ? 'Soldes restants'
                                    : "Prévisions Soldes",
                                icones: Icons.preview,
                                gestionListMontantUniverselle:
                                    _listMontantUniverselle,
                                gestionListMontantUniverselleLive:
                                    _listMontantUniverselleLive,
                                titre1: 'Soldes Live',
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
            child: BuildGestionMensuelLive(
              idGestionMontantUniverselle: widget.idGestionMontantUniverselle,
              indexGestionMensuel: widget.indexMontantUniverselle,
            ),
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
                          IconButton(
                            alignment: Alignment.topRight,
                            icon: Icon(
                              Icons.cancel,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          SizedBox(
                            height: 15.0,
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
                                  {}

                                  Provider.of<EasyController>(context,
                                          listen: false)
                                      .addGestionMensuelMontantUniv(
                                          id: nanoid(10),
                                          montant: montantCharge,
                                          nom: nomCharge,
                                          unity: unityChallenge,
                                          index: widget.indexMontantUniverselle,
                                          icones: icones);

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
