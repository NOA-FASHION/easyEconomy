enum unity_Montant_universelle {
  DepensePrevu,
  RevenuFixe,
  ChargeFixe,
  DepenseImprevu,
}
// class RevenuFixe {
//   String nom;
//   double montant;

//   RevenuFixe({
//     required this.nom,
//     required this.montant,
//   });

//   RevenuFixe.fromJSON(Map<String, dynamic> json)
//       : nom = json['nom'],
//         montant = json['montant'];

//   Map<String, dynamic> toJson() {
//     return {
//       "nom": nom,
//       "montant": montant,
//     };
//   }
// }

// class ChargeFixe {
//   String nom;
//   double montant;

//   ChargeFixe({
//     required this.nom,
//     required this.montant,
//   });

//   ChargeFixe.fromJSON(Map<String, dynamic> json)
//       : nom = json['nom'],
//         montant = json['montant'];

//   Map<String, dynamic> toJson() {
//     return {
//       "nom": nom,
//       "montant": montant,
//     };
//   }
// }
choixDesciptionEnum1(dynamic json) {
  unity_Montant_universelle unity = unity_Montant_universelle.DepensePrevu;
  if (json['unity'] == "unity_Montant_universelle.DepensePrevu") {
    unity = unity_Montant_universelle.DepensePrevu;
  } else if (json['unity'] == "unity_Montant_universelle.RevenuFixe") {
    unity = unity_Montant_universelle.RevenuFixe;
  } else if (json['unity'] == "unity_Montant_universelle.ChargeFixe") {
    unity = unity_Montant_universelle.ChargeFixe;
  } else if (json['unity'] == "unity_Montant_universelle.DepenseImprevu") {
    unity = unity_Montant_universelle.DepenseImprevu;
  }
  return unity;
}

class MontantUniverselle {
  String id;
  String nom;
  double montant;
  unity_Montant_universelle unity;

  MontantUniverselle(
      {required this.id,
      required this.nom,
      required this.montant,
      required this.unity});

  MontantUniverselle.fromJSON(Map<String, dynamic> json)
      : id = json['id'],
        nom = json['nom'],
        montant = json['montant'],
        unity = choixDesciptionEnum1(json);

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nom": nom,
      "montant": montant,
      "unity": unity.toString(),
    };
  }
}

// class DepensePrev {
//   String nom;
//   double montant;

//   DepensePrev({
//     required this.nom,
//     required this.montant,
//   });

//   DepensePrev.fromJSON(Map<String, dynamic> json)
//       : nom = json['nom'],
//         montant = json['montant'];

//   Map<String, dynamic> toJson() {
//     return {
//       "nom": nom,
//       "montant": montant,
//     };
//   }
// }

// class DepenseImprevu {
//   String nom;
//   double montant;

//   DepenseImprevu({
//     required this.nom,
//     required this.montant,
//   });

//   DepenseImprevu.fromJSON(Map<String, dynamic> json)
//       : nom = json['nom'],
//         montant = json['montant'];

//   Map<String, dynamic> toJson() {
//     return {
//       "nom": nom,
//       "montant": montant,
//     };
//   }
// }

class GestionMensuel {
  String idGestion;
  String nom;
  DateTime mois;
  String tendance;
  List<MontantUniverselle> montantUniverselle;

  GestionMensuel({
    required this.idGestion,
    required this.nom,
    required this.mois,
    required this.tendance,
    required this.montantUniverselle,
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
      );

  Map<String, dynamic> toJson() {
    return {
      "idGestion": idGestion,
      "nom": nom,
      "mois": mois,
      "tendance": tendance,
      "montantUniverselle":
          List<dynamic>.from(montantUniverselle.map((x) => x.toJson())),
    };
  }
}
