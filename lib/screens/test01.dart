import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class OffreProduct extends StatefulWidget {
  @override
  _OffreProductState createState() => _OffreProductState();
}

class _OffreProductState extends State<OffreProduct> {
  late PersistentBottomSheetController _bottomSheetController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  // late FancyDrawerController _controller;
  void initState() {
    super.initState();

    // _controller =
    //     FancyDrawerController(vsync: this, duration: Duration(milliseconds: 50))
    //       ..addListener(() {
    //         setState(() {}); // Must call setState
    //       }); // This chunk of code is important
  }

  Color margeColors = Colors.green;
  String margeText = '';
  double roas1 = 0;
  double marge1 = 0;
  double margeOffre = 0;
  double prixAchat = 0;
  double prixBarre = 0;
  int index = 0;
  double prixVente = 0;
  double roas = 0;
  List<String> offres = [];

  double validateMarge(GlobalKey<FormState> formKey1) {
    double marge = 0;
    if (formKey1.currentState!.validate()) {
      formKey1.currentState!.save();
      {
        setState(() {
          marge = prixVente - prixAchat;
          marge1 = marge;
        });
      }
    }
    return marge;
  }

  double validateRoas(GlobalKey<FormState> formKey1) {
    double roas = 0;
    if (formKey1.currentState!.validate()) {
      formKey1.currentState!.save();
      {
        setState(() {
          roas = prixVente - prixAchat;
          roas1 = roas;
        });
      }
    }
    return roas;
  }

  @override
  Widget build(BuildContext context) {
    // Challengecontroller variable = Provider.of<Challengecontroller>(context);
    return Material(
      child: Scaffold(
        key: scaffoldkey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: SafeArea(
            child: AppBar(
              title: Text("Offres"),
              centerTitle: true,
              flexibleSpace: Container(
                padding: EdgeInsets.only(top: 40.0),
                alignment: Alignment.center,
                height: 130,
                child: Image.asset(
                  'assets/logo.png',
                  width: 55,
                  height: 130,
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[Colors.orange, Colors.pink])),
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
                    colors: [Colors.orange, Colors.pink])),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: buildBottomSheet(),
      ),
    );
  }

  updateController(dynamic value) {
    _bottomSheetController.setState!(() {
      var unityChallenge = value;
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
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 5.0,
                          ),
                          ///////////////////////////////////

                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 15.0,
                            child: Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  maxLines: 6,
                                  style: TextStyle(fontSize: 10),
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  onSaved: (value) {
                                    offres.add(value!);
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Merci d'entrer une offre'";
                                    } else if (value.length > 35) {
                                      return "Pas plus de 50 caractères";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2.0,
                                            color: Colors.blueAccent),
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1.0,
                                            color: Colors.blueAccent),
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    labelText: "offre",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 3.2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    style: TextStyle(fontSize: 10),
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    onSaved: (value) {
                                      prixAchat = double.parse(value!);
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Merci d'entrer le prix d'achat";
                                      } else if (value.length > 35) {
                                        return "Pas plus de 50 caractères";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 2.0,
                                              color: Colors.blueAccent),
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1.0,
                                              color: Colors.blueAccent),
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      labelText: "Prix d'achat",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 2.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 3.2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    style: TextStyle(fontSize: 10),
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    onSaved: (value) {
                                      prixVente = double.parse(value!);
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Merci d'entrer le prix de vente";
                                      } else if (value.length > 35) {
                                        return "Pas plus de 50 caractères";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 2.0,
                                              color: Colors.blueAccent),
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1.0,
                                              color: Colors.blueAccent),
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      labelText: "Prix de vente",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 2.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 3.2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    style: TextStyle(fontSize: 10),
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    onSaved: (value) {
                                      prixBarre = double.parse(value!);
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Merci d'entrer le prix barré";
                                      } else if (value.length > 35) {
                                        return "Pas plus de 50 caractères";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 2.0,
                                              color: Colors.blueAccent),
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1.0,
                                              color: Colors.blueAccent),
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      labelText: "prix barré",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  validateRoas(formKey);
                                  _bottomSheetController.setState!(() {
                                    margeText =
                                        validateRoas(formKey).toString();
                                    if (validateRoas(formKey) > 12) {
                                      margeColors = Colors.green;
                                    } else {
                                      margeColors = Colors.red;
                                    }
                                  });
                                  // setState(() {
                                  //   margeText =
                                  //       validateRoas(formKey).toString();
                                  // });
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 3.2,
                                  child: Card(
                                    color: margeColors,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    elevation: 15.0,
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Card(
                                              color: margeColors,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              elevation: 15.0,
                                              child: Text("Marge")),
                                        ),
                                        Text(margeText)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 3.2,
                                child: Card(
                                  color: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 15.0,
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Card(
                                            color: Colors.green,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            elevation: 15.0,
                                            child: Text("Roas")),
                                      ),
                                      Text("200")
                                    ],
                                  ),
                                ),
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
                                  {
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
