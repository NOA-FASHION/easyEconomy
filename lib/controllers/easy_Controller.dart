import 'dart:convert';

import 'package:easyeconomy/models/easy_economy_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:nanoid/nanoid.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

const String keyAcces = "gestionMensuel";
const String keyAccesMontantUniverselle = "montantUniverselle";
const String keyAccesEconomyDays = "EconomyDays";
const String keyAccesMontantPrevision = "montantPrevision";
List<GestionMensuel> _listGestionMensuel = [];
List<MontantUniverselle> _listMontantUniverselle = [];
List<MontantUniverselle> _listMontantPrevision = [];
late EconomyDays economyDays = EconomyDays(date: '');

class EasyController extends ChangeNotifier {
  late double soldePrevisionel;
  late DateTime today = new DateTime.now();
  late SharedPreferences _localData;
  late SharedPreferences _localDataMontaUniverselle;
  late SharedPreferences _localDataEcononyDays;
  late SharedPreferences _localDataMontantPrevision;

  EasyController() {
    _initEconomy();
  }

  void _initEconomy() async {
    _localData = await SharedPreferences.getInstance();
    _localDataMontaUniverselle = await SharedPreferences.getInstance();
    _localDataMontantPrevision = await SharedPreferences.getInstance();
    _localDataEcononyDays = await SharedPreferences.getInstance();

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
    List<Map<String, dynamic>> _jsonDecodeListMontantPrevision;
    final List<String>? _tempListMontantPrevision =
        _localDataMontantPrevision.getStringList(keyAccesMontantPrevision);
    if (_tempListMontantPrevision != null) {
      _jsonDecodeListMontantPrevision = _tempListMontantPrevision
          .map((montantPrevision) => jsonDecode(montantPrevision))
          .toList()
          .cast<Map<String, dynamic>>();

      _listMontantPrevision = _jsonDecodeListMontantPrevision
          .map((challenge) => MontantUniverselle.fromJSON(challenge))
          .toList();
    }
    _initEconomyDays();
    // starteconomyDays();
    notifyListeners();
  }

  List<GestionMensuel> getGestionMensuel() {
    return _listGestionMensuel;
  }

  List<MontantUniverselle> getGestionMensuelAchat(int indexGestionMensuel) {
    return _listGestionMensuel[indexGestionMensuel].montantUniverselle;
  }

  List<MontantUniverselle> getGestionMensuelMontantUnivLive(
      int indexGestionMensuel) {
    return _listGestionMensuel[indexGestionMensuel].montantUniverselleLive;
  }

  List<DesciprtionUniverselle> getGestionMensuelDescription(
      int indexGestionMensuel, int indexGestionMensuelMontantUniv) {
    return _listGestionMensuel[indexGestionMensuel]
        .montantUniverselle[indexGestionMensuelMontantUniv]
        .descriptionUniverselle;
  }

  List<MontantUniverselle> getMontantUniverselle() {
    return _listMontantUniverselle;
  }

  List<MontantUniverselle> getMontantPrevision() {
    return _listMontantPrevision;
  }

  List<MontantUniverselle> getGestionMontantUniverselle(String gestionId) {
    List<MontantUniverselle> montanUniverselle = [];
    for (var i = _listGestionMensuel.length - 1; i >= 0; i--) {
      if (_listGestionMensuel[i].idGestion == gestionId) {
        montanUniverselle = _listGestionMensuel[i].montantUniverselle;
      }
    }

    return montanUniverselle;
  }

  List<MontantUniverselle> getGestionMontantUniverselleLive(String gestionId) {
    List<MontantUniverselle> montanUniverselle = [];
    for (var i = _listGestionMensuel.length - 1; i >= 0; i--) {
      if (_listGestionMensuel[i].idGestion == gestionId) {
        montanUniverselle = _listGestionMensuel[i].montantUniverselleLive;
      }
    }

    return montanUniverselle;
  }

  void removeMontantUniverselle({
    required int index,
  }) async {
    // removeMontantPrevision(index: idmontantUniverselle(index));
    _listMontantUniverselle.removeAt(index);
    await _saveMontantUniverselle(remove: true);
    _initEconomy();
    notifyListeners();
  }

