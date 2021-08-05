import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/data/bottom_sheet_data.dart';
import 'package:flutter_ui_kit/main/data/dash_board_data.dart';
import 'package:flutter_ui_kit/main/data/details_data.dart';
import 'package:flutter_ui_kit/main/data/dialog_data.dart';
import 'package:flutter_ui_kit/main/data/list_data.dart';
import 'package:flutter_ui_kit/main/data/login_data.dart';
import 'package:flutter_ui_kit/main/data/on_boarding_data.dart';
import 'package:flutter_ui_kit/main/data/otp_data.dart';
import 'package:flutter_ui_kit/main/data/profile_data.dart';
import 'package:flutter_ui_kit/main/data/signup_data.dart';
import 'package:flutter_ui_kit/main/widget/screen_widget.dart';

class AllScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column( children: [
      ScreenWidget(
        isHomeScreen: true,
        screenName: 'SignIn Screen',
        numberOfScreens: LoginData.getLoginList().length,
        screenListModel: LoginData.getLoginList(),
      ),
      ScreenWidget(
        isHomeScreen: true,
        screenName: 'SignUp Screen',
        numberOfScreens: SignUpData.getSignUpList().length,
        screenListModel: SignUpData.getSignUpList(),
      ),
      ScreenWidget(
        isHomeScreen: true,
        screenName: 'Profile Screen',
        numberOfScreens: ProfileData.getProfileList().length,
        screenListModel: ProfileData.getProfileList(),
      ),
      ScreenWidget(
        isHomeScreen: true,
        screenName: 'OnBoarding Screen',
        numberOfScreens: OnBoardingData.getOnBoardingList().length,
        screenListModel: OnBoardingData.getOnBoardingList(),
      ),
      ScreenWidget(
        isHomeScreen: true,
        screenName: 'DashBoard Screen',
        numberOfScreens: DashBoardData.getDashBoardList().length,
        screenListModel: DashBoardData.getDashBoardList(),
      ),
      ScreenWidget(
        isHomeScreen: true,
        screenName: 'List Screen',
        numberOfScreens: ListData.getList().length,
        screenListModel: ListData.getList(),
      ),
      ScreenWidget(
        isHomeScreen: true,
        screenName: 'Details Screen',
        numberOfScreens: DetailsData.getDetailsList().length,
        screenListModel: DetailsData.getDetailsList(),
      ),
      ScreenWidget(
        isHomeScreen: true,
        screenName: 'Dialog Screen',
        numberOfScreens: DialogData.getDialogList(context).length,
        screenListModel: DialogData.getDialogList(context),
        isOpenModalButtonSheet: true,
      ),
      ScreenWidget(
        isHomeScreen: true,
        screenName: 'BottomSheet',
        numberOfScreens: BottomSheetData.getBottomSheetList(context).length,
        screenListModel: BottomSheetData.getBottomSheetList(context),
        isOpenModalButtonSheet: true,
      ),
      ScreenWidget(
        isHomeScreen: true,
        screenName: 'OTP Screen',
        numberOfScreens: OtpData.getLOtpList().length,
        screenListModel: OtpData.getLOtpList(),
      ),
    ],);
  }
}
