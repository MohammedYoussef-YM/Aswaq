import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/grocery/data/models/branch_model.dart';
import 'package:flutter_ui_kit/grocery/data/repository/branch_repo.dart';

class BranchProvider with ChangeNotifier{
  final BranchRepo branchRepo;
  BranchProvider({this.branchRepo});

  List<BranchModel> _getAllBranch=[];
  List<BranchModel> get getAllBranch=>_getAllBranch;

  int _selectBranchIndex=0;
  int get selectBranchIndex=>_selectBranchIndex;

  changeSelectBranchIndex(int index){
    _selectBranchIndex=index;
    notifyListeners();
  }

  initializeBranch(){
    if (_getAllBranch.length == 0) {
      _getAllBranch.clear();
      _getAllBranch = branchRepo.getAllBranch;
      notifyListeners();
    }
  }
}