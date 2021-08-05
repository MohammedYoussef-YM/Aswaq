import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_kit/restaurant/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant/provider/coupon_provider.dart';
import 'package:flutter_ui_kit/restaurant/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant/utill/images.dart';
import 'package:flutter_ui_kit/restaurant/utill/styles.dart';
import 'package:flutter_ui_kit/restaurant/view/base/custom_app_bar.dart';
import 'package:flutter_ui_kit/restaurant/view/base/no_data_screen.dart';
import 'package:provider/provider.dart';

class CouponScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<RestCouponProvider>(context, listen: false).getCouponList(context);

    return Scaffold(
      appBar: CustomAppBar(title: getTranslated('coupon', context)),
      body: Consumer<RestCouponProvider>(
        builder: (context, coupon, child) {
          return coupon.couponList != null ? coupon.couponList.length > 0 ? ListView.builder(
            itemCount: coupon.couponList.length,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: coupon.couponList[index].code));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(getTranslated('coupon_code_copied', context)), backgroundColor: Colors.green));
                },
                child: Padding(
                  padding: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_LARGE),
                  child: Stack(children: [

                    Image.asset(Images.coupon_bg, height: 100, width: MediaQuery.of(context).size.width, color: Theme.of(context).primaryColor),

                    Container(
                      height: 100,
                      alignment: Alignment.center,
                      child: Row(children: [

                        SizedBox(width: 50),
                        Image.asset(Images.percentage, height: 50, width: 50),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE, vertical: Dimensions.PADDING_SIZE_SMALL),
                          child: Image.asset(Images.line, height: 100, width: 5),
                        ),

                        Expanded(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                            SelectableText(
                              coupon.couponList[index].code,
                              style: rubikRegular.copyWith(color: ColorResources.COLOR_WHITE),
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            Text(
                              '${coupon.couponList[index].discount}${coupon.couponList[index].discountType == 'percent' ? '%' : '\$'} off',
                              style: rubikMedium.copyWith(color: ColorResources.COLOR_WHITE, fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE),
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            Text(
                              '${getTranslated('valid_until', context)} ${coupon.couponList[index].expireDate}',
                              style: rubikRegular.copyWith(color: ColorResources.COLOR_WHITE, fontSize: Dimensions.FONT_SIZE_SMALL),
                            ),
                          ]),
                        ),

                      ]),
                    ),

                  ]),
                ),
              );
            },
          ) : NoDataScreen() : Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)));
        },
      ),
    );
  }
}
