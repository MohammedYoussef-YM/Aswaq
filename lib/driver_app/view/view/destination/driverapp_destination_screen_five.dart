import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/driver_app/view/view/home/driverapp_homescreen.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/driver_app/provider/destination_provider.dart';
import 'package:flutter_ui_kit/driver_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/driver_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/driver_app/utility/strings.dart';
import 'package:flutter_ui_kit/driver_app/view/view/destination/widget/star_rating.dart';
import 'package:flutter_ui_kit/driver_app/view/widget/custom_button.dart';
import 'package:flutter_ui_kit/driver_app/view/widget/custom_text_field.dart';
import 'package:flutter_ui_kit/rideshare/utility/images.dart';
import 'package:provider/provider.dart';

class DriverAppDestinationScreenFive extends StatefulWidget {
  @override
  _DriverAppDestinationScreenFiveState createState() => _DriverAppDestinationScreenFiveState();
}

class _DriverAppDestinationScreenFiveState extends State<DriverAppDestinationScreenFive> {
  double rating = 0;

  @override
  void initState() {
    super.initState();
    Provider.of<DestinationProvider>(context, listen: false).changeSelectIndex(-1);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<DestinationProvider>(context, listen: false).initializeGetAllTips();
    return Scaffold(
      backgroundColor: ColorResources.COLOR_WHITE,
      appBar: AppBar(
        backgroundColor: ColorResources.COLOR_WHITE,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_outlined,
            color: ColorResources.COLOR_GRAY_SIMPLE,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0,
        title: Text(
          Strings.your_feedback,
          style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_GRAY_SIMPLE, fontSize: Dimensions.FONT_SIZE_LARGE),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Text(
              Strings.hohn_doe,
              style: poppinsBold.copyWith(color: ColorResources.COLOR_BLACK, fontSize: 17),
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
            FadeInImage.assetNetwork(
              placeholder: Images.place_holder,
              image: Images.person_one,
              width: 96,
              height: 96,
              fit: BoxFit.fill,),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
            Text(
              Strings.rate_your_driver,
              style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY_SIMPLE, fontSize: 13),
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StarRating(
                  rating: rating,
                  onRatingChanged: (rating) => setState(() => this.rating = rating),
                )
              ],
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
            Text(
              Strings.great_driver_consider_giving_a_tip,
              style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY_SIMPLE, fontSize: 17),
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
            Container(
              height: 36,
              margin: EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT),
              child: Consumer<DestinationProvider>(
                builder: (context, destinationProvider, child) => ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: destinationProvider.getAllTips.length,
                    itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            destinationProvider.changeSelectIndex(index);
                          },
                          child: Container(
                            height: 36,
                            width: 97,
                            margin: EdgeInsets.only(right: Dimensions.PADDING_SIZE_DEFAULT),
                            decoration: BoxDecoration(
                                color: destinationProvider.selectIndex == index ? ColorResources.COLOR_PRIMARY : ColorResources.COLOR_SIMPLE_WHITE,
                                borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL)),
                            alignment: Alignment.center,
                            child: Text(
                              destinationProvider.getAllTips[index],
                              style: poppinsRegular.copyWith(
                                  color: destinationProvider.selectIndex == index ? ColorResources.COLOR_WHITE : ColorResources.COLOR_BLACK),
                            ),
                          ),
                        )),
              ),
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
            Container(
              height: 140,
              margin: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
              padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
              decoration: BoxDecoration(
                  border: Border.all(color: ColorResources.COLOR_PRIMARY, width: 1),
                  borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_DEFAULT)),
              child: CustomTextField(
                maxLines: 4,
                isBorder: false,
                hintText: Strings.lorem__ut,
                inputAction: TextInputAction.done,
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
              child: CustomButton(
                btnTxt: Strings.done,
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => DriverAppHomeScreen()), (route) => false);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
