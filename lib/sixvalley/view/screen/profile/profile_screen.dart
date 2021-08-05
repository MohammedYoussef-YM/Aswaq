import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/user_info_model.dart';
import 'package:flutter_ui_kit/sixvalley/helper/network_info.dart';
import 'package:flutter_ui_kit/sixvalley/localization/language_constrants.dart';
import 'package:flutter_ui_kit/sixvalley/provider/profile_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/theme_provider.dart';
import 'package:flutter_ui_kit/sixvalley/utill/color_resources.dart';
import 'package:flutter_ui_kit/sixvalley/utill/custom_themes.dart';
import 'package:flutter_ui_kit/sixvalley/utill/dimensions.dart';
import 'package:flutter_ui_kit/sixvalley/utill/images.dart';
import 'package:flutter_ui_kit/sixvalley/view/basewidget/button/custom_button.dart';
import 'package:flutter_ui_kit/sixvalley/view/basewidget/textfield/custom_password_textfield.dart';
import 'package:flutter_ui_kit/sixvalley/view/basewidget/textfield/custom_textfield.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/profile/address_list_screen.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/profile/widget/add_address_bottom_sheet.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class SixProfileScreen extends StatefulWidget {
  @override
  _SixProfileScreenState createState() => _SixProfileScreenState();
}

class _SixProfileScreenState extends State<SixProfileScreen> {
  final FocusNode _fNameFocus = FocusNode();
  final FocusNode _lNameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _addressFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

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