  void resetListMontantPrevision() async {
    _listMontantPrevision = [];
    for (var i = _listMontantUniverselle.length - 1; i >= 0; i--) {
      _listMontantPrevision.add(
        MontantUniverselle(
            unity: _listMontantUniverselle[i].unity,
            id: _listMontantUniverselle[i].id,
            montant: _listMontantUniverselle[i].montant,
            nom: _listMontantUniverselle[i].nom,
            descriptionUniverselle:
                _listMontantUniverselle[i].descriptionUniverselle,
            achatTotal: 0,
            previsionsTotal: 0),
      );
    }
    await _saveMontantPrevision(remove: true);
    _initEconomy();
    notifyListeners();
  }

  Future<bool> _saveMontantUniverselle({bool? remove}) async {
    if (_listMontantUniverselle.length < 1 && remove!) {
      return _localDataMontaUniverselle
          .setStringList(keyAccesMontantUniverselle, []);
    }
    if (_listMontantUniverselle.isNotEmpty) {
      List<String> _jsonList = _listMontantUniverselle.map((challenge) {
        return jsonEncode(challenge.toJson());
      }).toList();
      return _localDataMontaUniverselle.setStringList(
          keyAccesMontantUniverselle, _jsonList);
    }

    return false;
  }

  int idmontantUniverselle(int index) {
    int index2 = 0;
    for (var i = _listMontantPrevision.length - 1; i >= 0; i--) {
      if (_listMontantUniverselle[index].id == _listMontantPrevision[i].id) {
        index2 = i;
      }
    }
    return index2;
  }

  void removeMontantPrevision({
    required int index,
  }) async {
    // await removeChallengelistId(index);
    _listMontantPrevision.removeAt(index);
    await _saveMontantPrevision(remove: true);
    _initEconomy();
    notifyListeners();
  }

  Future<bool> _saveMontantPrevision({bool? remove}) async {
    if (_listMontantPrevision.length < 1 && remove!) {
      return _localDataMontantPrevision
          .setStringList(keyAccesMontantPrevision, []);
    }
    if (_listMontantPrevision.isNotEmpty) {
      List<String> _jsonList = _listMontantPrevision.map((challenge) {
        return jsonEncode(challenge.toJson());
      }).toList();
      return _localDataMontantPrevision.setStringList(
          keyAccesMontantPrevision, _jsonList);
    }

    return false;
  }

  unity_Montant_universelle choixDesciptionEnum1(dynamic json) {
    unity_Montant_universelle unity = unity_Montant_universelle.ChargeFixe;

    if (json == "ChargeFixe") {
      unity = unity_Montant_universelle.ChargeFixe;
      return unity;
    } else if (json == "RevenuFixe") {
      unity = unity_Montant_universelle.RevenuFixe;
      return unity;
    } else if (json == "depensePonctuelle") {
      unity = unity_Montant_universelle.depensePonctuelle;
      return unity;
    } else if (json == "RevenuPonctuel") {
      unity = unity_Montant_universelle.RevenuPonctuel;
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
          nom: nom,
          descriptionUniverselle: [],
          achatTotal: 0,
          previsionsTotal: 0),
    );
    addMontantPrevision(id: id, montant: montant, nom: nom, unity: unity);
    addMontantGestion(id: id, montant: montant, nom: nom, unity: unity);

