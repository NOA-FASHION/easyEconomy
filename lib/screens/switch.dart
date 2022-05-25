import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:easyeconomy/models/easy_economy_models.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class SwitchEdit extends StatefulWidget {
  SwitchEdit();

  @override
  State<SwitchEdit> createState() => _SwitchEditState();
}

class _SwitchEditState extends State<SwitchEdit> {
  late bool isSwitched1;
  boolTransform(String switchBool) {
    bool isSwitched;
    if (switchBool == 'true' || switchBool == '') {
      isSwitched = true;
    } else {
      isSwitched = false;
    }
    isSwitched1 = isSwitched;
  }

  @override
  Widget build(BuildContext context) {
    EasyController variable = Provider.of<EasyController>(context);
    ActivSwitch? challengeYestaday = variable.getChallengeyesterday();
    String? switchBool = challengeYestaday.switchIintro;
    boolTransform(switchBool!);
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white70),
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.blueAccent, Colors.orange])),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Switch(
                value: isSwitched1,
                onChanged: (value) {
                  setState(() {
                    isSwitched1 = value;
                    variable.switchIntro(switchBool);
                  });
                },
                activeTrackColor: Colors.yellow,
                activeColor: Colors.orangeAccent,
              ),
              Text(
                "Introduction ",
                style: TextStyle(fontSize: 10),
              ),
              // Text(
              //   "au démarage ",
              //   style: TextStyle(fontSize: 10),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
