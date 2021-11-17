import 'package:accordion/accordion.dart';
import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:easyeconomy/models/easy_economy_models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class TransactionEdit extends StatefulWidget {
  final MontantUniverselle item;
  final int indexGestion;

  TransactionEdit({Key? key, required this.indexGestion, required this.item})
      : super(key: key);

  @override
  _TransactionEditState createState() => _TransactionEditState();
}

class _TransactionEditState extends State<TransactionEdit> {
  late IconData icones = Icons.info;
  int iconData = 57403;
  final List<int> icons = [
    57403,
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
    983709,
    59068,
    59068,
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
  Widget gridIcon(EasyController provider) {
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
                                iconData = icons[index];
                                icones = IconData(icons[index],
                                    fontFamily: 'MaterialIcons');
                                provider.changeIcons(
                                    indexGestion: widget.indexGestion,
                                    icons: icons[index]);
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
    final EasyController provider = Provider.of<EasyController>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(140.0),
        child: SafeArea(
          child: AppBar(
            centerTitle: true,
            flexibleSpace: Container(
              padding: EdgeInsets.only(right: 20.0),
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    width: 140,
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // AdvanceTextField(
                //   type: AdvanceTextFieldType.EDIT,
                //   editLabel: Icon(
                //     Icons.edit,
                //     color: Colors.white,
                //   ),
                //   saveLabel: Icon(
                //     Icons.check,
                //     color: Colors.white,
                //   ),
                //   textHint: widget.item.montant.toString(),
                //   onEditTap: () {},
                //   onSaveTap: (text) {
                //     print('value is: $text');
                //     provider.changePrix(
                //         indexGestion: widget.indexGestion, montant: text);
                //   },
                // ),
                // AdvanceTextField(
                //   type: AdvanceTextFieldType.EDIT,
                //   editLabel: Icon(
                //     Icons.edit,
                //     color: Colors.white,
                //   ),
                //   saveLabel: Icon(
                //     Icons.check,
                //     color: Colors.white,
                //   ),
                //   // textHint: provider.getChallenges()[widget.indexChallenge].listeDeTache[int.tryParse(widget.item.index)].formation.chapitre,
                //   textHint: widget.item.nom,
                //   onEditTap: () {},
                //   onSaveTap: (text) {
                //     print('value is: $text');
                //     provider.changeTitre(
                //         indexGestion: widget.indexGestion, nom: text);
                //   },
                // ),
                SizedBox(
                  height: 15.0,
                ),
                Center(child: Text("Icone de description")),
                Icon(icones, size: 50.0, color: Colors.red),
                Accordion(
                  maxOpenSections: 1,
                  leftIcon: Icon(Icons.description, color: Colors.white),
                  children: [
                    AccordionSection(
                      isOpen: false,
                      header: Text("Choisir une icone",
                          style: TextStyle(color: Colors.white, fontSize: 17)),
                      content: gridIcon(
                        provider,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
