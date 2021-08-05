import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/wallet/data/models/my_goals_model.dart';
import 'package:flutter_ui_kit/wallet/data/repository/goals_repo.dart';

class GoalsProvider extends ChangeNotifier {
  final GoalsRepo goalsRepo;
  GoalsProvider({@required this.goalsRepo});

  List<MyGoalsModel> getGoalsList() {
    return goalsRepo.getGoalsList();
  }
}