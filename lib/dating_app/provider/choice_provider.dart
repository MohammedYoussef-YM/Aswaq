import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/dating_app/data/models/choice_model.dart';
import 'package:flutter_ui_kit/dating_app/data/repository/choice_repo.dart';

class ChoiceProvider with ChangeNotifier {
  final ChoiceRepo choiceRepo;

  ChoiceProvider({@required this.choiceRepo});

  List<ChoiceModel> _getAllGender = [];
  List<ChoiceModel> _getAllBodyColor = [];
  List<ChoiceModel> _getAllRegion = [];
  List<ChoiceModel> _getAllHeight = [];
  List<ChoiceModel> _getAllAge = [];

  List<ChoiceModel> get getAllGender => _getAllGender;

  List<ChoiceModel> get getAllBodyColor => _getAllBodyColor;

  List<ChoiceModel> get getAllRegion => _getAllRegion;

  List<ChoiceModel> get getAllHeight => _getAllHeight;

  List<ChoiceModel> get getAllAge => _getAllAge;

  String _region='';
  String get  region=>_region;

  int _selectGenderIndex = -1;
  int _selectBodyColorIndex = -1;
  int _selectRegionIndex = -1;
  int _selectHeightIndex = -1;
  int _selectAgeIndex = -1;

  int get selectGenderIndex => _selectGenderIndex;
  int get selectBodyColorIndex => _selectBodyColorIndex;
  int get selectRegionIndex => _selectRegionIndex;
  int get selectHeightIndex => _selectHeightIndex;
  int get selectAgeIndex => _selectAgeIndex;

  bool isSelectChoice(){
    if(_selectGenderIndex>-1 || _selectBodyColorIndex>-1 || _selectRegionIndex>-1 || _selectHeightIndex>-1||_selectAgeIndex>-1)
      return true;
    else
      return false;
  }

  changeRegionValue(String value){
    _region=value;
    notifyListeners();
  }

  changeGenderIndex(int index) {
    _selectGenderIndex = index;
    notifyListeners();
  }

  changeBodyColorIndex(int index) {
    _selectBodyColorIndex = index;
    _getAllBodyColor[index].isSelect=!_getAllBodyColor[index].isSelect;
    notifyListeners();
  }

  changeRegionIndex(int index) {
    _selectRegionIndex = index;
    _getAllRegion[index].isSelect=!_getAllRegion[index].isSelect;
    notifyListeners();
  }

  changeHeightIndex(int index) {
    _selectHeightIndex = index;
    _getAllHeight[index].isSelect=!_getAllHeight[index].isSelect;
    notifyListeners();
  }

  changeAgeIndex(int index) {
    _selectAgeIndex = index;
    _getAllAge[index].isSelect=!_getAllAge[index].isSelect;
    notifyListeners();
  }

  initializeGenderData() {
    if (_getAllGender.length == 0) {
      _getAllGender.clear();
      _getAllGender = choiceRepo.getAllGender;

      notifyListeners();
    }
  }

  initializeBodyColorData() {
    if (_getAllBodyColor.length == 0) {
      _getAllBodyColor.clear();
      _getAllBodyColor = choiceRepo.getAllBodyColor;
      notifyListeners();
    }
  }

  initializeRegionData() {
    if (_getAllRegion.length == 0) {
      _getAllRegion.clear();
      _getAllRegion = choiceRepo.getAllRegion;
      _region=choiceRepo.getAllRegion[0].title;
      notifyListeners();
    }
  }

  initializeHeightData() {
    if (_getAllHeight.length == 0) {
      _getAllHeight.clear();
      _getAllHeight = choiceRepo.getAllHeight;
      notifyListeners();
    }
  }

  initializeAgeData() {
    if (_getAllAge.length == 0) {
      _getAllAge.clear();
      _getAllAge = choiceRepo.getAllAge;
      notifyListeners();
    }
  }
}
