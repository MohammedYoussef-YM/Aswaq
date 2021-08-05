
class InstructorModel {
  String _image;
  String _name;
  String _details;
  int _students;
  int _courses;

  InstructorModel(this._image, this._name, this._details, this._students, this._courses);

  int get courses => _courses;
  int get students => _students;
  String get details => _details;
  String get name => _name;
  String get image => _image;
}