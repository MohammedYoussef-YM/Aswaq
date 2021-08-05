import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/wallet/data/models/my_goals_model.dart';
import 'package:flutter_ui_kit/wallet/utility/strings.dart';

class GoalsRepo {
  List<MyGoalsModel> getGoalsList() {
    List<MyGoalsModel> goalsList = [
      MyGoalsModel(
        imageUrl: 'assets/wallet/Illustration/hill-tracks-bangladesh.png',
        goalTitle: Strings.ONGOING,
        color1: ColorResources.COLOR_WHITE,
        color2: ColorResources.COLOR_WHITE.withOpacity(.51),
        color3: ColorResources.COLOR_WHITE.withOpacity(.51),
        color4: ColorResources.COLOR_WHITE.withOpacity(.51),
        color5: ColorResources.COLOR_WHITE.withOpacity(.51),
      ),
      MyGoalsModel(
        imageUrl: 'assets/wallet/Illustration/hill-tracks-bangladesh.png',
        goalTitle: Strings.UPCOMING,
        color1: ColorResources.COLOR_WHITE.withOpacity(.51),
        color2: ColorResources.COLOR_WHITE,
        color3: ColorResources.COLOR_WHITE.withOpacity(.51),
        color4: ColorResources.COLOR_WHITE.withOpacity(.51),
        color5: ColorResources.COLOR_WHITE.withOpacity(.51),
      ),
      MyGoalsModel(
        imageUrl: 'assets/wallet/Illustration/hill-tracks-bangladesh.png',
        goalTitle: Strings.COMPLETE,
        color1: ColorResources.COLOR_WHITE.withOpacity(.51),
        color2: ColorResources.COLOR_WHITE.withOpacity(.51),
        color3: ColorResources.COLOR_WHITE,
        color4: ColorResources.COLOR_WHITE.withOpacity(.51),
        color5: ColorResources.COLOR_WHITE.withOpacity(.51),
      ),
      MyGoalsModel(
        imageUrl: 'assets/wallet/Illustration/hill-tracks-bangladesh.png',
        goalTitle: Strings.ONGOING,
        color1: ColorResources.COLOR_WHITE.withOpacity(.51),
        color2: ColorResources.COLOR_WHITE.withOpacity(.51),
        color3: ColorResources.COLOR_WHITE.withOpacity(.51),
        color4: ColorResources.COLOR_WHITE,
        color5: ColorResources.COLOR_WHITE.withOpacity(.51),
      ),
      MyGoalsModel(
        imageUrl: 'assets/wallet/Illustration/hill-tracks-bangladesh.png',
        goalTitle: Strings.COMPLETE,
        color1: ColorResources.COLOR_WHITE.withOpacity(.51),
        color2: ColorResources.COLOR_WHITE.withOpacity(.51),
        color3: ColorResources.COLOR_WHITE.withOpacity(.51),
        color4: ColorResources.COLOR_WHITE.withOpacity(.51),
        color5: ColorResources.COLOR_WHITE,
      ),
    ];
    return goalsList;
  }
}
