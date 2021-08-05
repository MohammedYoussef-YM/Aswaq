import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/data/repository/design_repo.dart';
import 'package:flutter_ui_kit/academy/data/model/instructor_model.dart';

class AcademyDesignProvider extends ChangeNotifier {
  AcademyDesignRepo designRepo;
  AcademyDesignProvider({@required this.designRepo});

  List<String> _popularTopicList = [];
  List<String> _subcategoryList = [];
  List<InstructorModel> _instructorList = [];
  List<String> get popularTopicList => _popularTopicList;
  List<String> get subcategoryList => _subcategoryList;
  List<InstructorModel> get instructorList => _instructorList;

  void getDesignData() {
    _popularTopicList.clear();
    _subcategoryList.clear();
    _instructorList.clear();
    _popularTopicList.addAll(designRepo.getPopularTopics());
    _subcategoryList.addAll(designRepo.getSubcategories());
    _instructorList.addAll(designRepo.getInstructors());
    notifyListeners();
  }

}