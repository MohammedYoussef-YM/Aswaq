import 'package:flutter_ui_kit/dating_app/data/models/dating_model.dart';
import 'package:flutter_ui_kit/dating_app/utility/dating_image.dart';
import 'package:flutter_ui_kit/dating_app/utility/strings.dart';

class DatingAppHomeRepo {
  List<DatingModel> getAllDatingData = [
    DatingModel(
        imageUrl: DatingImages.person_one,
        percentMatch: Strings.match_87,
        name: Strings.rozdario_22,
        subtitle: Strings.i_live_my_life_like___),
    DatingModel(
        imageUrl: DatingImages.person_two,
        percentMatch: Strings.match_95,
        name: Strings.timothy_24,
        subtitle: Strings.full_time_traveller_globe_trotter),
    DatingModel(
        imageUrl: DatingImages.person_three,
        percentMatch: Strings.match_87,
        name: Strings.rozdario_22,
        subtitle: Strings.i_live_my_life_like___),
    DatingModel(
        imageUrl: DatingImages.person_four,
        percentMatch: Strings.match_95,
        name: Strings.timothy_24,
        subtitle: Strings.full_time_traveller_globe_trotter),
    DatingModel(
        imageUrl:DatingImages.person_five,
        percentMatch: Strings.match_87,
        name: Strings.rozdario_22,
        subtitle: Strings.i_live_my_life_like___),
  ];

  List<String> getAllLocation=[
    Strings.united_kindom,
    Strings.america,
    Strings.germany,
    Strings.china,
    Strings.new_york,
  ];
}
