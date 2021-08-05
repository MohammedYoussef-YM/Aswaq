import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/food/screens/On_the_way_bottom_sheet.dart';
import 'package:flutter_ui_kit/food/screens/bottomsheet/change_cash_method_bottomsheet.dart';
import 'package:flutter_ui_kit/food/screens/bottomsheet/payment_bottomsheet.dart';
import 'package:flutter_ui_kit/food/screens/widget/open_cart_bottom_sheet.dart';
import 'package:flutter_ui_kit/grocery/data/models/product.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';
import 'package:flutter_ui_kit/grocery/view/views/detail_meal/widget/grocery_items_button_sheet.dart';
import 'package:flutter_ui_kit/grocery/view/views/product_details/widgets/grocery_addtocard_bottom_sheet.dart';
import 'package:flutter_ui_kit/main/app.dart';
import 'package:flutter_ui_kit/main/model/app_model.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/product/review_dialog.dart';

class BottomSheetData {
  static List<ScreenListModel> getBottomSheetList(BuildContext context) {
    return [
      ScreenListModel(
        screenName: 'Bottom Sheet 1',
        onTap: () {
          openCartBottomSheet(context);
        },
      ),
      ScreenListModel(
        screenName: 'Bottom Sheet 2',
        onTap: () {
          groceryItemModalSheet(context, () {});
        },
      ),
      ScreenListModel(
        screenName: 'Bottom Sheet 3',
        onTap: () {
          changeCashMethodMethod(context);
        },
      ),
      ScreenListModel(
        screenName: 'Bottom Sheet 4',
        onTap: () {
          PaymentBottomSheet.paymentStatus(context);
        },
      ),
      ScreenListModel(
        screenName: 'Bottom Sheet 5',
        onTap: () {
          OnTheWayBottomSheet.orderStatus(context);
        },
      ),
      ScreenListModel(
        screenName: 'Bottom Sheet 6',
        onTap: () {
          groceryAddToCardBottomSheet(
              context,
              GroceryProduct(
                imageUrl: 'assets/grocery/products/pineapple.png',
                isFabourite: false,
                name: Strings.pineapple,
                runningPrice: Strings.doller_49_125,
                rating: Strings.ratting_4_9,
                quantity: Strings.one_pics_box,
                id: 11,
                previoudPrice: Strings.doller_580,
                off: Strings.five_percent_off,
                count: 1,
              ),
                  () {});
        },
      ),
      ScreenListModel(
        screenName: 'Bottom Sheet 7',
        app: App.SIXVALLEY,
        onTap: () {
          showModalBottomSheet(context: context, isScrollControlled: true, builder: (context) => ReviewBottomSheet(productID: '1', callback: () {}));
        },
      ),
    ];
  }
}