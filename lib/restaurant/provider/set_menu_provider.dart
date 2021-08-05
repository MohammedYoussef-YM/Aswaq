import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/base/api_response.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/product_model.dart';
import 'package:flutter_ui_kit/restaurant/data/repository/set_menu_repo.dart';

class RestSetMenuProvider extends ChangeNotifier {
  final RestSetMenuRepo setMenuRepo;
  RestSetMenuProvider({@required this.setMenuRepo});

  List<Product> _setMenuList;
  List<Product> get setMenuList => _setMenuList;

  void getSetMenuList(BuildContext context) async {
    ApiResponse apiResponse = await setMenuRepo.getSetMenuList();
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      _setMenuList = [];
      apiResponse.response.data.forEach((setMenu) => _setMenuList.add(setMenu));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(apiResponse.error.toString())));
    }
    notifyListeners();
  }
}