import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/food/utility/dimensions.dart';
import 'package:flutter_ui_kit/main/data/all_widget_data.dart';
import 'package:flutter_ui_kit/main/data/app_data.dart';
import 'package:flutter_ui_kit/main/data/bottom_sheet_data.dart';
import 'package:flutter_ui_kit/main/data/login_data.dart';
import 'package:flutter_ui_kit/main/data/otp_data.dart';
import 'package:flutter_ui_kit/main/data/profile_data.dart';
import 'package:flutter_ui_kit/main/data/signup_data.dart';
import 'package:flutter_ui_kit/main/utils/custom_theme.dart';
import 'package:flutter_ui_kit/main/widget/all_screen.dart';
import 'package:flutter_ui_kit/main/widget/all_widgets.dart';
import 'package:flutter_ui_kit/main/widget/app_button.dart';
import 'package:flutter_ui_kit/main/widget/full_app.dart';
import 'package:flutter_ui_kit/main/widget/screen_widget.dart';
import 'package:flutter_ui_kit/main/widget/widget_button.dart';

class MainHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.fromLTRB(Dimensions.PADDING_SIZE_EXTRA_SMALL, 5, Dimensions.PADDING_SIZE_EXTRA_SMALL, Dimensions.PADDING_SIZE_EXTRA_SMALL),
          child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Popular App',style: poppinsMedium.copyWith(color: Color(0xff25282B),fontSize: 14),),
              InkWell(
                onTap: (){
                    //Provider.of<MainProvider>(context,listen: false).setIndex(1);
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Scaffold(
                      backgroundColor: Colors.white,
                      appBar: AppBar(title: Text('Full App',),backgroundColor: Color(0xff5050D5),),
                      body: SafeArea(child: FullAppScreen()))));
                    },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('View All',style: poppinsRegular.copyWith(color: Color(0xff5050D5),fontSize: 12),),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 200.0,
          child: ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) =>
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  height: 160,
                  width: 180,
                  child: AppButton(
                    title: AppData.getAppList()[index].title,
                    description: AppData.getAppList()[index].description,
                    screens: AppData.getAppList()[index].screens,
                    color: AppData.getAppList()[index].color,
                    widget: AppData.getAppList()[index].widget,
                    app: AppData.getAppList()[index].app,
                    icons: AppData.getAppList()[index].icons,
                    version: AppData.getAppList()[index].version,
                    isHome: AppData.getAppList()[index].isHome,
                ),
                ),
          ),
        ),

        SizedBox(height: 10),
        Padding(padding: EdgeInsets.fromLTRB(Dimensions.PADDING_SIZE_EXTRA_SMALL, 5, Dimensions.PADDING_SIZE_EXTRA_SMALL, Dimensions.PADDING_SIZE_EXTRA_SMALL),
          child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text('Top Screen',style: poppinsMedium.copyWith(color: Color(0xff25282B),fontSize: 14),),
              InkWell(
                onTap: (){
                  //Provider.of<MainProvider>(context,listen: false).setIndex(1);
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Scaffold(
                      backgroundColor:Colors.white,
                      appBar: AppBar(title: Text('Top Screens',),backgroundColor: Color(0xff5050D5),),
                      body: SafeArea(child: SingleChildScrollView(child: AllScreen())))));
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('View All',style: poppinsRegular.copyWith(color: Color(0xff5050D5),fontSize: 12),),
                ),
              ),
            ],
          ),
        ),

        SizedBox(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ScreenWidget(
                isHomeScreen: true,
                screenName: 'SignIn Screen',
                numberOfScreens: LoginData.getLoginList().length,
                screenListModel: LoginData.getLoginList(),
              ),
              ScreenWidget(
                isHomeScreen: true,
                screenName: 'SignUp Screen',
                numberOfScreens: SignUpData.getSignUpList().length,
                screenListModel: SignUpData.getSignUpList(),
              ),
              ScreenWidget(
                isHomeScreen: true,
                screenName: 'Profile Screen',
                numberOfScreens: ProfileData.getProfileList().length,
                screenListModel: ProfileData.getProfileList(),
              ),
              ScreenWidget(
                isHomeScreen: true,
                screenName: 'BottomSheet',
                numberOfScreens: BottomSheetData.getBottomSheetList(context).length,
                screenListModel: BottomSheetData.getBottomSheetList(context),
                isOpenModalButtonSheet: true,
              ),
              ScreenWidget(
                isHomeScreen: false,
                screenName: 'OTP Screen',
                numberOfScreens: OtpData.getLOtpList().length,
                screenListModel: OtpData.getLOtpList(),
              ),
            ],
          ),
        ),
        SizedBox(height: 10,),
        Padding( padding: EdgeInsets.fromLTRB(Dimensions.PADDING_SIZE_EXTRA_SMALL, 5, Dimensions.PADDING_SIZE_EXTRA_SMALL, Dimensions.PADDING_SIZE_EXTRA_SMALL),
          child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Top Widgets',style: poppinsMedium.copyWith(color: Color(0xff25282B),fontSize: 14),),
              InkWell(
                onTap: (){
                  //Provider.of<MainProvider>(context,listen: false).setIndex(1);
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Scaffold(
                      backgroundColor: Colors.white,
                      appBar: AppBar(title: Text('Top Widgets',),backgroundColor: Color(0xff5050D5),),
                      body: SafeArea(child: AllWidgets()))));
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('View All',style: poppinsRegular.copyWith(color: Color(0xff5050D5),fontSize: 12),),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 100,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 12,
              itemBuilder: (context,index){
                return WidgetButton(
                  widgetName: AllWidgetData.getAllWidgetList()[index].widgetName,
                  icon: AllWidgetData.getAllWidgetList()[index].icon,
                  iconColor: AllWidgetData.getAllWidgetList()[index].iconColor,
                  widgetData: AllWidgetData.getAllWidgetList()[index].widgetData,
                );
              },
            ),
          ),
        ),
        SizedBox(height: 10,),
      ],
    );
  }
}
