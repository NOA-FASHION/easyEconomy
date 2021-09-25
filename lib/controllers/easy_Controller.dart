import 'dart:convert';

import 'package:easyeconomy/models/easy_economy_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String keyAcces = "gestionMensuel";
const String keyAccesMontantUniverselle = "montantUniverselle";
List<GestionMensuel> _listGestionMensuel = [];
List<MontantUniverselle> _listMontantUniverselle = [];

class EasyController extends ChangeNotifier {
  late SharedPreferences _localData;
  late SharedPreferences _localDataMontaUniverselle;
  EasyController() {
    _initEconomy();
  }

  void _initEconomy() async {
    _localData = await SharedPreferences.getInstance();
    _localDataMontaUniverselle = await SharedPreferences.getInstance();

    List<Map<String, dynamic>> _jsonDecodeList;
    final List<String>? _tempList = _localData.getStringList(keyAcces);
    if (_tempList != null) {
      _jsonDecodeList = _tempList
          .map((challengeEncoded) => jsonDecode(challengeEncoded))
          .toList()
          .cast<Map<String, dynamic>>();

      _listGestionMensuel = _jsonDecodeList
          .map((challenge) => GestionMensuel.fromJSON(challenge))
          .toList();
    }
    List<Map<String, dynamic>> _jsonDecodeListMontantUniverselle;
    final List<String>? _tempListMontantuniverselle =
        _localDataMontaUniverselle.getStringList(keyAccesMontantUniverselle);
    if (_tempListMontantuniverselle != null) {
      _jsonDecodeListMontantUniverselle = _tempListMontantuniverselle
          .map((montantUniverselle) => jsonDecode(montantUniverselle))
          .toList()
          .cast<Map<String, dynamic>>();

      _listMontantUniverselle = _jsonDecodeListMontantUniverselle
          .map((challenge) => MontantUniverselle.fromJSON(challenge))
          .toList();
    }

    notifyListeners();
  }

  List<GestionMensuel> getGestionMensuel() {
    return _listGestionMensuel;
  }

  List<MontantUniverselle> getMontantUniverselle() {
    return _listMontantUniverselle;
  }

  List<MontantUniverselle> getMontantUnivrselle(String gestionId) {
    List<MontantUniverselle> montanUniverselle = [];
    for (var i = _listGestionMensuel.length - 1; i >= 0; i--) {
      if (_listGestionMensuel[i].idGestion == gestionId) {
        montanUniverselle = _listGestionMensuel[i].montantUniverselle;
      }
    }

    return montanUniverselle;
  }

  void removeMontantUniverselle({
    required int index,
  }) async {
    // await removeChallengelistId(index);
    _listMontantUniverselle.removeAt(index);
    await _saveMontantUniverselle(remove: true);
    _initEconomy();
    notifyListeners();
  }

  Future<bool> _saveMontantUniverselle({bool? remove}) async {
    if (_listMontantUniverselle.length < 1 && remove!) {
      return _localData.setStringList(keyAcces, []);
    }
    if (_listMontantUniverselle.isNotEmpty) {
      List<String> _jsonList = _listMontantUniverselle.map((challenge) {
        return jsonEncode(challenge.toJson());
      }).toList();
      return _localData.setStringList(keyAccesMontantUniverselle, _jsonList);
    }

    return false;
  }

  unity_Montant_universelle choixDesciptionEnum1(dynamic json) {
    unity_Montant_universelle unity = unity_Montant_universelle.ChargeFixe;
    ;
    if (json == "haute") {
      unity = unity_Montant_universelle.ChargeFixe;
      return unity;
    } else if (json == "normal") {
      unity = unity_Montant_universelle.DepenseImprevu;
      return unity;
    } else if (json == "quotidien") {
      unity = unity_Montant_universelle.DepensePrevu;
      return unity;
    } else if (json == "hebdomadaire") {
      unity = unity_Montant_universelle.RevenuFixe;
      return unity;
    }
    return unity;
  }

  void addMontanUniverselle({
    required String nom,
    required double montant,
    required String id,
    required String unity,
  }) async {
    _listMontantUniverselle.add(
      MontantUniverselle(
          unity: choixDesciptionEnum1(unity),
          id: id,
          montant: montant,
          nom: nom),
    );

    await _saveMontantUniverselle();
    _initEconomy();
    notifyListeners();
  }
}
