import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/data/models/payment.dart';
import 'package:flutter_ui_kit/grocery/provider/payment_provider.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/grocery/view/widgets/custom_button.dart';
import 'package:flutter_ui_kit/grocery/view/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class PaymentMethodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<PaymentProvider>(context, listen: false).initializePaymentMethod();
    return Scaffold(
      backgroundColor: ColorResources.COLOR_CART_BACKGROUND,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        //leading: SizedBox.shrink(),
        title: Text(
          Strings.payment_method,
          style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK, fontSize: Dimensions.FONT_SIZE_LARGE),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            left: Dimensions.PADDING_SIZE_DEFAULT, right: Dimensions.PADDING_SIZE_DEFAULT, top: Dimensions.PADDING_SIZE_DEFAULT),
        child: ListView(
          children: [
            Text(Strings.my_payment_method,style: poppinsRegular,),
            SizedBox(height: Dimensions.PADDING_SIZE_LARGE,),
            Consumer<PaymentProvider>(
              builder: (context, checkoutProvider, child) => ListView.builder(
                  shrinkWrap: true, // 1st add
                  physics: ClampingScrollPhysics(), // 2nd add
                  itemCount: checkoutProvider.getAllPaymentMethod.length,
                  itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          checkoutProvider.updatePaymentIndex(index);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                                margin: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_DEFAULT),
                                decoration: BoxDecoration(
                                  color: ColorResources.COLOR_WHITE,
                                  borderRadius: BorderRadius.circular(8.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 7,
                                      offset: Offset(0, 1), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(checkoutProvider.getAllPaymentMethod[index].imageUrl, width: 46, height: 32, fit: BoxFit.fill),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      checkoutProvider.getAllPaymentMethod[index].cartNumber,
                                      style: poppinsRegular,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 20,
                              height: 20,
                              margin: EdgeInsets.only(left: Dimensions.PADDING_SIZE_LARGE),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: checkoutProvider.selectPaymentIndex != index
                                      ? Border.all(color: ColorResources.COLOR_GRAY.withOpacity(.2))
                                      : null,
                                  color: checkoutProvider.selectPaymentIndex == index ? ColorResources.COLOR_PRIMARY : null),
                              child: checkoutProvider.selectPaymentIndex == index
                                  ? Icon(
                                      Icons.done,
                                      color: ColorResources.COLOR_WHITE,
                                      size: 10,
                                    )
                                  : SizedBox.shrink(),
                            ),
                          ],
                        ),
                      )),
            ),
            SizedBox(height: 50),
            Text(Strings.add_new_method,style: poppinsRegular,),
            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
            Consumer<PaymentProvider>(
              builder: (context, payementProvider, child) => Container(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT),
                decoration: BoxDecoration(color: ColorResources.COLOR_WHITE, borderRadius: BorderRadius.circular(10)),
                height: 60,
                alignment: Alignment.centerLeft,
                // dropdown below..
                child: DropdownButton<PaymentModel>(
                    value: payementProvider.paymentModel,
                    icon: Icon(Icons.keyboard_arrow_down),
                    iconSize: 30,
                    isExpanded: true,
                    underline: SizedBox(),
                    onChanged: payementProvider.changePaymentMethod,
                    items: payementProvider.getAllPaymentMethod.map<DropdownMenuItem<PaymentModel>>((PaymentModel value) {
                      return DropdownMenuItem<PaymentModel>(
                        value: value,
                        child: Row(
                          children: [
                            Image.asset(value.imageUrl),
                            Text(value.methodName),
                          ],
                        ),
                      );
                    }).toList()),
              ),
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
            Container(
                height: 60,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: ColorResources.COLOR_WHITE,
                  borderRadius: BorderRadius.circular(8.0)
                ),
                child: CustomTextField(hintText: Strings.card_number,isBorder: false,)),
            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
            Row(
              children: [
                Expanded(
                  child: Container(
                      height: 60,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          color: ColorResources.COLOR_WHITE,
                          borderRadius: BorderRadius.circular(8.0)
                      ),
                      child: CustomTextField(hintText: Strings.valid_thru,isBorder: false,)),
                ),
                SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                Expanded(
                  child: Container(
                      height: 60,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          color: ColorResources.COLOR_WHITE,
                          borderRadius: BorderRadius.circular(8.0)
                      ),
                      child: CustomTextField(hintText: Strings.cvv,isBorder: false,)),
                ),
              ],
            ),
            SizedBox(height: 50),
            CustomButton(btnTxt: Strings.add_new_method,onTap: () => Navigator.pop(context)),
          ],
        ),
      ),
    );
  }
}
