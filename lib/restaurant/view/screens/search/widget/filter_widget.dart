import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant/provider/category_provider.dart';
import 'package:flutter_ui_kit/restaurant/provider/search_provider.dart';
import 'package:flutter_ui_kit/restaurant/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant/utill/styles.dart';
import 'package:flutter_ui_kit/restaurant/view/base/custom_button.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/home/widget/category_view.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:provider/provider.dart';

class FilterWidget extends StatefulWidget {
  final Function onTap;
  FilterWidget({@required this.onTap});

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  double _lowerValue = 0;
  double _upperValue = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
      child: Consumer<RestSearchProvider>(
        builder: (context, searchProvider, child) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.close, size: 18, color: ColorResources.getGreyBunkerColor(context))),
                Expanded(
                  child: Text(
                    getTranslated('filter', context),
                    textAlign: TextAlign.center,
                    style:
                        Theme.of(context).textTheme.headline3.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE, color: ColorResources.getGreyBunkerColor(context)),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    searchProvider.setRating(-1);
                    Provider.of<RestCategoryProvider>(context, listen: false).updateSelectCategory(-1);
                    setState(() {
                      _lowerValue = 0;
                      _upperValue = 0;
                    });
                  },
                  child: Text(
                    getTranslated('reset', context),
                    style: Theme.of(context).textTheme.headline2.copyWith(color: Theme.of(context).primaryColor),
                  ),
                )
              ],
            ),

            Text(
              getTranslated('price', context),
              style: Theme.of(context).textTheme.headline3,
            ),

            // price range
            FlutterSlider(
              values: [_lowerValue, _upperValue],
              rangeSlider: true,
              max: 100000,
              min: 0,
              trackBar: FlutterSliderTrackBar(
                activeTrackBarHeight: 5,
                activeTrackBar: BoxDecoration(borderRadius: BorderRadius.circular(4), color: Theme.of(context).primaryColor),
              ),
              tooltip: FlutterSliderTooltip(
                alwaysShowTooltip: false,
                boxStyle: FlutterSliderTooltipBox(),
                textStyle: TextStyle(fontSize: 14, color: Colors.lightBlue),
              ),
              handler: FlutterSliderHandler(
                decoration: BoxDecoration(),
                child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Theme.of(context).primaryColor, width: 3),
                        color: Colors.white)),
              ),
              rightHandler: FlutterSliderHandler(
                decoration: BoxDecoration(),
                child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Theme.of(context).primaryColor, width: 3),
                        color: Colors.white)),
              ),
              handlerWidth: 45,
              handlerHeight: 40,
              disabled: false,
              onDragging: (handlerIndex, lowerValue, upperValue) {
                _lowerValue = lowerValue;
                _upperValue = upperValue;
                setState(() {});
              },
            ),

            Text(
              getTranslated('rating', context),
              style: Theme.of(context).textTheme.headline3,
            ),

            Center(
              child: Container(
                height: 30,
                child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Icon(
                        searchProvider.rating < (index + 1) ? Icons.star_border : Icons.star,
                        size: 20,
                        color: searchProvider.rating < (index + 1) ? ColorResources.getGreyColor(context) : Theme.of(context).primaryColor,
                      ),
                      onTap: () => searchProvider.setRating(index + 1),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              getTranslated('category', context),
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(height: 13),

            Consumer<RestCategoryProvider>(
              builder: (context, category, child) {
                return category.categoryList != null
                    ? GridView.builder(
                      itemCount: category.categoryList.length,
                      padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL),
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, childAspectRatio: 2.0, crossAxisSpacing: 10, mainAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            category.updateSelectCategory(index);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(right: Dimensions.PADDING_SIZE_SMALL),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: category.selectCategory == index
                                        ? Colors.transparent
                                        : ColorResources.getHintColor(context)),
                                borderRadius: BorderRadius.circular(7.0),
                                color: category.selectCategory == index ? Theme.of(context).primaryColor : Colors.transparent),
                            child: Text(
                              category.categoryList[index].name,
                              textAlign: TextAlign.center,
                              style: rubikMedium.copyWith(
                                  fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                                  color: category.selectCategory == index ? Colors.white : ColorResources.getHintColor(context)),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        );
                      },
                    )
                    : CategoryShimmer();
              },
            ),
            SizedBox(height: 30),

            CustomButton(
              btnTxt: getTranslated('apply', context),
              onTap: () {
                if (_upperValue > 0 && Provider.of<RestCategoryProvider>(context, listen: false).selectCategory == -1 && searchProvider.rating == -1) {
                  searchProvider.sortSearchList(0, startingPrice: _lowerValue, endingPrice: _upperValue);
                } else if (_upperValue == 0 &&
                    Provider.of<RestCategoryProvider>(context, listen: false).selectCategory > -1 &&
                    searchProvider.rating == -1) {
                  searchProvider.sortSearchList(1, selectCategoryIndex: Provider.of<RestCategoryProvider>(context, listen: false).selectCategory);
                } else if (_upperValue == 0 &&
                    Provider.of<RestCategoryProvider>(context, listen: false).selectCategory == -1 &&
                    searchProvider.rating > -1) {
                  searchProvider.sortSearchList(2, ratingValue: searchProvider.rating.toDouble());
                } else if (_upperValue > 0 &&
                    Provider.of<RestCategoryProvider>(context, listen: false).selectCategory > -1 &&
                    searchProvider.rating == -1) {
                  searchProvider.sortSearchList(3,
                      startingPrice: _lowerValue,
                      endingPrice: _upperValue,
                      selectCategoryIndex: Provider.of<RestCategoryProvider>(context, listen: false).selectCategory);
                } else if (_upperValue > 0 &&
                    Provider.of<RestCategoryProvider>(context, listen: false).selectCategory > -1 &&
                    searchProvider.rating > -1) {
                  searchProvider.sortSearchList(4,
                      startingPrice: _lowerValue,
                      endingPrice: _upperValue,
                      selectCategoryIndex: Provider.of<RestCategoryProvider>(context, listen: false).selectCategory,
                      ratingValue: searchProvider.rating.toDouble());
                }

                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
