import 'package:easyeconomy/models/easy_economy_models.dart';

class CalculMontant {
  double montantTotals(List<MontantUniverselle> listMontantUniverselle,
      List<MontantUniverselle> listMontantPrevision, bool simuOuchargeFixe) {
    double montant = 0;
    if (!simuOuchargeFixe) {
      for (var i = listMontantUniverselle.length - 1; i >= 0; i--) {
        if (listMontantUniverselle[i].unity.toString() ==
            'unity_Montant_universelle.ChargeFixe') {
          montant = montant - listMontantUniverselle[i].montant;
        } else if (listMontantUniverselle[i].unity.toString() ==
            'unity_Montant_universelle.RevenuFixe') {
          montant = montant + listMontantUniverselle[i].montant;
        }
      }
    } else if (simuOuchargeFixe) {
      for (var i = listMontantPrevision.length - 1; i >= 0; i--) {
        if (listMontantPrevision[i].unity.toString() ==
                'unity_Montant_universelle.ChargeFixe' ||
            listMontantPrevision[i].unity.toString() ==
                'unity_Montant_universelle.depensePonctuelle') {
          montant = montant - listMontantPrevision[i].montant;
        } else if (listMontantPrevision[i].unity.toString() ==
                'unity_Montant_universelle.RevenuFixe' ||
            listMontantPrevision[i].unity.toString() ==
                'unity_Montant_universelle.RevenuPonctuel') {
          montant = montant + listMontantPrevision[i].montant;
        }
      }
    }

    return montant;
  }

  double montantCharges(List<MontantUniverselle> listMontantUniverselle,
      List<MontantUniverselle> listMontantPrevision, bool simuOuchargeFixe) {
    double montants = 0;
    if (!simuOuchargeFixe) {
      for (var i = listMontantUniverselle.length - 1; i >= 0; i--) {
        print(listMontantUniverselle[i].unity.toString());
        if (listMontantUniverselle[i].unity.toString() ==
            'unity_Montant_universelle.ChargeFixe') {
          montants = montants + listMontantUniverselle[i].montant;
        }
      }
    } else if (simuOuchargeFixe) {
      for (var i = listMontantPrevision.length - 1; i >= 0; i--) {
        print(listMontantPrevision[i].unity.toString());
        if (listMontantPrevision[i].unity.toString() ==
                'unity_Montant_universelle.ChargeFixe' ||
            listMontantPrevision[i].unity.toString() ==
                'unity_Montant_universelle.depensePonctuelle') {
          montants = montants + listMontantPrevision[i].montant;
        }
      }
    }

    return montants;
  }

  double montantRevenu(List<MontantUniverselle> listMontantUniverselle,
      List<MontantUniverselle> listMontantPrevision, bool simuOuchargeFixe) {
    double montants = 0;
    if (!simuOuchargeFixe) {
      for (var i = listMontantUniverselle.length - 1; i >= 0; i--) {
        if (listMontantUniverselle[i].unity.toString() ==
            'unity_Montant_universelle.RevenuFixe') {
          montants = montants + listMontantUniverselle[i].montant;
        }
      }
    } else if (simuOuchargeFixe) {
      for (var i = listMontantPrevision.length - 1; i >= 0; i--) {
        if (listMontantPrevision[i].unity.toString() ==
                'unity_Montant_universelle.RevenuFixe' ||
            listMontantPrevision[i].unity.toString() ==
                'unity_Montant_universelle.RevenuPonctuel') {
          montants = montants + listMontantPrevision[i].montant;
        }
      }
    }
    return montants;
  }
}
