

enum unity_Montant_universelle {
  depensePonctuelle,
  RevenuFixe,
  ChargeFixe,
  RevenuPonctuel,
}

enum unity_description {
  tache,
  commentaire,
  image,
  achat,
  echeancier,
  information
}

class EconomyDays {
  String date;

  EconomyDays({
    required this.date,
  });

  EconomyDays.fromJSON(Map<String, dynamic> json) : date = json['date'];

  Map<String, dynamic> toJson() {
    return {
      "date": date,
    };
  }
}

choixDesciptionEnum1(dynamic json) {
  unity_Montant_universelle unity = unity_Montant_universelle.depensePonctuelle;
  if (json['unity'] == "unity_Montant_universelle.depensePonctuelle") {
    unity = unity_Montant_universelle.depensePonctuelle;
  } else if (json['unity'] == "unity_Montant_universelle.RevenuFixe") {
    unity = unity_Montant_universelle.RevenuFixe;
  } else if (json['unity'] == "unity_Montant_universelle.ChargeFixe") {
    unity = unity_Montant_universelle.ChargeFixe;
  } else if (json['unity'] == "unity_Montant_universelle.RevenuPonctuel") {
    unity = unity_Montant_universelle.RevenuPonctuel;
  }
  return unity;
}

choixDesciptionEnum(dynamic json) {
  unity_description unity = unity_description.tache;
  if (json['description'] == "unity_description.tache") {
    unity = unity_description.tache;
  } else if (json['description'] == "unity_description.commentaire") {
    unity = unity_description.commentaire;
  } else if (json['description'] == "unity_description.image") {
    unity = unity_description.image;
  } else if (json['description'] == "unity_description.achat") {
    unity = unity_description.achat;
  } else if (json['description'] == "unity_description.echeancier") {
    unity = unity_description.echeancier;
  } else if (json['description'] == "unity_description.information") {
    unity = unity_description.information;
  }
  return unity;
}

class DesciprtionUniverselle {
  double previsions;
  double echeance;
  double nombreEcheance;
  String id;
  String adresseImage;
  String name;
  String commentaire;
  final unity_description description;
  DesciprtionUniverselle(
      {required this.echeance,
      required this.nombreEcheance,
      required this.previsions,
      required this.id,
      required this.name,
      required this.adresseImage,
      required this.description,
      required this.commentaire});

  factory DesciprtionUniverselle.fromJSON(Map<String, dynamic> json) =>
      DesciprtionUniverselle(
        echeance: json['echeance'],
        nombreEcheance: json['nombreEcheance'],
        previsions: json['previsions'],
        name: json['name'],
        id: json['id'],
        adresseImage: json['adresseImage'],
        commentaire: json['commentaire'],
        description: choixDesciptionEnum(json),
      );

  Map<String, dynamic> toJson() {
    return {
      "echeance": echeance,
      "nombreEcheance": nombreEcheance,
      "previsions": previsions,
      "name": name,
      "id": id,
      "adresseImage": adresseImage,
      "commentaire": commentaire,
      "description": description.toString()
    };
  }
}

class MontantUniverselle {
  int icones;
  List<double> achat;
  double previsionsTotal;
  String id;
  String nom;
  double montant;
  unity_Montant_universelle unity;
  List<DesciprtionUniverselle> descriptionUniverselle;

  MontantUniverselle(
      {required this.icones,
      required this.achat,
      required this.id,
      required this.nom,
      required this.montant,
      required this.previsionsTotal,
      required this.descriptionUniverselle,
      required this.unity});
  factory MontantUniverselle.fromJSON(Map<String, dynamic> json) =>
      MontantUniverselle(
          icones: json['icones'],
          id: json['id'],
          nom: json['nom'],
          montant: json['montant'],
          previsionsTotal: json['previsionsTotal'],
          descriptionUniverselle: List<DesciprtionUniverselle>.from(
              json["descriptionUniverselle"]
                  .map((x) => DesciprtionUniverselle.fromJSON(x))
                  .toList()),
          unity: choixDesciptionEnum1(json),
          achat: List<double>.from(json["achat"].map((x) => x)));

  Map<String, dynamic> toJson() {
    return {
      "achat": List<dynamic>.from(achat.map((x) => x)),
      "id": id,
      "icones": icones,
      "nom": nom,
      "previsionsTotal": previsionsTotal,
      "montant": montant,
      "descriptionUniverselle":
          List<dynamic>.from(descriptionUniverselle.map((x) => x.toJson())),
      "unity": unity.toString(),
    };
  }
}

class UploadMontantniversell {
  List<MontantUniverselle> montantUniverselle;

  UploadMontantniversell({
    required this.montantUniverselle,
  });

  factory UploadMontantniversell.fromJSON(Map<String, dynamic> json) =>
      UploadMontantniversell(
        montantUniverselle: List<MontantUniverselle>.from(
            json["montantUniverselle"]
                .map((x) => MontantUniverselle.fromJSON(x))
                .toList()),
      );

  Map<String, dynamic> toJson() {
    return {
      "montantUniverselle":
          List<dynamic>.from(montantUniverselle.map((x) => x.toJson())),
    };
  }
}

class GestionMensuel {
  String idGestion;
  String nom;
  String mois;
  String tendance;
  List<MontantUniverselle> montantUniverselle;
  List<MontantUniverselle> montantUniverselleLive;

  GestionMensuel({
    required this.idGestion,
    required this.nom,
    required this.mois,
    required this.tendance,
    required this.montantUniverselle,
    required this.montantUniverselleLive,
  });

  factory GestionMensuel.fromJSON(Map<String, dynamic> json) => GestionMensuel(
        idGestion: json['idGestion'],
        nom: json['nom'],
        mois: json['mois'],
        tendance: json['tendance'],
        montantUniverselle: List<MontantUniverselle>.from(
            json["montantUniverselle"]
                .map((x) => MontantUniverselle.fromJSON(x))
                .toList()),
        montantUniverselleLive: List<MontantUniverselle>.from(
            json["montantUniverselleLive"]
                .map((x) => MontantUniverselle.fromJSON(x))
                .toList()),
      );

  Map<String, dynamic> toJson() {
    return {
      "idGestion": idGestion,
      "nom": nom,
      "mois": mois,
      "tendance": tendance,
      "montantUniverselle":
          List<dynamic>.from(montantUniverselle.map((x) => x.toJson())),
      "montantUniverselleLive":
          List<dynamic>.from(montantUniverselleLive.map((x) => x.toJson())),
    };
  }
}

class ActivSwitch {
  String date;
  String? firstActive;
  String? nbTacheEnCours;
  String? switchIintro;
  String? active;
  String? nbtacheVallide;

  ActivSwitch(
      {required this.date,
      required this.firstActive,
      required this.switchIintro,
      required this.active,
      required this.nbTacheEnCours,
      required this.nbtacheVallide});

  ActivSwitch.fromJSON(Map<String, dynamic> json)
      : date = json['date'],
        firstActive = json['firstActive'],
        nbTacheEnCours = json['nbTacheEnCours'],
        active = json['active'],
        nbtacheVallide = json['nbtacheVallide'],
        switchIintro = json['switchIintro'];

  Map<String, dynamic> toJson() {
    return {
      "date": date,
      "active": active,
      "nbTacheEnCours": nbTacheEnCours,
      "nbtacheVallide": nbtacheVallide,
      "firstActive": firstActive,
      "switchIintro": switchIintro
    };
  }
}
