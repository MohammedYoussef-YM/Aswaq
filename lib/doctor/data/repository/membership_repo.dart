import 'package:flutter_ui_kit/doctor/data/model/membership_model.dart';
import 'package:flutter_ui_kit/doctor/utility/strings.dart';

class MembershipRepo {
  List<MembershipModel> getMembershipList() {
    List<MembershipModel> membershipList = [
      MembershipModel('1 months', [Strings.LOREM_IPSUM, Strings.LOREM_IPSUM_DOLOR, Strings.LOREM_IPSUM_DOLOR_SIT_AMET, Strings.LOREM_IPSUM, Strings.LOREM_IPSUM_DOLOR, Strings.LOREM_IPSUM_DOLOR_SIT_AMET, Strings.LOREM_IPSUM, Strings.LOREM_IPSUM_DOLOR, Strings.LOREM_IPSUM_DOLOR_SIT_AMET, Strings.LOREM_IPSUM, Strings.LOREM_IPSUM_DOLOR], 50),
      MembershipModel('6 months', [Strings.LOREM_IPSUM, Strings.LOREM_IPSUM_DOLOR, Strings.LOREM_IPSUM_DOLOR_SIT_AMET, Strings.LOREM_IPSUM, Strings.LOREM_IPSUM_DOLOR, Strings.LOREM_IPSUM_DOLOR_SIT_AMET, Strings.LOREM_IPSUM, Strings.LOREM_IPSUM_DOLOR, Strings.LOREM_IPSUM_DOLOR_SIT_AMET, Strings.LOREM_IPSUM, Strings.LOREM_IPSUM_DOLOR], 150),
      MembershipModel('12 months', [Strings.LOREM_IPSUM, Strings.LOREM_IPSUM_DOLOR, Strings.LOREM_IPSUM_DOLOR_SIT_AMET, Strings.LOREM_IPSUM, Strings.LOREM_IPSUM_DOLOR, Strings.LOREM_IPSUM_DOLOR_SIT_AMET, Strings.LOREM_IPSUM, Strings.LOREM_IPSUM_DOLOR, Strings.LOREM_IPSUM_DOLOR_SIT_AMET, Strings.LOREM_IPSUM, Strings.LOREM_IPSUM_DOLOR], 350),
      MembershipModel('18 months', [Strings.LOREM_IPSUM, Strings.LOREM_IPSUM_DOLOR, Strings.LOREM_IPSUM_DOLOR_SIT_AMET, Strings.LOREM_IPSUM, Strings.LOREM_IPSUM_DOLOR, Strings.LOREM_IPSUM_DOLOR_SIT_AMET, Strings.LOREM_IPSUM, Strings.LOREM_IPSUM_DOLOR, Strings.LOREM_IPSUM_DOLOR_SIT_AMET, Strings.LOREM_IPSUM, Strings.LOREM_IPSUM_DOLOR], 750),
    ];
    return membershipList;
  }
}