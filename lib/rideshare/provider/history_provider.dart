import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/rideshare/data/model/history_model.dart';
import 'package:flutter_ui_kit/rideshare/data/repository/history_repo.dart';

class HistoryProvider with ChangeNotifier {
  final HistoryRepo historyRepo;

  HistoryProvider({@required this.historyRepo});

  List<HistoryModel> _historyModels = [];

  List<HistoryModel> get historyModels => _historyModels;

  initializeHistory() {
    if (_historyModels.length == 0) {
      _historyModels.clear();
      _historyModels = historyRepo.getAllHistoryData;
      notifyListeners();
    }
  }
}
