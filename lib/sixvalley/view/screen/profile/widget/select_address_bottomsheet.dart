import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/address_model.dart';
import 'package:flutter_ui_kit/sixvalley/localization/language_constrants.dart';
import 'package:flutter_ui_kit/sixvalley/provider/profile_provider.dart';
import 'package:flutter_ui_kit/sixvalley/utill/color_resources.dart';
import 'package:flutter_ui_kit/sixvalley/utill/custom_themes.dart';
import 'package:flutter_ui_kit/sixvalley/utill/dimensions.dart';
import 'package:flutter_ui_kit/sixvalley/utill/images.dart';
import 'package:flutter_ui_kit/sixvalley/view/basewidget/button/custom_button.dart';
import 'package:provider/provider.dart';

void addressBottomSheet(AddressModel userInfoModel, BuildContext context,Function feedbackMessage) {
  showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),topRight: Radius.circular(10.0)),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.only(
            left: Dimensions.PADDING_SIZE_DEFAULT,
            right: Dimensions.PADDING_SIZE_DEFAULT,
            bottom: Dimensions.PADDING_SIZE_DEFAULT,
          ),
          child: Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                      width: 22,
                      margin: EdgeInsets.only(top: Dimensions.MARGIN_SIZE_DEFAULT,bottom: Dimensions.MARGIN_SIZE_DEFAULT),
                      height: 22,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).accentColor,
                        boxShadow: [
                          BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 7, offset: Offset(0, 1)), // changes position of shadow
                        ],
                      ),
                      child: IconButton(
                        padding: EdgeInsets.all(0),
                        icon: Icon(
                          Icons.clear,
                          size: 18,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(0),
                  ),
                  onPressed: (){
                    Provider.of<SixProfileProvider>(context,listen: false).setHomeAddress();
                  },
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                      left: Dimensions.PADDING_SIZE_DEFAULT,
                      right: Dimensions.PADDING_SIZE_DEFAULT,
                      bottom: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                      top: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                    ),
                    decoration: BoxDecoration(
                        color: Provider.of<SixProfileProvider>(context).checkHomeAddress?Theme.of(context).primaryColor:ColorResources.getHomeBg(context),
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Provider.of<SixProfileProvider>(context).checkHomeAddress?
                        ColorResources.getColombiaBlue(context):Colors.transparent,width: 2.0)
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/home.png',
                          width: 20,
                          height: 20,
                          color: ColorResources.getColombiaBlue(context) ,
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${userInfoModel.zip} ${userInfoModel.address}',style: titilliumSemiBold),
                              Text('${userInfoModel.phone}',style: titilliumRegular),
                            ],
                          ),
                        ),
                        Image.asset(
                          Images.edit,
                          width: 20,
                          height: 20,
                          color: Theme.of(context).hintColor,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(0),
                  ),
                  onPressed: (){
                    Provider.of<SixProfileProvider>(context,listen: false).setOfficeAddress();
                  },

                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                      left: Dimensions.PADDING_SIZE_DEFAULT,
                      right: Dimensions.PADDING_SIZE_DEFAULT,
                      bottom: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                      top: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                    ),
                    decoration: BoxDecoration(
                        color: Provider.of<SixProfileProvider>(context).checkOfficeAddress?ColorResources.colorMap[50]:ColorResources.getHomeBg(context),
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Provider.of<SixProfileProvider>(context).checkOfficeAddress?
                        ColorResources.getColombiaBlue(context):Colors.transparent,width: 2.0)
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/bag.png',
                          width: 20,
                          height: 20,
                          color: ColorResources.getColombiaBlue(context) ,
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${userInfoModel.zip} ${userInfoModel.address}',style: titilliumSemiBold),
                              Text('${userInfoModel.phone}',style: titilliumRegular),
                            ],
                          ),
                        ),
                        Image.asset(
                          Images.edit,
                          width: 20,
                          height: 20,
                          color: Theme.of(context).hintColor,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                CustomButton(
                  buttonText: getTranslated('SAVE_ADDRESS', context),
                  onTap: (){
                    if(Provider.of<SixProfileProvider>(context,listen: false).checkOfficeAddress){
                      String officeAddress = userInfoModel.zip + " " + userInfoModel.address;
                      Provider.of<SixProfileProvider>(context, listen: false).saveOfficeAddress(officeAddress);
                      Navigator.of(context).pop();
                    }else if(Provider.of<SixProfileProvider>(context,listen: false).checkHomeAddress){
                      String homeAddress = userInfoModel.zip + " " + userInfoModel.address;
                      Provider.of<SixProfileProvider>(context, listen: false).saveHomeAddress(homeAddress);
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            ),
          ),
        );
      });
}