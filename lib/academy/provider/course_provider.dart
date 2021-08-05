import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/academy/data/model/category_model.dart';
import 'package:flutter_ui_kit/academy/data/model/course.dart';
import 'package:flutter_ui_kit/academy/data/repository/course_repo.dart';

class CourseProvider with ChangeNotifier {
  final CourseRepo courseRepo;

  CourseProvider({@required this.courseRepo});

  List<Course> _getAllFeaturedCourse = [];

  List<Course> get getAllFeaturedCourse => _getAllFeaturedCourse;

  initializeAllFeaturedCourse() {
    if (_getAllFeaturedCourse.length == 0) {
      _getAllFeaturedCourse.clear();
      _getAllFeaturedCourse = courseRepo.getAllFeaturedCourse;
      notifyListeners();
    }
  }

  // for category
  List<CategoryModel> _getAllCategory = [];

  List<CategoryModel> get getAllCategory => _getAllCategory;
  List<CategoryModel> _getSecondCategory = [];

  List<CategoryModel> get getSecondCategory => _getSecondCategory;

  initializeAllCategory() {
    if (_getAllCategory.length == 0) {
      _getAllCategory.clear();
      _getAllCategory = courseRepo.getAllCategory;
      _getSecondCategory = new List.from(courseRepo.getAllCategory.reversed);
      notifyListeners();
    }
  }

  // got top searches section
  List<String> _allTopSearches = [];

  List<String> get allTopSearches => _allTopSearches;

  initializeAllTopSearches() {
    if (_allTopSearches.length == 0) {
      _allTopSearches.clear();
      _allTopSearches = courseRepo.getAllTopSearch;
      notifyListeners();
    }
  }
}
