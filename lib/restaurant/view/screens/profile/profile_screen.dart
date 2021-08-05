import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/userinfo_model.dart';
import 'package:flutter_ui_kit/restaurant/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant/provider/profile_provider.dart';
import 'package:flutter_ui_kit/restaurant/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant/utill/images.dart';
import 'package:flutter_ui_kit/restaurant/utill/styles.dart';
import 'package:flutter_ui_kit/restaurant/view/base/custom_app_bar.dart';
import 'package:flutter_ui_kit/restaurant/view/base/custom_button.dart';
import 'package:flutter_ui_kit/restaurant/view/base/custom_text_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class RestProfileScreen extends StatefulWidget {
  @override
  _RestProfileScreenState createState() => _RestProfileScreenState();
}

class _RestProfileScreenState extends State<RestProfileScreen> {
  FocusNode _firstNameFocus;
  FocusNode _lastNameFocus;
  FocusNode _emailFocus;
  FocusNode _phoneNumberFocus;
  TextEditingController _firstNameController;
  TextEditingController _lastNameController;
  TextEditingController _emailController;
  TextEditingController _phoneNumberController;
  File file;
  final picker = ImagePicker();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _choose() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery, imageQuality: 50, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (pickedFile != null) {
        file = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstNameFocus = FocusNode();
    _lastNameFocus = FocusNode();
    _emailFocus = FocusNode();
    _phoneNumberFocus = FocusNode();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneNumberController = TextEditingController();

    if (Provider.of<RestProfileProvider>(context, listen: false).userInfoModel != null) {
      UserInfoModel _userInfoModel = Provider.of<RestProfileProvider>(context, listen: false).userInfoModel;
      _firstNameController.text = _userInfoModel.fName ?? '';
      _lastNameController.text = _userInfoModel.lName ?? '';
      _phoneNumberController.text = _userInfoModel.phone ?? '';
      _emailController.text = _userInfoModel.email ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(title: getTranslated('my_profile', context)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            // for profile image
            Consumer<RestProfileProvider>(
                builder: (context, profileProvider, child) => Container(
                      margin: EdgeInsets.only(top: 42, bottom: 24),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ColorResources.BORDER_COLOR,
                        border: Border.all(color: ColorResources.COLOR_GREY_CHATEAU, width: 3),
                        shape: BoxShape.circle,
                      ),
                      child: InkWell(
                        onTap: _choose,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: file == null
                                  ? FadeInImage.assetNetwork(
                                  placeholder: Images.placeholder,
                                  image: profileProvider.userInfoModel.image,
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover)
                                  : Image.file(file, width: 80, height: 80, fit: BoxFit.fill),
                            ),
                            Positioned(
                              bottom: 15,
                              right: -10,
                              child: Image.asset(Images.edit),
                            ),
                          ],
                        ),
                      ),
                    )),

            // for name
            Consumer<RestProfileProvider>(
              builder: (context, profileProvider, child) => Center(
                  child: Text(
                '${profileProvider.userInfoModel.fName} ${profileProvider.userInfoModel.lName}',
                style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE),
              )),
            ),

            SizedBox(height: 28),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // for first name section
                  Text(
                    getTranslated('first_name', context),
                    style: Theme.of(context).textTheme.headline2.copyWith(color: ColorResources.getHintColor(context)),
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                  CustomTextField(
                    hintText: 'John',
                    isShowBorder: true,
                    controller: _firstNameController,
                    focusNode: _firstNameFocus,
                    nextFocus: _lastNameFocus,
                    inputType: TextInputType.name,
                    capitalization: TextCapitalization.words,
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                  // for last name section
                  Text(
                    getTranslated('last_name', context),
                    style: Theme.of(context).textTheme.headline2.copyWith(color: ColorResources.getHintColor(context)),
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                  CustomTextField(
                    hintText: 'Doe',
                    isShowBorder: true,
                    controller: _lastNameController,
                    focusNode: _lastNameFocus,
                    nextFocus: _emailFocus,
                    inputType: TextInputType.name,
                    capitalization: TextCapitalization.words,
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                  // for email section
                  Text(
                    getTranslated('email', context),
                    style: Theme.of(context).textTheme.headline2.copyWith(color: ColorResources.getHintColor(context)),
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                  CustomTextField(
                    hintText: getTranslated('demo_gmail', context),
                    isShowBorder: true,
                    controller: _emailController,
                    isEnabled: false,
                    focusNode: _emailFocus,
                    nextFocus: _phoneNumberFocus,

                    inputType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                  // for phone Number section
                  Text(
                    getTranslated('mobile_number', context),
                    style: Theme.of(context).textTheme.headline2.copyWith(color: ColorResources.getHintColor(context)),
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                  CustomTextField(
                    hintText: getTranslated('number_hint', context),
                    isShowBorder: true,
                    controller: _phoneNumberController,
                    focusNode: _phoneNumberFocus,
                    inputType: TextInputType.phone,
                    inputAction: TextInputAction.done,
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                ],
              ),
            ),

            !Provider.of<RestProfileProvider>(context).isLoading
                ? CustomButton(
                    btnTxt: getTranslated('update_profile', context),
                    onTap: () async {
                      if (Provider.of<RestProfileProvider>(context, listen: false).userInfoModel.fName == _firstNameController.text &&
                          Provider.of<RestProfileProvider>(context, listen: false).userInfoModel.lName == _lastNameController.text &&
                          Provider.of<RestProfileProvider>(context, listen: false).userInfoModel.phone == _phoneNumberController.text &&
                          Provider.of<RestProfileProvider>(context, listen: false).userInfoModel.email == _emailController.text &&
                          file == null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Change something to update'), backgroundColor: ColorResources.COLOR_PRIMARY));
                      } else {
                        UserInfoModel updateUserInfoModel = Provider.of<RestProfileProvider>(context, listen: false).userInfoModel;
                        updateUserInfoModel.fName = _firstNameController.text ?? "";
                        updateUserInfoModel.lName = _lastNameController.text ?? "";
                        updateUserInfoModel.phone = _phoneNumberController.text ?? '';

                        Provider.of<RestProfileProvider>(context, listen: false).getUserInfo();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Updated Successfully'), backgroundColor: Colors.green));
                        setState(() {});
                      }
                    },
                  )
                : Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(ColorResources.COLOR_PRIMARY))),
          ],
        ),
      ),
    );
  }
}
