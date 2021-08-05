import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/select_a_language_widget.dart';
import 'package:flutter_ui_kit/grocery/view/views/checkout/widgets/complete_order_widget.dart';
import 'package:flutter_ui_kit/grocery/view/views/my_order/widget/complete_widget.dart';
import 'package:flutter_ui_kit/main/app.dart';
import 'package:flutter_ui_kit/main/model/app_model.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/more/widget/app_info_dialog.dart';
import 'package:flutter_ui_kit/wallet/view/views/step/widget/last_step_confirm_widget.dart';

class DialogData {
  static List<ScreenListModel> getDialogList(BuildContext context) {
    return [
      ScreenListModel(
        screenName: 'Dialog Screen 1',
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                child: SelectALanguageWidget(),
              );
            },
          );
        },
      ),
      ScreenListModel(
        screenName: 'Dialog Screen 2',
        widget: LastStepConfirmWidget(
          onTap: () {},
        ),
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                child: LastStepConfirmWidget(
                  onTap: () {},
                ),
              );
            },
          );
        },
      ),
      ScreenListModel(
        screenName: 'Dialog Screen 3',
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                child: CompleteOrderWidget(),
              );
            },
          );
        },
      ),
      ScreenListModel(
        screenName: 'Dialog Screen 4',
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                child: CompleteWidget(),
              );
            },
          );
        },
      ),
      ScreenListModel(
        screenName: 'Dialog Screen 5',
        app: App.SIXVALLEY,
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                backgroundColor: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                child: SixAppInfoDialog(),
              );
            },
          );
        },
      ),
    ];
  }
}