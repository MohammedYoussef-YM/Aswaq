import 'package:dio/dio.dart';
import 'package:flutter_ui_kit/restaurant/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/base/api_response.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/chat_model.dart';
import 'package:flutter_ui_kit/restaurant/helper/date_converter.dart';

class RestChatRepo {

  Future<ApiResponse> getChatList() async {
    try {
      List<ChatModel> _chatList = [
        ChatModel(id: 1, userId: '1', reply: 'Hi', message: null, createdAt: DateConverter.localDateToIsoString(DateTime.now())),
      ];
      final response = Response(requestOptions: RequestOptions(path: ''), data: _chatList, statusCode: 200);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}