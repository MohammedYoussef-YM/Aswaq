import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/dating_app/data/models/user_model.dart';
import 'package:flutter_ui_kit/dating_app/data/repository/dating_app_user_repo.dart';

class DatingAppUserProvider with ChangeNotifier{
  final DatingAppUserRepo datingAppUserRepo;

  DatingAppUserProvider({this.datingAppUserRepo});

  List<UserModel> _getAllUsers = [];
  List<UserModel> get getAllUsers => _getAllUsers;
  List<UserModel> get getAllUsersReversed => _getAllUsers.reversed.toList();

  initializeAllUsers(){
    if(_getAllUsers.length==0){
      _getAllUsers.clear();
      _getAllUsers=datingAppUserRepo.getAllUserInfo;
      notifyListeners();
    }
  }
}