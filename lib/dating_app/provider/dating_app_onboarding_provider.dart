import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/dating_app/data/repository/datingapp_onboarding_repo.dart';

class DatingAppOnBoardingProvider with ChangeNotifier{
  final DatingAppOnBoardingRepo onBoardingRepo;

  DatingAppOnBoardingProvider({@required this.onBoardingRepo});

  List<String> _getAllOnBoardingData=[];
  List<String> get getAllOnBoardingData=>_getAllOnBoardingData;

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  changeOnboardingIndex(int index){
    _selectedIndex=index;
    notifyListeners();
  }


  initializeOnBoardingData(){
    if(_getAllOnBoardingData.length==0){
      _getAllOnBoardingData.clear();
      _getAllOnBoardingData=onBoardingRepo.getAllOnBoardingData;
      notifyListeners();
    }
  }
}