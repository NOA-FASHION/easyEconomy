import 'package:flutter/material.dart';

class ScreenIndicatorMontant extends StatelessWidget {
  final String titre;
  final IconData icones;

  const ScreenIndicatorMontant({required this.titre, required this.icones});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.2,
      height: 140,
      child: Card(
          color: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 25.0,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  icones,
                  size: 30,
                  color: Colors.white,
                ), // icon
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    titre,
                    style: TextStyle(fontSize: 13, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Card(
                  color: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 25.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "2000",
                      style: TextStyle(fontSize: 13, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ), // text
              ],
            ),
          )),
    );
  }
}
