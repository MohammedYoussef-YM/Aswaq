import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/language_model.dart';
import 'package:flutter_ui_kit/restaurant/utill/app_constants.dart';

class RestLanguageRepo {
  List<LanguageModel> getAllLanguages({BuildContext context}) {
    return RestAppConstants.languages;
  }
}
