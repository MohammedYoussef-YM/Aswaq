import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/seller_model.dart';
import 'package:flutter_ui_kit/sixvalley/data/repository/seller_repo.dart';

class SixSellerProvider extends ChangeNotifier {
  final SixSellerRepo sellerRepo;
  SixSellerProvider({@required this.sellerRepo});

  List<SellerModel> _sellerList;
  List<SellerModel> _sellerAllList;
  List<SellerModel> _orderSellerList = [];
  SellerModel _sellerModel;
  bool _isSearching = false;

  List<SellerModel> get sellerList => _sellerList;
  List<SellerModel> get orderSellerList => _orderSellerList;
  SellerModel get sellerModel => _sellerModel;
  bool get isSearching => _isSearching;

  void initSeller(String sellerId) async {
    _sellerList = [];
    _sellerAllList = [];
    _sellerList.add(sellerRepo.getSeller());
    _sellerAllList.add(sellerRepo.getSeller());
    _orderSellerList.add(sellerRepo.getSeller());
    _sellerModel = sellerRepo.getSeller();
    notifyListeners();
  }

  void toggleSearch() {
    _isSearching = !_isSearching;
    notifyListeners();
  }

  void filterList(String query) {
    _sellerList.clear();
    if(query.isNotEmpty) {
      _sellerAllList.forEach((seller) {
        if ((seller.fName + ' ' + seller.lName).toLowerCase().contains(query.toLowerCase())) {
          _sellerList.add(seller);
        }
      });
    }else {
      _sellerList.addAll(_sellerAllList);
    }
    notifyListeners();
  }

  void removePrevOrderSeller() {
    _orderSellerList = [];
    notifyListeners();
  }
}
