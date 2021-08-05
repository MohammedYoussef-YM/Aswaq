import 'package:flutter_ui_kit/wallet/data/models/organized_model.dart';
import 'package:flutter_ui_kit/wallet/utility/strings.dart';

class OrganizationRepo {
  List<OrganizerModel> getOrganizerList() {
    List<OrganizerModel> organizationList = [
      OrganizerModel(
          organizerImageUrl: 'assets/wallet/Icon/electricity.png',
          name: Strings.ORGANIZATION1),
      OrganizerModel(
          organizerImageUrl: 'assets/wallet/Icon/telephn.png',
          name: Strings.ORGANIZATION2),
      OrganizerModel(
          organizerImageUrl: 'assets/wallet/Icon/education.png',
          name: Strings.ORGANIZATION3),
      OrganizerModel(
          organizerImageUrl: 'assets/wallet/Icon/internet.png',
          name: Strings.ORGANIZATION4),
      OrganizerModel(
          organizerImageUrl: 'assets/wallet/Icon/electricity.png',
          name: Strings.ORGANIZATION1),
      OrganizerModel(
          organizerImageUrl: 'assets/wallet/Icon/telephn.png',
          name: Strings.ORGANIZATION2),
      OrganizerModel(
          organizerImageUrl: 'assets/wallet/Icon/education.png',
          name: Strings.ORGANIZATION3),
      OrganizerModel(
          organizerImageUrl: 'assets/wallet/Icon/internet.png',
          name: Strings.ORGANIZATION4),
    ];
    return organizationList;
  }
}
