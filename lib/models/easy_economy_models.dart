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
  double achat;
  double previsions;
  double echeance;
  double nombreEcheance;
  String id;
  String adresseImage;
  String name;
  String commentaire;
  final unity_description description;
  DesciprtionUniverselle(
      {required this.achat,
      required this.echeance,
      required this.nombreEcheance,
      required this.previsions,
      required this.id,
      required this.name,
      required this.adresseImage,
      required this.description,
      required this.commentaire});

  DesciprtionUniverselle.fromJSON(Map<String, dynamic> json)
      : achat = json['achat'],
        echeance = json['echeance'],
        nombreEcheance = json['nombreEcheance'],
        previsions = json['previsions'],
        name = json['name'],
        id = json['id'],
        adresseImage = json['adresseImage'],
        commentaire = json['commentaire'],
        description = choixDesciptionEnum(json);

  Map<String, dynamic> toJson() {
    return {
      "achat": achat,
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
  double achatTotal;
  double previsionsTotal;
  String id;
  String nom;
  double montant;
  unity_Montant_universelle unity;
  List<DesciprtionUniverselle> descriptionUniverselle;

  MontantUniverselle(
      {required this.id,
      required this.nom,
      required this.montant,
      required this.achatTotal,
      required this.previsionsTotal,
      required this.descriptionUniverselle,
      required this.unity});
  factory MontantUniverselle.fromJSON(Map<String, dynamic> json) =>
      MontantUniverselle(
          id: json['id'],
          nom: json['nom'],
          montant: json['montant'],
          achatTotal: json['achatTotal'],
          previsionsTotal: json['previsionsTotal'],
          descriptionUniverselle: List<DesciprtionUniverselle>.from(
              json["descriptionUniverselle"]
                  .map((x) => DesciprtionUniverselle.fromJSON(x))
                  .toList()),
          unity: choixDesciptionEnum1(json));

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nom": nom,
      "achatTotal": achatTotal,
      "previsionsTotal": previsionsTotal,
      "montant": montant,
      "descriptionUniverselle":
          List<dynamic>.from(descriptionUniverselle.map((x) => x.toJson())),
      "unity": unity.toString(),
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
