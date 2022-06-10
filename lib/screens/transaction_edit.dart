import 'package:accordion/accordion.dart';
import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:easyeconomy/models/easy_economy_models.dart';
import 'package:easyeconomy/screens/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionEdit extends StatefulWidget {
  final MontantUniverselle item;
  final int indexGestion;
  final int indexGestionMensuel;
  final int icon;
  final String typeMontantUniv;

  TransactionEdit(
      {Key? key,
      required this.indexGestion,
      required this.indexGestionMensuel,
      required this.typeMontantUniv,
      required this.item,
      required this.icon})
      : super(key: key);

  @override
  _TransactionEditState createState() => _TransactionEditState();
}

class _TransactionEditState extends State<TransactionEdit> {
  void selectedIcon(int index) {
    {
      iconData = GlobalConstant.icons[index];
      icon1 = GlobalConstant.icons[index];
    }
    ;
  }

  late IconData icones = Icons.info;
  late int icon1 = 57403;
  int iconData = 57403;

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
                    itemCount: GlobalConstant.icons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.7,
                        crossAxisCount: 5,
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
                                iconData = GlobalConstant.icons[index];
                                icon1 = GlobalConstant.icons[index];
                                if (widget.typeMontantUniv == "simulator") {
                                  provider.changeIconsSimulation(
                                      indexGestion: widget.indexGestion,
                                      icons: GlobalConstant.icons[index]);
                                } else if (widget.typeMontantUniv ==
                                    "chargeFixe") {
                                  provider.changeIcons(
                                      indexGestion: widget.indexGestion,
                                      icons: GlobalConstant.icons[index]);
                                } else {
                                  provider.changeIconsGestionMensuel(
                                      indexGestion: widget.indexGestion,
                                      icons: GlobalConstant.icons[index],
                                      indexGestionMensuel:
                                          widget.indexGestionMensuel);
                                }
                              },
                              icon: Icon(
                                IconData(GlobalConstant.icons[index],
                                    fontFamily: 'MaterialIcons'),
                                size: 20,
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
    icon1 = widget.icon;
    final EasyController provider = Provider.of<EasyController>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            height: 15.0,
          ),
          Center(child: Text("Icone de description")),
          Icon(IconData(icon1, fontFamily: 'MaterialIcons'),
              size: 50.0, color: Colors.red),
          Accordion(
            maxOpenSections: 1,
            leftIcon: Icon(Icons.description, color: Colors.white),
            children: [
              AccordionSection(
                  isOpen: false,
                  header: Text("Choisir une icone",
                      style: TextStyle(color: Colors.white, fontSize: 17)),
                  content: GridIconWidegtEdit(
                    indexGestion: widget.indexGestion,
                    indexGestionMensuel: widget.indexGestionMensuel,
                    onPressed: selectedIcon,
                    provider: provider,
                    typeMontantUniv: widget.typeMontantUniv,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class GridIconWidegtEdit extends StatelessWidget {
  final EasyController provider;

  final int indexGestion;
  final int indexGestionMensuel;
  final void Function(int index) onPressed;
  final String typeMontantUniv;

  const GridIconWidegtEdit(
      {Key? key,
      required this.indexGestion,
      required this.indexGestionMensuel,
      required this.typeMontantUniv,
      required this.provider,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        childAspectRatio: 0.7,
                        crossAxisCount: 5,
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
                                onPressed(index);
                                if (typeMontantUniv == "simulator") {
                                  provider.changeIconsSimulation(
                                      indexGestion: indexGestion,
                                      icons: GlobalConstant.icons[index]);
                                } else if (typeMontantUniv == "chargeFixe") {
                                  provider.changeIcons(
                                      indexGestion: indexGestion,
                                      icons: GlobalConstant.icons[index]);
                                } else {
                                  provider.changeIconsGestionMensuel(
                                      indexGestion: indexGestion,
                                      icons: GlobalConstant.icons[index],
                                      indexGestionMensuel: indexGestionMensuel);
                                }
                              },
                              icon: Icon(
                                IconData(GlobalConstant.icons[index],
                                    fontFamily: 'MaterialIcons'),
                                size: 20,
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
}