    await _saveMontantUniverselle();
    _initEconomy();
    notifyListeners();
  }

  void addMontantGestion({
    required String nom,
    required double montant,
    required String id,
    required String unity,
  }) async {
    DateTime today = new DateTime.now();
    for (var i = _listGestionMensuel.length - 1; i >= 0; i--) {
      if (_listGestionMensuel[i].mois == DateFormat('MMM').format(today)) {
        _listGestionMensuel[i].montantUniverselle
          ..add(
            MontantUniverselle(
                unity: choixDesciptionEnum1(unity),
                id: id,
                montant: montant,
                nom: nom,
                descriptionUniverselle: [],
                achatTotal: 0,
                previsionsTotal: 0),
          );
        await _saveGestionMensuelle();
        _initEconomyDays();
        notifyListeners();
        return;
      }
    }
  }

  void addMontantPrevision({
    required String nom,
    required double montant,
    required String id,
    required String unity,
  }) async {
    _listMontantPrevision.add(
      MontantUniverselle(
          unity: choixDesciptionEnum1(unity),
          id: id,
          montant: montant,
          nom: nom,
          descriptionUniverselle: [],
          achatTotal: 0,
          previsionsTotal: 0),
    );

    await _saveMontantPrevision();
    _initEconomy();
    notifyListeners();
  }

  void starteconomyDays() async {
    print('economydays:' + economyDays.date);
    DateTime today = new DateTime.now();
    String todays = DateFormat('MMM').format(today);
    if (economyDays.date.isEmpty || economyDays.date != todays) {
      print('create gestionMensuel');
      economyDays.date = todays;
      _listGestionMensuel.add(
        GestionMensuel(
            idGestion: nanoid(10),
            mois: DateFormat('MMM').format(today),
            montantUniverselle: _ListGestionMensuelPrevision(),
            nom: 'Mois en cours',
            tendance: '',
            montantUniverselleLive: []),
      );

      await _saveGestionMensuelle();
      await _saveEconomyDays();
      // _initEconomyDays();
      // notifyListeners();
    }
    // creatListGestionMensuel();
  }

  Future<bool> _saveEconomyDays() async {
    if (economyDays.date.isNotEmpty) {
      print("enregistrement ok");
      Map mapday = economyDays.toJson();
      String _jsonDay = jsonEncode(mapday);
      return _localDataEcononyDays.setString(keyAccesEconomyDays, _jsonDay);
    }

    return false;
  }

  void _initEconomyDays() async {
    print('init econodays');
    _localDataEcononyDays = await SharedPreferences.getInstance();
    Map<String, dynamic> _jsonDecodeEconomyDays;
    final String? _tempListChallenge =
        _localDataEcononyDays.getString(keyAccesEconomyDays);

    if (_tempListChallenge != null) {
      print('economy:' + economyDays.date);
      _jsonDecodeEconomyDays = jsonDecode(_tempListChallenge);
      economyDays = EconomyDays.fromJSON(_jsonDecodeEconomyDays);
    }
    starteconomyDays();
  }

  void addGestionMensuelMontantUniv(
      {required String nom,
      required double montant,
      required String id,
      required String unity,
      required int index}) async {
    _listGestionMensuel[index].montantUniverselle.add(MontantUniverselle(
        unity: choixDesciptionEnum1(unity),
        id: id,
        montant: montant,
        nom: nom,
        descriptionUniverselle: [],
        achatTotal: 0,
        previsionsTotal: 0));
    await _saveGestionMensuelle();
    _initEconomyDays();
    notifyListeners();
  }

  List<MontantUniverselle> _ListGestionMensuelPrevision() {
    List<MontantUniverselle> listMontantPrevision1 = [];
    for (var i = _listMontantUniverselle.length - 1; i >= 0; i--) {
      listMontantPrevision1.add(
        MontantUniverselle(
            unity: _listMontantUniverselle[i].unity,
            id: _listMontantUniverselle[i].id,
            montant: _listMontantUniverselle[i].montant,
            nom: _listMontantUniverselle[i].nom,
            descriptionUniverselle:
                _listMontantUniverselle[i].descriptionUniverselle,
            achatTotal: 0,
            previsionsTotal: 0),
      );
    }
    return listMontantPrevision1;
  }

  void creatListGestionMensuel() async {
    DateTime today = new DateTime.now();
    String todays = DateFormat('MMM').format(today);
    if (economyDays.date != todays) {
      print('date != econonydays');
      economyDays.date = DateFormat('MMM').format(today);
      _listGestionMensuel.add(
        GestionMensuel(
            idGestion: nanoid(10),
            mois: DateFormat('MMM').format(today),
            montantUniverselle: _ListGestionMensuelPrevision(),
            nom: 'Mois en cours',
            tendance: '',
            montantUniverselleLive: []),
      );
      await _saveEconomyDays();
      await _saveGestionMensuelle();
      // _initEconomyDays();
      // notifyListeners();
    }
  }

  void removeGestionMensuelle({
    required int index,
  }) async {
    // await removeChallengelistId(index);
    _listGestionMensuel.removeAt(index);
    await _saveGestionMensuelle(remove: true);
    _initEconomy();
    notifyListeners();
  }

  void removeGestionMensuelleMontantUnivLive(
      {required bool validation,
      required int indexGestionMensuel,
      required int indexGestionMensMontanUniv,
      required String idGestionMensMontanUniv}) async {
    if (validation) {
      _listGestionMensuel[indexGestionMensuel].montantUniverselle.add(
            MontantUniverselle(
                unity: _listGestionMensuel[indexGestionMensuel]
                    .montantUniverselleLive[indexGestionMensMontanUniv]
                    .unity,
                id: _listGestionMensuel[indexGestionMensuel]
                    .montantUniverselleLive[indexGestionMensMontanUniv]
                    .id,
                montant: _listGestionMensuel[indexGestionMensuel]
                    .montantUniverselleLive[indexGestionMensMontanUniv]
                    .montant,
                nom: _listGestionMensuel[indexGestionMensuel]
                    .montantUniverselleLive[indexGestionMensMontanUniv]
                    .nom,
                descriptionUniverselle: _listGestionMensuel[indexGestionMensuel]
                    .montantUniverselleLive[indexGestionMensMontanUniv]
                    .descriptionUniverselle,
                achatTotal: _listGestionMensuel[indexGestionMensuel]
                    .montantUniverselleLive[indexGestionMensMontanUniv]
                    .achatTotal,
                previsionsTotal: _listGestionMensuel[indexGestionMensuel]
                    .montantUniverselleLive[indexGestionMensMontanUniv]
                    .previsionsTotal),
          );
    }

    _listGestionMensuel[indexGestionMensuel]
        .montantUniverselleLive
        .removeAt(indexGestionMensMontanUniv);

    await _saveGestionMensuelleMontantUniv(
        remove: true, idGestionMensMontanUniv: idGestionMensMontanUniv);
    _initEconomy();
    notifyListeners();
  }

  void removeGestionMensuelleMontantUniv(
      {required bool validation,
      required int indexGestionMensuel,
      required int indexGestionMensMontanUniv,
      required String idGestionMensMontanUniv}) async {
    if (validation) {
      _listGestionMensuel[indexGestionMensuel].montantUniverselleLive.add(
            MontantUniverselle(
                unity: _listGestionMensuel[indexGestionMensuel]
                    .montantUniverselle[indexGestionMensMontanUniv]
                    .unity,
                id: _listGestionMensuel[indexGestionMensuel]
                    .montantUniverselle[indexGestionMensMontanUniv]
                    .id,
                montant: _listGestionMensuel[indexGestionMensuel]
                    .montantUniverselle[indexGestionMensMontanUniv]
                    .montant,
                nom: _listGestionMensuel[indexGestionMensuel]
                    .montantUniverselle[indexGestionMensMontanUniv]
                    .nom,
                descriptionUniverselle: _listGestionMensuel[indexGestionMensuel]
                    .montantUniverselle[indexGestionMensMontanUniv]
                    .descriptionUniverselle,
                achatTotal: _listGestionMensuel[indexGestionMensuel]
                    .montantUniverselle[indexGestionMensMontanUniv]
                    .achatTotal,
                previsionsTotal: _listGestionMensuel[indexGestionMensuel]
                    .montantUniverselle[indexGestionMensMontanUniv]
                    .previsionsTotal),
          );
    }

    _listGestionMensuel[indexGestionMensuel]
        .montantUniverselle
        .removeAt(indexGestionMensMontanUniv);

    await _saveGestionMensuelleMontantUniv(
        remove: true, idGestionMensMontanUniv: idGestionMensMontanUniv);
    _initEconomy();
    notifyListeners();
  }

  Future<bool> _saveGestionMensuelleMontantUniv(
      {required bool remove, required String idGestionMensMontanUniv}) async {
    for (var i = _listGestionMensuel.length - 1; i >= 0; i--) {
      if (_listGestionMensuel[i].idGestion == idGestionMensMontanUniv) {
        if (_listGestionMensuel[i].montantUniverselle.length < 1 && remove) {
          _listGestionMensuel[i].montantUniverselle = [];
        }
        List<String> _jsonList = _listGestionMensuel.map((gestion) {
          return jsonEncode(gestion.toJson());
        }).toList();
        return _localData.setStringList(keyAcces, _jsonList);
      }
    }
    return false;
  }

  Future<bool> _saveGestionMensuelle({bool? remove}) async {
    if (_listGestionMensuel.length < 1 && remove!) {
      return _localData.setStringList(keyAcces, []);
    }
    if (_listGestionMensuel.isNotEmpty) {
      List<String> _jsonList = _listGestionMensuel.map((challenge) {
        return jsonEncode(challenge.toJson());
      }).toList();
      return _localData.setStringList(keyAcces, _jsonList);
    }

    return false;
  }
}
