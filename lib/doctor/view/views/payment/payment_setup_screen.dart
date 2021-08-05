import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/dimensions.dart';
import 'package:flutter_ui_kit/doctor/utility/strings.dart';
import 'package:flutter_ui_kit/doctor/utility/style.dart';
import 'package:flutter_ui_kit/doctor/view/views/online_appointments_screen.dart';
import 'package:flutter_ui_kit/doctor/view/views/payment/widget/card_widget.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/button/custom_button.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/custom_app_bar.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/edittext/custom_text_field.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/textfield_title_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class PaymentSetupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _cardController = TextEditingController();
    TextEditingController _expireController = TextEditingController();
    TextEditingController _cvvController = TextEditingController();
    FocusNode _nameNode = FocusNode();
    FocusNode _cardNode = FocusNode();
    FocusNode _expireNode = FocusNode();
    FocusNode _cvvNode = FocusNode();

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(title: Strings.PAYMENT),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  // for card
                  CardWidget(
                    cartTitle: Strings.BANK_CARD,
                  ),

                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    height: 20,
                    margin: EdgeInsets.only(left: 15, right: 15, bottom: 0),
                    child: Text(
                      Strings.BY_ADDING_A_DEBIT,
                      style: khulaRegular.copyWith(
                        color: ColorResources.COLOR_GREY,
                        fontSize: Dimensions.FONT_SIZE_SMALL,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 15, right: 15, top: 0),
                    child: Text(
                      Strings.TERMSANDCONDITION,
                      style: khulaBold.copyWith(
                        color: ColorResources.COLOR_PRIMARY,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  // for Name
                  Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.MARGIN_SIZE_DEFAULT,
                        right: Dimensions.MARGIN_SIZE_DEFAULT,
                        bottom: Dimensions.MARGIN_SIZE_DEFAULT),
                    child: Stack(
                      children: [
                        TextFieldTitleWidget(
                          imageUrl: 'assets/doctor/Icon/people.png',
                          title: Strings.NAME,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: Dimensions.MARGIN_SIZE_LARGE),
                          child: CustomTextField(
                            hintTxt: Strings.ENTER_YOUR_NAME,
                            textInputType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            focusNode: _nameNode,
                            nextNode: _cardNode,
                            controller: _nameController,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // for Card Number
                  Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.MARGIN_SIZE_DEFAULT,
                        right: Dimensions.MARGIN_SIZE_DEFAULT,
                        bottom: Dimensions.MARGIN_SIZE_DEFAULT),
                    child: Stack(
                      children: [
                        TextFieldTitleWidget(
                          imageUrl: 'assets/doctor/Icon/card.png',
                          title: Strings.CARD_NUMBER,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: Dimensions.MARGIN_SIZE_LARGE),
                          child: CustomTextField(
                            hintTxt: Strings.ENTER_CARD_NUMBER,
                            textInputType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            focusNode: _cardNode,
                            nextNode: _expireNode,
                            isPhoneNumber: true,
                            controller: _cardController,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Row(
                      children: [
                        // for Expire Date
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                                left: Dimensions.MARGIN_SIZE_DEFAULT,
                                right: Dimensions.MARGIN_SIZE_DEFAULT,
                                bottom: Dimensions.MARGIN_SIZE_DEFAULT),
                            child: Stack(
                              children: [
                                TextFieldTitleWidget(
                                  imageUrl: 'assets/doctor/Icon/time.png',
                                  title: Strings.EXPIRE_DATE,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: Dimensions.MARGIN_SIZE_LARGE),
                                  child: CustomTextField(
                                    hintTxt: Strings.DD_MM_YYYY,
                                    textInputType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    focusNode: _expireNode,
                                    nextNode: _cvvNode,
                                    isPhoneNumber: true,
                                    controller: _expireController,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // for CVV Number
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                                left: Dimensions.MARGIN_SIZE_DEFAULT,
                                right: Dimensions.MARGIN_SIZE_DEFAULT,
                                bottom: Dimensions.MARGIN_SIZE_DEFAULT),
                            child: Stack(
                              children: [
                                TextFieldTitleWidget(
                                  imageUrl: 'assets/doctor/Icon/card.png',
                                  title: Strings.CVV,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: Dimensions.MARGIN_SIZE_LARGE),
                                  child: CustomTextField(
                                    hintTxt: Strings.ENTER_CVV_NUMBER,
                                    textInputType: TextInputType.number,
                                    textInputAction: TextInputAction.done,
                                    focusNode: _cvvNode,
                                    isPhoneNumber: true,
                                    controller: _cvvController,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: CustomButton(
                btnTxt: Strings.CONFIRM_APPOINTMENT,
                onTap: () {
                  pushNewScreen(
                    context,
                    screen: OnlineAppointmentsScreen(),
                    withNavBar: false, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
