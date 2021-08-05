import 'package:flutter_ui_kit/driver_app/data/model/history_model.dart';
import 'package:flutter_ui_kit/rideshare/utility/strings.dart';

class DriverAppHistoryRepo{
  List<HistoryModel> getAllHistoryData=[
    HistoryModel(
      time: Strings.time_one,
      title: Strings.history_title_one,
      subtitle: Strings.paid_by_card,
      price: Strings.doller_12,
    ),
    HistoryModel(
      time: Strings.time_two,
      title: Strings.history_title_two,
      subtitle: Strings.paid_by_card,
      price: Strings.doller_11,
    ),
    HistoryModel(
      time: Strings.time_three,
      title: Strings.history_title_three,
      subtitle: Strings.paid_by_card,
      price: Strings.doller_30,
    ),
    HistoryModel(
      time: Strings.time_four,
      title: Strings.history_title_four,
      subtitle: Strings.paid_by_card,
      price: Strings.doller_10,
    ),
    HistoryModel(
      time: Strings.time_one,
      title: Strings.history_title_one,
      price: Strings.doller_12,
      subtitle: Strings.paid_by_card,
    ),
    HistoryModel(
      time: Strings.time_two,
      title: Strings.history_title_two,
      subtitle: Strings.paid_by_card,
      price: Strings.doller_11,
    ),
    HistoryModel(
      time: Strings.time_three,
      title: Strings.history_title_three,
      subtitle: Strings.paid_by_card,
      price: Strings.doller_30,
    ),
    HistoryModel(
      time: Strings.time_four,
      title: Strings.history_title_four,
      subtitle: Strings.paid_by_card,
      price: Strings.doller_10,
    ),
  ];
}