  _updateUserAccount() async {
    if(Provider.of<SixProfileProvider>(context, listen: false).userInfoModel.fName == _firstNameController.text
        && Provider.of<SixProfileProvider>(context, listen: false).userInfoModel.lName == _lastNameController.text
        && Provider.of<SixProfileProvider>(context, listen: false).userInfoModel.phone == _phoneController.text && file == null
        && _passwordController.text.isEmpty && _confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Change something to update'), backgroundColor: ColorResources.RED));
    }else if((_passwordController.text.isNotEmpty && _passwordController.text.length < 6) || (_confirmPasswordController.text.isNotEmpty && _confirmPasswordController.text.length < 6)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password should be getter than 6'), backgroundColor: ColorResources.RED));
    }else if(_confirmPasswordController.text.isNotEmpty && _passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password does not matched'), backgroundColor: ColorResources.RED));
    }else {
      UserInfoModel updateUserInfoModel = Provider.of<SixProfileProvider>(context, listen: false).userInfoModel;
      updateUserInfoModel.method = 'put';
      updateUserInfoModel.fName = _firstNameController.text ?? "";
      updateUserInfoModel.lName = _lastNameController.text ?? "";
      updateUserInfoModel.phone = _phoneController.text ?? '';

      await Provider.of<SixProfileProvider>(context, listen: false).updateUserInfo(updateUserInfoModel);
      Provider.of<SixProfileProvider>(context, listen: false).getUserInfo();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Updated Successfully'), backgroundColor: ColorResources.GREEN));
      _passwordController.clear();
      _confirmPasswordController.clear();
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    Provider.of<SixProfileProvider>(context, listen: false).initAddressTypeList();
    Provider.of<SixProfileProvider>(context, listen: false).initAddressList();
    Provider.of<SixProfileProvider>(context, listen: false).getUserInfo();
    NetworkInfo.checkConnectivity(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Consumer<SixProfileProvider>(
              builder: (context, profile, child) {
                _firstNameController.text = profile.userInfoModel.fName;
                _lastNameController.text = profile.userInfoModel.lName;
                _emailController.text = profile.userInfoModel.email;
                _phoneController.text = profile.userInfoModel.phone;

                return Stack(
                  clipBehavior: Clip.none,
                  children: [

                    Image.asset(
                      Images.toolbar_background, fit: BoxFit.fill, height: 500,
                      color: Provider.of<SixThemeProvider>(context).darkTheme ? Colors.black : null,
                    ),

                    Container(
                      padding: EdgeInsets.only(top: 35, left: 15),
                      child: Row(children: [
                        CupertinoNavigationBarBackButton(
                          onPressed: () => Navigator.of(context).pop(),
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Text(getTranslated('PROFILE', context), style: titilliumRegular.copyWith(fontSize: 20, color: Colors.white), maxLines: 1, overflow: TextOverflow.ellipsis),
                      ]),
                    ),

                    Container(
                      padding: EdgeInsets.only(top: 55),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: Dimensions.MARGIN_SIZE_EXTRA_LARGE),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).accentColor,
                                  border: Border.all(color: Colors.white, width: 3),
                                  shape: BoxShape.circle,
                                ),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: file == null
                                          ? FadeInImage.assetNetwork(
                                        placeholder: Images.placeholder_image,
                                        image: profile.userInfoModel.image,
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ) : Image.file(file, width: 100, height: 100, fit: BoxFit.fill),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: -10,
                                      child: CircleAvatar(
                                        backgroundColor: ColorResources.LIGHT_SKY_BLUE,
                                        radius: 14,
                                        child: IconButton(
                                          onPressed: _choose,
                                          padding: EdgeInsets.all(0),
                                          icon: Icon(Icons.edit, color: ColorResources.WHITE, size: 18),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                '${profile.userInfoModel.fName} ${profile.userInfoModel.lName}',
                                style: titilliumSemiBold.copyWith(color: ColorResources.WHITE, fontSize: 20.0),
                              )
                            ],
                          ),

                          SizedBox(height: Dimensions.MARGIN_SIZE_DEFAULT),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: ColorResources.getIconBg(context),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(Dimensions.MARGIN_SIZE_DEFAULT),
                                    topRight: Radius.circular(Dimensions.MARGIN_SIZE_DEFAULT),
                                  )),
                              child: ListView(
                                physics: BouncingScrollPhysics(),
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT, right: Dimensions.MARGIN_SIZE_DEFAULT),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.person, color: ColorResources.getLightSkyBlue(context), size: 20),
                                                SizedBox(width: Dimensions.MARGIN_SIZE_EXTRA_SMALL),
                                                Text(getTranslated('FIRST_NAME', context), style: titilliumRegular)
                                              ],
                                            ),
                                            SizedBox(height: Dimensions.MARGIN_SIZE_SMALL),
                                            CustomTextField(
                                              textInputType: TextInputType.name,
                                              focusNode: _fNameFocus,
                                              nextNode: _lNameFocus,
                                              hintText: profile.userInfoModel.fName ?? '',
                                              controller: _firstNameController,
                                            ),
                                          ],
                                        )),
                                        SizedBox(width: 15),
                                        Expanded(
                                            child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.person, color: ColorResources.getLightSkyBlue(context), size: 20),
                                                SizedBox(width: Dimensions.MARGIN_SIZE_EXTRA_SMALL),
                                                Text(getTranslated('LAST_NAME', context), style: titilliumRegular)
                                              ],
                                            ),
                                            SizedBox(height: Dimensions.MARGIN_SIZE_SMALL),
                                            CustomTextField(
                                              textInputType: TextInputType.name,
                                              focusNode: _lNameFocus,
                                              nextNode: _emailFocus,
                                              hintText: profile.userInfoModel.lName,
                                              controller: _lastNameController,
                                            ),
                                          ],
                                        )),
                                      ],
                                    ),
                                  ),

                                  // for Email
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: Dimensions.MARGIN_SIZE_SMALL,
                                        left: Dimensions.MARGIN_SIZE_DEFAULT,
                                        right: Dimensions.MARGIN_SIZE_DEFAULT),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.alternate_email, color: ColorResources.getLightSkyBlue(context), size: 20),
                                            SizedBox(
                                              width: Dimensions.MARGIN_SIZE_EXTRA_SMALL,
                                            ),
                                            Text(getTranslated('EMAIL', context), style: titilliumRegular)
                                          ],
                                        ),
                                        SizedBox(height: Dimensions.MARGIN_SIZE_SMALL),
                                        CustomTextField(
                                          textInputType: TextInputType.emailAddress,
                                          focusNode: _emailFocus,
                                          nextNode: _phoneFocus,
                                          hintText: profile.userInfoModel.email ?? '',
                                          controller: _emailController,
                                        ),
                                      ],
                                    ),
                                  ),

                                  // for Phone No
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: Dimensions.MARGIN_SIZE_SMALL,
                                        left: Dimensions.MARGIN_SIZE_DEFAULT,
                                        right: Dimensions.MARGIN_SIZE_DEFAULT),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.dialpad, color: ColorResources.getLightSkyBlue(context), size: 20),
                                            SizedBox(width: Dimensions.MARGIN_SIZE_EXTRA_SMALL),
                                            Text(getTranslated('PHONE_NO', context), style: titilliumRegular)
                                          ],
                                        ),
                                        SizedBox(height: Dimensions.MARGIN_SIZE_SMALL),
                                        CustomTextField(
                                          textInputType: TextInputType.number,
                                          focusNode: _phoneFocus,
                                          hintText: profile.userInfoModel.phone ?? "",
                                          nextNode: _addressFocus,
                                          controller: _phoneController,
                                          isPhoneNumber: true,
                                        ),
                                      ],
                                    ),
                                  ),

                                  // for Address
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: Dimensions.MARGIN_SIZE_SMALL,
                                        left: Dimensions.MARGIN_SIZE_DEFAULT,
                                        right: Dimensions.MARGIN_SIZE_DEFAULT),
                                    child: Column(
                                      children: [
                                        Consumer<SixProfileProvider>(
                                          builder: (context, profileProvider, child) => Row(
                                            children: [
                                              IconButton(
                                                  padding: EdgeInsets.all(0),
                                                  icon: Icon(Icons.home,
                                                      color:
                                                          profileProvider.isHomeAddress ? Theme.of(context).primaryColor : ColorResources.getColombiaBlue(context),
                                                      size: 35),
                                                  onPressed: () {
                                                    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddAddressScreen(userInfoModel)));
                                                    //profileProvider.updateAddressCondition(true);
                                                    profileProvider.updateAddressCondition(true);
                                                  }),
                                              SizedBox(width: Dimensions.MARGIN_SIZE_LARGE),
                                              GestureDetector(
                                                onTap: () {
                                                  profileProvider.updateAddressCondition(false);
                                                },
                                                child: Image.asset(
                                                  Images.bag,
                                                  width: 30,
                                                  height: 30,
                                                  color: !profileProvider.isHomeAddress ? Theme.of(context).primaryColor : ColorResources.getColombiaBlue(context),
                                                ),
                                              ),
                                              SizedBox(width: Dimensions.MARGIN_SIZE_LARGE),
                                              Container(
                                                width: 25,
                                                height: 25,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: ColorResources.WHITE,
                                                  shape: BoxShape.circle,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey.withOpacity(0.2),
                                                      spreadRadius: 1,
                                                      blurRadius: 7,
                                                      offset: Offset(0, 1), // changes position of shadow
                                                    )
                                                  ],
                                                ),
                                                child: IconButton(
                                                  padding: EdgeInsets.all(0),
                                                  onPressed: () {
                                                    showModalBottomSheet(
                                                      context: context,
                                                      isScrollControlled: true,
                                                      builder: (context) => AddAddressBottomSheet(),
                                                    );
                                                  },
                                                  icon: Icon(Icons.add, color: ColorResources.getColombiaBlue(context), size: 20),
                                                ),
                                              ),
                                              SizedBox(width: Dimensions.MARGIN_SIZE_LARGE),
                                              Container(
                                                width: 25,
                                                height: 25,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: ColorResources.WHITE,
                                                  shape: BoxShape.circle,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey.withOpacity(0.2),
                                                      spreadRadius: 1,
                                                      blurRadius: 7,
                                                      offset: Offset(0, 1), // changes position of shadow
                                                    )
                                                  ],
                                                ),
                                                child: IconButton(
                                                  padding: EdgeInsets.all(0),
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .push(MaterialPageRoute(builder: (context) => AddressListScreen(profile.userInfoModel)));
                                                  },
                                                  icon: Icon(Icons.done_all, color: ColorResources.getColombiaBlue(context), size: 18),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: Dimensions.MARGIN_SIZE_SMALL),
                                        Consumer<SixProfileProvider>(
                                          builder: (context, profileProvider, child) => Container(
                                            width: double.infinity,
                                            height: 45,
                                            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15),
                                            decoration: BoxDecoration(
                                              color: Theme.of(context).accentColor,
                                              borderRadius: BorderRadius.circular(6),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.withOpacity(0.2),
                                                  spreadRadius: 1,
                                                  blurRadius: 7,
                                                  offset: Offset(0, 1), // changes position of shadow
                                                )
                                              ],
                                            ),
                                            child: Text(
                                                profileProvider.isHomeAddress
                                                    ? profileProvider.getHomeAddress()
                                                    : profileProvider.getOfficeAddress() ?? getTranslated('ADDRESS_NOT_FOUND', context),
                                                textAlign: TextAlign.left),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // for Password
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: Dimensions.MARGIN_SIZE_SMALL,
                                        left: Dimensions.MARGIN_SIZE_DEFAULT,
                                        right: Dimensions.MARGIN_SIZE_DEFAULT),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.lock_open, color: ColorResources.getPrimary(context), size: 20),
                                            SizedBox(width: Dimensions.MARGIN_SIZE_EXTRA_SMALL),
                                            Text(getTranslated('PASSWORD', context), style: titilliumRegular)
                                          ],
                                        ),
                                        SizedBox(height: Dimensions.MARGIN_SIZE_SMALL),
                                        CustomPasswordTextField(
                                          controller: _passwordController,
                                          focusNode: _passwordFocus,
                                          nextNode: _confirmPasswordFocus,
                                          textInputAction: TextInputAction.next,
                                        ),
                                      ],
                                    ),
                                  ),

                                  // for  re-enter Password
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: Dimensions.MARGIN_SIZE_SMALL,
                                        left: Dimensions.MARGIN_SIZE_DEFAULT,
                                        right: Dimensions.MARGIN_SIZE_DEFAULT),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.lock_open, color: ColorResources.getPrimary(context), size: 20),
                                            SizedBox(width: Dimensions.MARGIN_SIZE_EXTRA_SMALL),
                                            Text(getTranslated('RE_ENTER_PASSWORD', context), style: titilliumRegular)
                                          ],
                                        ),
                                        SizedBox(height: Dimensions.MARGIN_SIZE_SMALL),
                                        CustomPasswordTextField(
                                          controller: _confirmPasswordController,
                                          focusNode: _confirmPasswordFocus,
                                          textInputAction: TextInputAction.done,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: Dimensions.MARGIN_SIZE_LARGE, vertical: Dimensions.MARGIN_SIZE_SMALL),
                            child: !Provider.of<SixProfileProvider>(context).isLoading
                                ? CustomButton(onTap: _updateUserAccount, buttonText: getTranslated('UPDATE_ACCOUNT', context))
                                : Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor))),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}
