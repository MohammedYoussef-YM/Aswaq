import 'package:flutter_ui_kit/dating_app/data/models/choice_model.dart';
import 'package:flutter_ui_kit/dating_app/utility/strings.dart';

class ChoiceRepo {
  List<ChoiceModel> getAllGender = [
    ChoiceModel(title: Strings.male),
    ChoiceModel(title: Strings.female),
    ChoiceModel(title: Strings.shemale),
    ChoiceModel(title: Strings.gay),
  ];

  List<ChoiceModel> getAllBodyColor = [
    ChoiceModel(title: Strings.brown),
    ChoiceModel(title: Strings.blond),
    ChoiceModel(title: Strings.black),
    ChoiceModel(title: Strings.mixed),
  ];
  List<ChoiceModel> getAllRegion = [
    ChoiceModel(title: Strings.african),
    ChoiceModel(title: Strings.maxican),
    ChoiceModel(title: Strings.american),
    ChoiceModel(title: Strings.british),
  ];
  List<ChoiceModel> getAllHeight = [
    ChoiceModel(title: Strings.short),
    ChoiceModel(title: Strings.tall),
    ChoiceModel(title: Strings.medium),
    ChoiceModel(title: Strings.others),
  ];
  List<ChoiceModel> getAllAge = [
    ChoiceModel(title: Strings.age_18_22),
    ChoiceModel(title: Strings.age_22_30),
    ChoiceModel(title: Strings.age_30_40),
    ChoiceModel(title: Strings.age_40_plus),
  ];
}
