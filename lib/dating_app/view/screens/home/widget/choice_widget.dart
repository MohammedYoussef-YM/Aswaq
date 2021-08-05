import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/dating_app/provider/choice_provider.dart';
import 'package:flutter_ui_kit/dating_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/dating_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/dating_app/utility/strings.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';
import 'package:flutter_ui_kit/dating_app/view/widget/custom_button.dart';
import 'package:provider/provider.dart';

class ChoiceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Consumer<ChoiceProvider>(
          builder: (context, choiceProvider, child) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(child: Text(
                    Strings.select_your_interest_fields,
                    style: robotoRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE),
                  )),
                  SizedBox(height: 35),

                  // for gender
                  Text(Strings.select_gender, style: robotoRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL)),
                  Container(
                      height: 1,
                      margin: EdgeInsets.only(top: 4, bottom: Dimensions.PADDING_SIZE_DEFAULT),
                      width: MediaQuery.of(context).size.width,
                      color: ColorResources.COLOR_GREY_GONDOLA.withOpacity(.4)),
                  Container(
                    height: 40,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: choiceProvider.getAllGender.length,
                        itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                choiceProvider.changeGenderIndex(index);
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: Dimensions.PADDING_SIZE_DEFAULT),
                                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: choiceProvider.selectGenderIndex == index ? Colors.transparent : ColorResources.COLOR_GREY_GONDOLA),
                                    color: choiceProvider.selectGenderIndex == index ? ColorResources.COLOR_PRIMARY : Colors.transparent,
                                    borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_DEFAULT)),
                                child: Text(
                                  choiceProvider.getAllGender[index].title,
                                  style: robotoRegular.copyWith(
                                    color:
                                    choiceProvider.selectGenderIndex == index ? ColorResources.COLOR_WHITE : ColorResources.COLOR_GREY_GONDOLA,
                                  ),
                                ),
                              ),
                            )),
                  ),

                  // for body color
                  SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                  Text(Strings.select_body_color, style: robotoRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL)),
                  Container(
                      height: 1,
                      margin: EdgeInsets.only(top: 4, bottom: Dimensions.PADDING_SIZE_DEFAULT),
                      width: MediaQuery.of(context).size.width,
                      color: ColorResources.COLOR_GREY_GONDOLA.withOpacity(.4)),
                  Container(
                    height: 40,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: choiceProvider.getAllBodyColor.length,
                        itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                choiceProvider.changeBodyColorIndex(index);
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: Dimensions.PADDING_SIZE_DEFAULT),
                                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                            choiceProvider.selectBodyColorIndex == index ? Colors.transparent : ColorResources.COLOR_GREY_GONDOLA),
                                    color: choiceProvider.selectBodyColorIndex == index ? ColorResources.COLOR_PRIMARY : Colors.transparent,
                                    borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_DEFAULT)),
                                child: Text(
                                  choiceProvider.getAllBodyColor[index].title,
                                  style: robotoRegular.copyWith(
                                    color: choiceProvider.selectBodyColorIndex == index
                                        ? ColorResources.COLOR_WHITE
                                        : ColorResources.COLOR_GREY_GONDOLA,
                                  ),
                                ),
                              ),
                            )),
                  ),

                  // for Region
                  SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                  Text(Strings.select_region, style: robotoRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL)),
                  Container(
                      height: 1,
                      margin: EdgeInsets.only(top: 4, bottom: Dimensions.PADDING_SIZE_DEFAULT),
                      width: MediaQuery.of(context).size.width,
                      color: ColorResources.COLOR_GREY_GONDOLA.withOpacity(.4)),
                  Container(
                    height: 40,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: choiceProvider.getAllRegion.length,
                        itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                choiceProvider.changeRegionIndex(index);
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: Dimensions.PADDING_SIZE_DEFAULT),
                                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: choiceProvider.selectRegionIndex == index ? Colors.transparent : ColorResources.COLOR_GREY_GONDOLA),
                                    color: choiceProvider.selectRegionIndex == index ? ColorResources.COLOR_PRIMARY : Colors.transparent,
                                    borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_DEFAULT)),
                                child: Text(
                                  choiceProvider.getAllRegion[index].title,
                                  style: robotoRegular.copyWith(
                                    color:
                                    choiceProvider.selectRegionIndex == index ? ColorResources.COLOR_WHITE : ColorResources.COLOR_GREY_GONDOLA,
                                  ),
                                ),
                              ),
                            )),
                  ),

                  // for Height
                  SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                  Text(Strings.select_height, style: robotoRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL)),
                  Container(
                      height: 1,
                      margin: EdgeInsets.only(top: 4, bottom: Dimensions.PADDING_SIZE_DEFAULT),
                      width: MediaQuery.of(context).size.width,
                      color: ColorResources.COLOR_GREY_GONDOLA.withOpacity(.4)),
                  Container(
                    height: 40,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: choiceProvider.getAllHeight.length,
                        itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                choiceProvider.changeHeightIndex(index);
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: Dimensions.PADDING_SIZE_DEFAULT),
                                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: choiceProvider.selectHeightIndex == index ? Colors.transparent : ColorResources.COLOR_GREY_GONDOLA),
                                    color: choiceProvider.selectHeightIndex == index ? ColorResources.COLOR_PRIMARY : Colors.transparent,
                                    borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_DEFAULT)),
                                child: Text(
                                  choiceProvider.getAllHeight[index].title,
                                  style: robotoRegular.copyWith(
                                    color:
                                    choiceProvider.selectHeightIndex == index ? ColorResources.COLOR_WHITE : ColorResources.COLOR_GREY_GONDOLA,
                                  ),
                                ),
                              ),
                            )),
                  ),

                  // for Height
                  SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                  Text(Strings.select_age, style: robotoRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL)),
                  Container(
                      height: 1,
                      margin: EdgeInsets.only(top: 4, bottom: Dimensions.PADDING_SIZE_DEFAULT),
                      width: MediaQuery.of(context).size.width,
                      color: ColorResources.COLOR_GREY_GONDOLA.withOpacity(.4)),
                  Container(
                    height: 40,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: choiceProvider.getAllAge.length,
                        itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                choiceProvider.changeAgeIndex(index);
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: Dimensions.PADDING_SIZE_DEFAULT),
                                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: choiceProvider.selectAgeIndex == index ? Colors.transparent : ColorResources.COLOR_GREY_GONDOLA),
                                    color: choiceProvider.selectAgeIndex == index ? ColorResources.COLOR_PRIMARY : Colors.transparent,
                                    borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_DEFAULT)),
                                child: Text(
                                  choiceProvider.getAllAge[index].title,
                                  style: robotoRegular.copyWith(
                                    color: choiceProvider.selectAgeIndex == index ? ColorResources.COLOR_WHITE : ColorResources.COLOR_GREY_GONDOLA,
                                  ),
                                ),
                              ),
                            )),
                  ),

                  SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                  choiceProvider.isSelectChoice()
                      ? Container(
                          margin: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE),
                          padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                          child: CustomButton(
                            btnTxt: Strings.save,
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              )),
    );
  }
}
