import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/driver_app/data/model/history_model.dart';
import 'package:flutter_ui_kit/driver_app/data/repository/history_repo.dart';

class DriverAppHistoryProvider with ChangeNotifier {
  final DriverAppHistoryRepo historyRepo;

  DriverAppHistoryProvider({@required this.historyRepo});

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
