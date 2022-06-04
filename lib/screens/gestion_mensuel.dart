import 'package:easyeconomy/screens/build_gestion_mensuel.dart';
import 'package:flutter/material.dart';

class GestionMensuel extends StatefulWidget {
  GestionMensuel({Key? key}) : super(key: key);

  @override
  _GestionMensuelState createState() => _GestionMensuelState();
}

class _GestionMensuelState extends State<GestionMensuel> {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        key: scaffoldkey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: SafeArea(
            child: AppBar(
              title: Text('Mois de gestion',
                  style: TextStyle(color: Colors.black, fontSize: 17)),
              centerTitle: true,
              flexibleSpace: Container(
                padding: EdgeInsets.only(top: 30.0),
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/logo1.png',
                  width: 70,
                  height: 90,
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[Colors.orange, Colors.blueAccent])),
              ),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.orange, Colors.blueAccent])),
          child: BuildGestionMensuel(),
        ),
      ),
    );
  }
}
