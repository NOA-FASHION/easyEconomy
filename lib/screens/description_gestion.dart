import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nanoid/nanoid.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class DescriptionGestion extends StatefulWidget {
  DescriptionGestion({Key? key}) : super(key: key);

  @override
  _DescriptionGestionState createState() => _DescriptionGestionState();
}

class _DescriptionGestionState extends State<DescriptionGestion> {
  
  bool isSwitched = false;
  String unityPattern = "unity_challenge1.";
  late String idChallenge1;
  late String nombreEchenace;
  late String nomAdresse;
  late String villeAdresse;
  late String adresse;
  late String telephone;
  late String paysAdresse;
  late String prixProduit;
  late String coutPaiment;
  late List<String> docPaths;
  late String _image;
  late String _video;
  late String wait = "assets/wait.json";
   final picker = ImagePicker();
  late bool _visibility1 = true;

  Future getImageCamera() async {
    _bottomSheetController.setState!(() {
      _changeVisibility(false);
    });
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        coutPaiment = "0";
        prixProduit = "0";
        dataJoin = pickedFile.path;
        _image = pickedFile.path;
        _bottomSheetController.setState!(() {
          wait = "assets/picture.json";
        });
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImageGallery() async {
    _bottomSheetController.setState!(() {
      _changeVisibility(false);
    });
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        coutPaiment = "0";
        prixProduit = "0";
        dataJoin = pickedFile.path;
        _image = pickedFile.path;
        _bottomSheetController.setState!(() {
          wait = "assets/picture.json";
        });
      } else {
        print('No image selected.');
      }
    });
  }

  

  void _changeVisibility(bool visibility) {
    setState(() {
      _visibility1 = visibility;
    });
  }

  bool isNumericUsingRegularExpression(String string) {
    final numericRegex = RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$');

    return numericRegex.hasMatch(string);
  }

  void initState() {
    super.initState();
    coutPaiment = "0";
    prixProduit = "0";
  }

  late bool idChallengeBool1;
  late bool idChallengePaimentBool1;
  late bool idChallengeEcheanceBool1;
  late bool idChalEcheanceAutoBool1;

  late final bool animatedpadding;
  late final String something;
  late final int indexChallenge;
  late String dataJoin;
  
  // _HomeTachesState(this.indexChallenge, this.something, this.animatedpadding);
  final GlobalKey<ScaffoldState> scaffoldkeyTache = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKeyTache = GlobalKey<FormState>();
  late PersistentBottomSheetController _bottomSheetController;
  String unityChallenge = "evenement";
  late String targetChallenge;
  late String totalChallengeEnCours;
  int totaChallengeEnCours1 = 0;
  double percentok = 0;
  String percentokString = "0";
  double percentage(String percent) {
    var percent1;

    percent1 = (double.parse(percent) / 100);
    return percent1;
  }

  

  Future<Null> delay(int milliseconds) {
    return new Future.delayed(new Duration(milliseconds: milliseconds));
  }

  retour() async {
    await delay(500);
    Navigator.pop(context);
    unityChallenge = "evenement";
  }

  Widget selectdropdown(
      String resultat, List<ChallengeModel> _challengeList, dynamic context) {
    Widget documentJoint = SizedBox(
      width: 1.0,
    );
     if (resultat == "image") {
      documentJoint = Column(
        children: [
          Offstage(
            offstage: _visibility1,
            child: Container(
              height: 100,
              width: 100,
              child: Center(child: Lottie.asset(wait)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () async {
                    getImageGallery();
                  },
                  child: Container(
                      width: 120.0,
                      height: 120.0,
                      child: Lottie.asset('assets/upload.json'))),
              SizedBox(
                width: 15.0,
              ),
              InkWell(
                  onTap: () async {
                    getImageCamera();
                  },
                  child: Container(
                      width: 120.0,
                      height: 120.0,
                      child: Lottie.asset('assets/photo.json'))),
            ],
          ),
        ],
      );
    } else if (resultat == "commentaire") {
 
      documentJoint = SizedBox(
        width: 200.0,
        height: 300.0,
        child: TextFormField(
          textCapitalization: TextCapitalization.sentences,
          maxLines: 30,
          onSaved: (value) {
            coutPaiment = "0";
            prixProduit = "0";
            dataJoin = value!;
          },
          validator: (value) {
            if (value!.isEmpty) {
              return "Merci de laisser un commentaire";
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
              labelText: "Commentaire",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0))),
        ),
      );
    } else if (resultat == "achat") {
      documentJoint = Row(
        children: [
          Container(
            width: 100,
            child: TextFormField(
              onSaved: (value) {
                coutPaiment = "0";

                prixProduit = value!;
              },
              validator: (value) {
                if (!isNumericUsingRegularExpression(value!)) {
                  return "Rentrer un prix";
                }
                return null;
              },
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2.0, color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(15.0)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1.0, color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(15.0)),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  labelText: "Prix",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0))),
            ),
          ),
          Text("€")
        ],
      );
    }  else if (resultat == "echeancier") {
      documentJoint = Row(
        children: [
          Column(
            children: [
              Container(
                width: 120,
                child: TextFormField(
                  onSaved: (value) {
                    prixProduit = "0";
                    coutPaiment = value!;
                  },
                  validator: (value) {
                    if (!isNumericUsingRegularExpression(value!)) {
                      return "Montant d'une échéance";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(15.0)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1.0, color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(15.0)),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      labelText: "Échéance",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                ),
              ),
              SizedBox(
                height: 7.0,
              ),
              Container(
                width: 200,
                child: TextFormField(
                  onSaved: (value) {
                    nombreEchenace = value!;
                  },
                  validator: (value) {
                    if (!isNumericUsingRegularExpression(value!)) {
                      return "Nombre d'échéance";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(15.0)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1.0, color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(15.0)),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      labelText: "Nombre d'échéance",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                ),
              ),
            ],
          ),
          Text("€")
        ],
      );
    }
    return documentJoint;
  }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  @override
  @override
  Widget build(BuildContext context) {
    EasyController variable = Provider.of<EasyController>(context);
    List<ChallengeModel> _challengesListget = variable.getChallenges();
    // isSwitched = _challengesListget[widget.indexChallenge].prelevementAutoBool;
    
    return Scaffold(
      key: scaffoldkeyTache,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: SafeArea(
          child: AppBar(
            title: Text(something),
            actions: [
            
            ],
            backgroundColor: Colors.blue,
            centerTitle: true,
            flexibleSpace: Container(
              padding: EdgeInsets.only(top: 40.0),
              alignment: Alignment.center,
              height: 130,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  idChallengePaimentBool1
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Card(
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              elevation: 25.0,
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(5)),
                                    padding: EdgeInsets.all(4),
                                    margin: EdgeInsets.only(right: 7),
                                    child: Column(
                                      children: [
                                        Text(
                                          _challengesListget[indexChallenge]
                                                  .coutTotal
                                                  .toStringAsFixed(2) +
                                              "€",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          "Total paiement",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(5)),
                                    padding: EdgeInsets.all(4),
                                    child: Column(
                                      children: [
                                        Text(
                                          _challengesListget[indexChallenge]
                                                  .restePaiement
                                                  .toStringAsFixed(2) +
                                              "€",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          "Reste à payer",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ), // icon
                            // text
                          ],
                        )
                      : SizedBox(width: 10),
                  idChallengeBool1
                      // _challengesListget[widget.indexChallenge].prixTotalBool
                      ? SizedBox(width: 90)
                      : SizedBox(width: 1),
                  Container(
                    margin: idChallengeEcheanceBool1
                        ? EdgeInsets.only(right: 25)
                        : EdgeInsets.only(right: 0),
                    child: Image.asset(
                      'assets/logo.png',
                      width: 55,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[Colors.purple, Colors.blue])),
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
                  colors: [Colors.purple, Colors.blue])),
          child: 
        ),
      ),
      backgroundColor: Color(0xff414a4c),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: buildBottomSheet(),
    );
  }

  updateController(dynamic value) {
    _bottomSheetController.setState!(() {
      unityChallenge = value;
    });
  }

  FloatingActionButton buildBottomSheet() {
    EasyController variable = Provider.of<EasyController>(context);
    List<ChallengeModel> _challengesListget = variable.getChallenges();
    return FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.orange[900],
        onPressed: () {
          _image = "";
          _bottomSheetController =
              scaffoldkeyTache.currentState!.showBottomSheet(
            (context) {
              return Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Form(
                    key: formKeyTache,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListView(
                        children: [
                          DropdownButtonFormField(
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    // borderSide: BorderSide(
                                    //     width: 2.0, color: Colors.blueAccent),
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
                              _visibility1 = true;
                              wait = "assets/wait.json";
                            },
                            onSaved: (value) {
                              updateController(value);
                            },
                            items: <DropdownMenuItem>[
                            
                              DropdownMenuItem(
                                value: "achat",
                                child: Row(
                                  children: [
                                    Icon(Icons.shopping_cart,
                                        size: 30.0, color: Colors.cyan),
                                    SizedBox(width: 10),
                                    Text(
                                      "Achat",
                                      style: TextStyle(
                                        color: Colors.cyan,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              DropdownMenuItem(
                                value: "tache",
                                child: Row(
                                  children: [
                                    Icon(Icons.event_available,
                                        size: 30.0, color: Colors.orange),
                                    SizedBox(width: 10),
                                    Text(
                                      "Tâche",
                                      style: TextStyle(
                                        color: Colors.orange,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                             
                              DropdownMenuItem(
                                value: "information",
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.perm_device_information,
                                      size: 30.0,
                                    ),
                                    SizedBox(width: 10),
                                    Text("Information"),
                                  ],
                                ),
                              ),
                            
                              DropdownMenuItem(
                                value: "echeancier",
                                child: Row(
                                  children: [
                                    Icon(Icons.payment,
                                        size: 30.0, color: Colors.yellow),
                                    SizedBox(width: 10),
                                    Text(
                                      "Échéancier",
                                      style: TextStyle(
                                        color: Colors.yellow,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              DropdownMenuItem(
                                value: "commentaire",
                                child: Row(
                                  children: [
                                    Icon(Icons.comment,
                                        size: 30.0, color: Colors.blueGrey),
                                    SizedBox(width: 10),
                                    Text(
                                      "Commentaire",
                                      style: TextStyle(
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          
                              DropdownMenuItem(
                                value: "image",
                                child: Row(
                                  children: [
                                    Icon(Icons.text_fields,
                                        size: 30.0, color: Colors.pink),
                                    SizedBox(width: 10),
                                    Text(
                                      "Image",
                                      style: TextStyle(
                                        color: Colors.pink,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                             
                            ],
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TextFormField(
                            textCapitalization: TextCapitalization.sentences,
                            onSaved: (value) {
                              targetChallenge = value!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Merci d'entrer une description pour la mission";
                              } else if (value.length > 35) {
                                return "Pas plus de 50 caractères";
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
                              labelText: "Description",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          selectdropdown(
                              unityChallenge, _challengesListget, context),
                          Center(
                            child: IconButton(
                              iconSize: 60,
                              alignment: Alignment.topRight,
                              icon: Icon(
                                Icons.check_circle,
                                color: Colors.orange[900],
                              ),
                              onPressed: () {
                               if (formKeyTache.currentState!
                                    .validate()) {
                                  formKeyTache.currentState!.save();
                                  setState(() {
                                    Provider.of<EasyController>(context,
                                            listen: false)
                                        .addChallenge2(
                                            prix: double.parse(prixProduit),
                                            cout: double.parse(coutPaiment),
                                            id: nanoid(10),
                                            index: widget.indexChallenge,
                                            animatedpadding: animatedpadding,
                                            totalChallenge: '1',
                                            idListChallenge: widget.id,
                                            name: dataJoin,
                                            description: unityChallenge,
                                            tache: targetChallenge,
                                            formation: formations);
                                  });
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
