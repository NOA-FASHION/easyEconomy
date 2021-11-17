import 'package:advance_text_field/advance_text_field.dart';
import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:easyeconomy/models/easy_economy_models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class FormationEdit extends StatefulWidget {
  final MontantUniverselle item;
  final int indexGestion;

  FormationEdit({Key? key, required this.indexGestion, required this.item})
      : super(key: key);

  @override
  _FormationEditState createState() => _FormationEditState();
}

class _FormationEditState extends State<FormationEdit> {
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
                AdvanceTextField(
                  type: AdvanceTextFieldType.EDIT,
                  editLabel: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  saveLabel: Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                  textHint: widget.item.montant.toString(),
                  onEditTap: () {},
                  onSaveTap: (text) {
                    print('value is: $text');
                    provider.addformationPrix(
                        indexGestion: widget.indexGestion, montant: text);
                  },
                ),
                AdvanceTextField(
                  type: AdvanceTextFieldType.EDIT,
                  editLabel: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  saveLabel: Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                  // textHint: provider.getChallenges()[widget.indexChallenge].listeDeTache[int.tryParse(widget.item.index)].formation.chapitre,
                  textHint: widget.item.nom,
                  onEditTap: () {},
                  onSaveTap: (text) {
                    print('value is: $text');
                    provider.addformationTitre(
                        indexGestion: widget.indexGestion, nom: text);
                  },
                ),
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
                //   textHint: widget.item.formation.theoriePratique,
                //   onEditTap: () {},
                //   onSaveTap: (text) {
                //     provider.addformationTheoriePratique(
                //         indexChallenge: widget.indexChallenge,
                //         index: int.parse(widget.item.index),
                //         theoriePratique: text);
                //     print('value is: $text');
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
