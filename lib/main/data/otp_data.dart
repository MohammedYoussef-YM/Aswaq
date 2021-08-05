import 'package:flutter_ui_kit/food/screens/auth/otp_confirmation.dart';
import 'package:flutter_ui_kit/household_app/view/screens/auth/otp_verification_screen.dart';
import 'package:flutter_ui_kit/main/model/app_model.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/forgot_password/verification_screen.dart';
import 'package:flutter_ui_kit/rideshare/view/view/auth/rideshare_otp_confirmation.dart';
import 'package:flutter_ui_kit/wallet/view/views/send_money2_Screen.dart';
import 'package:flutter_ui_kit/wallet/view/views/step/step_two_screen.dart';
import 'package:flutter_ui_kit/main/app.dart';

class OtpData {
  static List<ScreenListModel> getLOtpList() {
    return [
      ScreenListModel(
        screenName: 'OTP Screen 1',
        widget: StepTwoScreen(),
      ),
      ScreenListModel(
        screenName: 'OTP Screen 2',
        widget: SendMoneyScreen2(),
      ),
      ScreenListModel(
        screenName: 'OTP Screen 3',
        widget: OTPConfirmationScreen(),
      ),
      ScreenListModel(
        screenName: 'OTP Screen 4',
        widget: VerificationScreen(emailAddress: '', fromSignUp: true),
        app: App.RESTAURANT,
      ),
      ScreenListModel(
        screenName: 'OTP Screen 5',
        widget: RideShareConfirmationScreen(),
      ),
      ScreenListModel(
        screenName: 'OTP Screen 6',
        widget: HouseHoldOTPVerificationScreen(),
      ),
    ];
  }
}