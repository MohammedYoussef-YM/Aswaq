import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/base/api_response.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/onboarding_model.dart';
import 'package:flutter_ui_kit/restaurant/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant/utill/images.dart';

class RestOnBoardingRepo {

  Future<ApiResponse> getOnBoardingList(BuildContext context) async {
    try {
      List<OnBoardingModel> onBoardingList = [
        OnBoardingModel(Images.onboarding_one, getTranslated('make_your_choice_order', context), getTranslated('lorem__ant', context)),
        OnBoardingModel(Images.onboarding_two, getTranslated('select_delivery_location', context), getTranslated('lorem__ant', context)),
        OnBoardingModel(Images.onboarding_three, getTranslated('delivery_to_your_home', context), getTranslated('lorem__ant', context)),
      ];

      Response response = Response(requestOptions: RequestOptions(path: ''), data: onBoardingList, statusCode: 200);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
