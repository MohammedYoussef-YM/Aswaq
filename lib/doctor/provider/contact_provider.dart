import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/data/model/contact_model.dart';
import 'package:flutter_ui_kit/doctor/data/repository/contact_repo.dart';

class ContactProvider extends ChangeNotifier {
  final ContactRepo contactRepo;
  ContactProvider({@required this.contactRepo});

  List<ContactModel> getContactList() {
    return contactRepo.getContactList();
  }
}