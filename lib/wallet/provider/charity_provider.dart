import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/wallet/data/models/charity_model.dart';
import 'package:flutter_ui_kit/wallet/data/repository/charity_repo.dart';

class CharityProvider extends ChangeNotifier {
  final CharityRepo charityRepo;
  CharityProvider({@required this.charityRepo});

  List<CharityModel> getCharityList() {
    return charityRepo.getCharityList();
  }
}