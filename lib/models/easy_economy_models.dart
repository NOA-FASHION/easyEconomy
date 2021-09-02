class RevenuFixe {
  String nom;
  double montant;

  RevenuFixe({
    required this.nom,
    required this.montant,
  });

  RevenuFixe.fromJSON(Map<String, dynamic> json)
      : nom = json['nom'],
        montant = json['montant'];

  Map<String, dynamic> toJson() {
    return {
      "nom": nom,
      "montant": montant,
    };
  }
}

class ChargeFixe {
  String nom;
  double montant;

  ChargeFixe({
    required this.nom,
    required this.montant,
  });

  ChargeFixe.fromJSON(Map<String, dynamic> json)
      : nom = json['nom'],
        montant = json['montant'];

  Map<String, dynamic> toJson() {
    return {
      "nom": nom,
      "montant": montant,
    };
  }
}

class DepensePrev {
  String nom;
  double montant;

  DepensePrev({
    required this.nom,
    required this.montant,
  });

  DepensePrev.fromJSON(Map<String, dynamic> json)
      : nom = json['nom'],
        montant = json['montant'];

  Map<String, dynamic> toJson() {
    return {
      "nom": nom,
      "montant": montant,
    };
  }
}

class DepenseImprevu {
  String nom;
  double montant;

  DepenseImprevu({
    required this.nom,
    required this.montant,
  });

  DepenseImprevu.fromJSON(Map<String, dynamic> json)
      : nom = json['nom'],
        montant = json['montant'];

  Map<String, dynamic> toJson() {
    return {
      "nom": nom,
      "montant": montant,
    };
  }
}

class GestionMensuel {
  String nom;
  DateTime mois;
  String tendance;
  List<RevenuFixe> revenuFixe;
  List<ChargeFixe> chargeFixe;
  List<DepensePrev> depensePrev;
  List<DepenseImprevu> depenseImprevu;

  GestionMensuel({
    required this.nom,
    required this.mois,
    required this.tendance,
    required this.revenuFixe,
    required this.chargeFixe,
    required this.depensePrev,
    required this.depenseImprevu,
  });

  factory GestionMensuel.fromJSON(Map<String, dynamic> json) => GestionMensuel(
        nom: json['nom'],
        mois: json['mois'],
        tendance: json['tendance'],
        revenuFixe: List<RevenuFixe>.from(
            json["revenuFixe"].map((x) => RevenuFixe.fromJSON(x)).toList()),
        chargeFixe: List<ChargeFixe>.from(
            json["chargeFixe"].map((x) => ChargeFixe.fromJSON(x)).toList()),
        depensePrev: List<DepensePrev>.from(
            json["depensePrev"].map((x) => DepensePrev.fromJSON(x)).toList()),
        depenseImprevu: List<DepenseImprevu>.from(json["depenseImprevu"]
            .map((x) => DepenseImprevu.fromJSON(x))
            .toList()),
      );

  Map<String, dynamic> toJson() {
    return {
      "nom": nom,
      "mois": mois,
      "tendance": tendance,
      "revenuFixe": List<dynamic>.from(revenuFixe.map((x) => x.toJson())),
      "chargeFixe": List<dynamic>.from(chargeFixe.map((x) => x.toJson())),
      "depensePrev": List<dynamic>.from(depensePrev.map((x) => x.toJson())),
      "depenseImprevu":
          List<dynamic>.from(depenseImprevu.map((x) => x.toJson()))
    };
  }
}
