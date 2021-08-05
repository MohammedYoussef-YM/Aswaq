import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/wallet/data/models/promo_model.dart';
import 'package:flutter_ui_kit/wallet/data/repository/promo_repo.dart';

class PromoProvider extends ChangeNotifier {
  final PromoRepo promoRepo;
  PromoProvider({@required this.promoRepo});

  List<PromoModel> getPromoList() {
    return promoRepo.getPromoData();
  }
}