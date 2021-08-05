import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/data/model/membership_model.dart';
import 'package:flutter_ui_kit/doctor/data/repository/membership_repo.dart';

class MembershipProvider extends ChangeNotifier {
  final MembershipRepo membershipRepo;
  MembershipProvider({@required this.membershipRepo});

  List<MembershipModel> getBannerList() {
    return membershipRepo.getMembershipList();
  }
}