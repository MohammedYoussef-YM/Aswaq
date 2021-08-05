import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/provider/payment_provider.dart';
import 'package:flutter_ui_kit/academy/utility/colorResources.dart';
import 'package:flutter_ui_kit/academy/utility/dimensions.dart';
import 'package:flutter_ui_kit/academy/utility/strings.dart';
import 'package:flutter_ui_kit/academy/utility/style.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ui_kit/academy/view/screen/payment/widget/payment_bottom_sheet.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<AcademyPaymentProvider>(context, listen: false).getPayments();

    return Scaffold(
      appBar: AppBar(
          backgroundColor: AcademyColorResources.COLOR_WHITE,
          leading: IconButton(icon: Icon(Icons.arrow_back, color: AcademyColorResources.COLOR_GREY), onPressed: () => Navigator.pop(context)),
          title: Text(AcademyStrings.confirm_your_order, style: avenirHeavy.copyWith(fontSize: 18))),
      body: Consumer<AcademyPaymentProvider>(
        builder: (context, payment, index) {
          return Padding(
            padding: EdgeInsets.all(AcademyDimensions.PADDING_SIZE_SMALL),
            child: Column(children: [
              Expanded(
                  child: ListView.builder(
                itemCount: payment.paymentList.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => payment.setSelected(index),
                    child: Container(
                      margin: EdgeInsets.only(bottom: AcademyDimensions.PADDING_SIZE_LARGE),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: payment.selectedIndex == index ? AcademyColorResources.COLOR_BLACK : AcademyColorResources.BORDER_COLOR,
                      ),
                      child: ListTile(
                        leading: Image.asset(payment.paymentList[index].image, width: 50),
                        title: Text(payment.paymentList[index].cardName,
                            style: robotoMedium.copyWith(
                              color: payment.selectedIndex == index ? AcademyColorResources.COLOR_WHITE : AcademyColorResources.COLOR_BLACK,
                            )),
                        subtitle: Text(payment.paymentList[index].cardNumber,
                            style: robotoMedium.copyWith(
                              color: AcademyColorResources.COLOR_GREY,
                              fontSize: AcademyDimensions.FONT_SIZE_SMALL,
                            )),
                        trailing: Radio(
                          value: index,
                          groupValue: payment.selectedIndex,
                          onChanged: (int index) => payment.setSelected(index),
                          activeColor: AcademyColorResources.COLOR_WHITE,
                        ),
                      ),
                    ),
                  );
                },
              )),
              Divider(),
              Row(children: [
                Expanded(child: Text('BDT 6000.0', style: robotoMedium.copyWith(fontSize: 24))),
                InkWell(
                  onTap: () => showModalBottomSheet(context: context, builder: (context) => PaymentBottomSheet()),
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: AcademyDimensions.PADDING_SIZE_SMALL, horizontal: AcademyDimensions.PADDING_SIZE_LARGE),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AcademyColorResources.COLOR_ORANGE),
                    child: Text(AcademyStrings.pay_now, style: robotoBold.copyWith(fontSize: 20, color: AcademyColorResources.COLOR_WHITE)),
                  ),
                ),
              ]),
            ]),
          );
        },
      ),
    );
  }
}
