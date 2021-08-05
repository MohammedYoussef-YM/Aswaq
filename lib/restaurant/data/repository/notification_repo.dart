import 'package:dio/dio.dart';
import 'package:flutter_ui_kit/restaurant/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/base/api_response.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/notification_model.dart';
import 'package:flutter_ui_kit/restaurant/helper/date_converter.dart';
import 'package:flutter_ui_kit/restaurant/utill/images.dart';

class RestNotificationRepo {

  Future<ApiResponse> getNotificationList() async {
    try {
      List<NotificationModel> _notificationList = [
        NotificationModel(id: 1, title: 'Order delivered', description: 'Your order is delivered. Order ID: 100001', image: Images.product_1, createdAt: DateConverter.localDateToIsoString(DateTime.now())),
        NotificationModel(id: 2, title: 'Order delivered', description: 'Your order is delivered. Order ID: 100001', image: Images.product_1, createdAt: DateConverter.localDateToIsoString(DateTime.now())),
      ];
      final response = Response(requestOptions: RequestOptions(path: ''), data: _notificationList, statusCode: 200);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
