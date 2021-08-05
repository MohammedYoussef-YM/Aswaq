import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/rideshare/data/model/creadit_cart_model.dart';
import 'package:flutter_ui_kit/rideshare/data/repository/wallet_repo.dart';

class WalletProvider with ChangeNotifier{
  final WalletRepo walletRepo;

  WalletProvider({@required this.walletRepo});

  List<CreditCartModel> _creditCards=[];
  List<CreditCartModel> get creditCards=>_creditCards;

  int _selectIndex=0;
  int get selectIndex=>_selectIndex;

  changeSelectIndex(int index){
    _selectIndex=index;
    notifyListeners();
  }

  initializeCreditCards(){
    if(_creditCards.length==0){
      _creditCards.clear();
      _creditCards=walletRepo.getAllCreditCartList;
      notifyListeners();
    }
  }
}