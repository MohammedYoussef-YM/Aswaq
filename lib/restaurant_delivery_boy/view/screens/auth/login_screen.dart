import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/provider/auth_provider.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/images.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/view/base/custom_button.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/view/base/custom_text_field.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/view/screens/dashboard/dashboard_screen.dart';
import 'package:provider/provider.dart';

class RestaurantDeliveryBoyLoginScreen extends StatefulWidget {
  @override
  _RestaurantDeliveryBoyLoginScreenState createState() => _RestaurantDeliveryBoyLoginScreenState();
}

class _RestaurantDeliveryBoyLoginScreenState extends State<RestaurantDeliveryBoyLoginScreen> {
  FocusNode _emailFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();
  TextEditingController _emailController;
  TextEditingController _passwordController;
  GlobalKey<FormState> _formKeyLogin;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _formKeyLogin = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    //
    // _emailController.text = Provider.of<RestaurantDeliveryBoyAuthProvider>(context, listen: false).getUserEmail() ?? null;
    // _passwordController.text = Provider.of<RestaurantDeliveryBoyAuthProvider>(context, listen: false).getUserPassword() ?? null;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(RestaurantDeliveryBoyDimensions.PADDING_SIZE_LARGE),
        child: Consumer<RestaurantDeliveryBoyAuthProvider>(
          builder: (context, authProvider, child) => Form(
            key: _formKeyLogin,
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                //SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(
                    RestaurantDeliveryBoyImages.efood_bike_with_person,
                    height: MediaQuery.of(context).size.height / 4.5,
                    fit: BoxFit.scaleDown,)
                ),
                //SizedBox(height: 20),
                Center(
                    child: Text(
                  getTranslated('login', context),
                  style: Theme.of(context).textTheme.headline3.copyWith(fontSize: 24, color: Theme.of(context).hintColor),
                )),
                SizedBox(height: 35),
                Text(
                  getTranslated('email_address', context),
                  style: Theme.of(context).textTheme.headline2.copyWith(color: Theme.of(context).accentColor),
                ),
                SizedBox(height: RestaurantDeliveryBoyDimensions.PADDING_SIZE_SMALL),
                CustomTextField(
                  hintText: getTranslated('demo_gmail', context),
                  isShowBorder: true,
                  focusNode: _emailFocus,
                  nextFocus: _passwordFocus,
                  controller: _emailController,
                  inputType: TextInputType.emailAddress,
                ),
                SizedBox(height: RestaurantDeliveryBoyDimensions.PADDING_SIZE_LARGE),
                Text(
                  getTranslated('password', context),
                  style: Theme.of(context).textTheme.headline2.copyWith(color: Theme.of(context).accentColor),
                ),
                SizedBox(height: RestaurantDeliveryBoyDimensions.PADDING_SIZE_SMALL),
                CustomTextField(
                  hintText: getTranslated('password_hint', context),
                  isShowBorder: true,
                  isPassword: true,
                  isShowSuffixIcon: true,
                  focusNode: _passwordFocus,
                  controller: _passwordController,
                  inputAction: TextInputAction.done,
                ),
                SizedBox(height: 22),

                // for remember me section
                Consumer<RestaurantDeliveryBoyAuthProvider>(
                    builder: (context, authProvider, child) => InkWell(
                          onTap: () {
                            authProvider.toggleRememberMe();
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 18,
                                height: 18,
                                decoration: BoxDecoration(
                                    color: authProvider.isActiveRememberMe
                                        ? Theme.of(context).primaryColor
                                        : RestaurantDeliveryBoyColorResources.COLOR_WHITE,
                                    border: Border.all(color: authProvider.isActiveRememberMe ? Colors.transparent : Theme.of(context).accentColor),
                                    borderRadius: BorderRadius.circular(3)),
                                child: authProvider.isActiveRememberMe
                                    ? Icon(Icons.done, color: RestaurantDeliveryBoyColorResources.COLOR_WHITE, size: 17)
                                    : SizedBox.shrink(),
                              ),
                              SizedBox(width: RestaurantDeliveryBoyDimensions.PADDING_SIZE_SMALL),
                              Text(
                                getTranslated('remember_me', context),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    .copyWith(fontSize: RestaurantDeliveryBoyDimensions.FONT_SIZE_EXTRA_SMALL, color: Theme.of(context).accentColor),
                              )
                            ],
                          ),
                        )),

                // for login button
                SizedBox(height: 10),
                CustomButton(
                  btnTxt: getTranslated('login', context),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => RestaurantDeliveryBoyDashboardScreen()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
