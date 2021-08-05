import 'package:flutter_ui_kit/academy/data/model/instructor_model.dart';
import 'package:flutter_ui_kit/academy/utility/images.dart';

class AcademyDesignRepo {
  List<String> getPopularTopics() {
    List<String> popularTopicList = ['javascript', 'photoshop', 'excel', 'wordpress', 'react', 'C#', 'Python', 'java'];
    return popularTopicList;
  }

  List<String> getSubcategories() {
    List<String> subcategoryList = ['Design', 'Photography & video', 'IT & Software', 'Game Design', 'Finance & Accounting'];
    return subcategoryList;
  }

  List<InstructorModel> getInstructors() {
    List<InstructorModel> instructorList = [
      InstructorModel(Images.author, 'John Sina', 'Certified Photoshop instructor & Expart, Web & App Designer', 64265, 16),
      InstructorModel(Images.author_1, 'Martin Perhiniak', 'Adobe Certified Instructor & Adobe Certified Expart', 125265, 24),
    ];
    return instructorList;
  }
}