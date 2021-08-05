import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/provider/checkout_provider.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/grocery/view/views/checkout/change_delivery_address_screen.dart';
import 'package:flutter_ui_kit/grocery/view/views/checkout/widgets/complete_order_widget.dart';
import 'package:flutter_ui_kit/grocery/view/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  Future<DateTime> getDate(BuildContext context) {
    // Imagine that this function is
    // more complex and slow.
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<CheckoutProvider>(context, listen: false).initializeChangeDeliveryTime();
    Provider.of<CheckoutProvider>(context, listen: false).initializeOrderList();
    Provider.of<CheckoutProvider>(context, listen: false).initializePaymentModel();
    return Scaffold(
        backgroundColor: ColorResources.COLOR_WHITE,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back, size: 20),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          centerTitle: true,
          elevation: 0,
          title: Text(
            Strings.check_out,
            style: poppinsRegular,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                color: ColorResources.COLOR_CART_BACKGROUND,
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Strings.order_id,
                          style: poppinsRegular,
                        ),
                        Text(
                          Strings.order_id_number,
                          style: poppinsRegular.copyWith(color: ColorResources.COLOR_PRIMARY),
                        ),
                      ],
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                    Container(
                      height: 160,
                      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
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
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                Strings.home,
                                style: poppinsSemiBold,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangeDeliveryAddressScreen()));
                                },
                                child: Text(
                                  Strings.change,
                                  style: poppinsRegular.copyWith(color: ColorResources.COLOR_PRIMARY),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/grocery/images/map.png',
                                fit: BoxFit.fill,
                                width: 80,
                                height: 80,
                              ),
                              SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.add_location,
                                        color: ColorResources.COLOR_GRAY.withOpacity(.3),
                                        size: 14,
                                      ),
                                      SizedBox(
                                        width: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                                      ),
                                      Text(
                                        Strings.address4,
                                        style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.person,
                                        color: ColorResources.COLOR_GRAY.withOpacity(.3),
                                        size: 14,
                                      ),
                                      SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                      Text(
                                        Strings.todd_benson,
                                        style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.call,
                                        color: ColorResources.COLOR_GRAY.withOpacity(.3),
                                        size: 14,
                                      ),
                                      SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                      Text(
                                        Strings.phone_number_two,
                                        style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                    Container(
                      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Strings.delivery_time_settings,
                            style: poppinsSemiBold,
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          Consumer<CheckoutProvider>(
                            builder: (context, checkoutProvider, child) => Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(color: ColorResources.COLOR_CART_BACKGROUND, borderRadius: BorderRadius.circular(10)),

                              // dropdown below..
                              child: DropdownButton<String>(
                                  value: checkoutProvider.deliveryTime,
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  iconSize: 30,
                                  isExpanded: true,
                                  underline: SizedBox(),
                                  onChanged: checkoutProvider.changeDeliveryTime,
                                  items: checkoutProvider.getDeliveryTime.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList()),
                            ),
                          ),
                          SizedBox(height: 20),
                          Consumer<CheckoutProvider>(
                            builder: (context, checkoutProvider, child) => Container(
                              height: 50,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(color: ColorResources.COLOR_CART_BACKGROUND, borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(checkoutProvider.selectDate),
                                  IconButton(
                                    icon: Icon(
                                      Icons.calendar_today,
                                      color: ColorResources.COLOR_GRAY.withOpacity(.4),
                                    ),
                                    onPressed: () async {
                                      DateTime dateTime = await getDate(context);
                                      checkoutProvider.updateDate('${dateTime.month},${dateTime.day},${dateTime.year} ');
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                    Container(
                      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(Strings.order_bill, style: poppinsSemiBold),
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          Container(height: 1, color: ColorResources.COLOR_GRAY.withOpacity(.1)),
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(Strings.total_price, style: poppinsRegular),
                              Text(
                                Strings.doller_580,
                                style: poppinsRegular.copyWith(color: ColorResources.COLOR_LIGHT_BLACK),
                              )
                            ],
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          Container(height: 1, color: ColorResources.COLOR_GRAY.withOpacity(.1)),
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(Strings.dekivery_fee, style: poppinsRegular),
                              Text(
                                Strings.dollar_6,
                                style: poppinsRegular.copyWith(color: ColorResources.COLOR_LIGHT_BLACK),
                              )
                            ],
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          Container(height: 1, color: ColorResources.COLOR_GRAY.withOpacity(.1)),
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(Strings.total_bill, style: poppinsRegular.copyWith(color: ColorResources.COLOR_PRIMARY)),
                              Text(
                                Strings.doller_9,
                                style: poppinsRegular.copyWith(color: ColorResources.COLOR_PRIMARY),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                    Container(
                      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(Strings.payment_method, style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_GRAY)),
                              Text(
                                Strings.add_new_method,
                                style: poppinsRegular.copyWith(color: ColorResources.COLOR_PRIMARY),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Consumer<CheckoutProvider>(
                            builder: (context, checkoutProvider, child) => ListView.builder(
                                shrinkWrap: true, // 1st add
                                physics: ClampingScrollPhysics(), // 2nd add
                                itemCount: checkoutProvider.getPaymentsModels.length,
                                itemBuilder: (context, index) => InkWell(
                                      onTap: () {
                                        checkoutProvider.updatePaymentIndex(index);
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 1,
                                            color: ColorResources.COLOR_GRAY.withOpacity(.2),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              checkoutProvider.getPaymentsModels[index].imageUrl != null
                                                  ? Row(
                                                      children: [
                                                        Image.asset(checkoutProvider.getPaymentsModels[index].imageUrl,
                                                            width: 46, height: 32, fit: BoxFit.fill),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          checkoutProvider.getPaymentsModels[index].cartNumber,
                                                          style: poppinsRegular,
                                                        )
                                                      ],
                                                    )
                                                  : Text(
                                                      checkoutProvider.getPaymentsModels[index].cartNumber,
                                                      style: poppinsRegular,
                                                    ),
                                              Container(
                                                width: 20,
                                                height: 20,
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
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    )),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                    Container(
                      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(Strings.note, style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_GRAY)),
                            ],
                          ),
                          SizedBox(height: 10),
                          TextField(
                            maxLines: 4,
                            decoration:
                                InputDecoration(hintText: Strings.type_somthings_you_want, hintStyle: poppinsRegular, border: InputBorder.none),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
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
              child: CustomButton(
                btnTxt: Strings.confirm_order,
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                          child: CompleteOrderWidget(),
                        );
                      });
                },
              ),
            ),
          ],
        ));
  }
}
