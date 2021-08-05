import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/data/model/faq_model.dart';
import 'package:flutter_ui_kit/doctor/data/repository/faq_repo.dart';

class FaqProvider extends ChangeNotifier {
  final FaqRepo faqRepo;
  FaqProvider({@required this.faqRepo});

  List<FaqModel> getFaqList() {
    return faqRepo.getFaqList();
  }
}