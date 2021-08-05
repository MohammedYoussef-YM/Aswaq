import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/dating_app/provider/dating_app_home_provider.dart';
import 'package:flutter_ui_kit/dating_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/dating_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/dating_app/utility/strings.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';
import 'package:flutter_ui_kit/dating_app/view/widget/custom_button.dart';
import 'package:flutter_ui_kit/dating_app/view/widget/custom_text_field.dart';
import 'package:provider/provider.dart';

class LocationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
              child: Text(
            Strings.select_location,
            style: robotoRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE),
          )),
          SizedBox(height: 20),
          CustomTextField(
            hintText: Strings.search_here,
            inputAction: TextInputAction.search,
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
          Text(
            Strings.recent_place,
            style: robotoLight.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
          SizedBox(
            height: 200,
            child: Consumer<DatingAppHomeProvider>(
              builder: (context, homeProvider, child) => ListView.builder(
                physics: BouncingScrollPhysics(),
                  itemCount: homeProvider.getAllLocation.length,
                  itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          homeProvider.changeLocation(index);
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL),
                          padding: EdgeInsets.only(
                            left: index==homeProvider.selectLocationIndex?Dimensions.PADDING_SIZE_SMALL:0,
                            top: Dimensions.PADDING_SIZE_SMALL,
                            bottom: Dimensions.PADDING_SIZE_SMALL,
                          ),
                          decoration: BoxDecoration(
                              color: index == homeProvider.selectLocationIndex ? ColorResources.COLOR_PRIMARY : Colors.transparent,
                              borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_SMALL)),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/dating_app/icon/clock.png',
                                width: 18,
                                height: 18,
                                color: index == homeProvider.selectLocationIndex ? ColorResources.COLOR_WHITE : ColorResources.COLOR_GREY_GONDOLA,
                              ),
                              SizedBox(width: Dimensions.PADDING_SIZE_LARGE),
                              Text(
                                homeProvider.getAllLocation[index],
                                style: robotoRegular.copyWith(
                                  color: index == homeProvider.selectLocationIndex ? ColorResources.COLOR_WHITE : ColorResources.COLOR_GREY_GONDOLA,
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT),
            child: CustomButton(
              btnTxt: Strings.save,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
