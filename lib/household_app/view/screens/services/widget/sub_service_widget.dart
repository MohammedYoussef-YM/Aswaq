import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/household_app/data/models/service_model.dart';
import 'package:flutter_ui_kit/household_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/household_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/household_app/utility/images.dart';
import 'package:flutter_ui_kit/household_app/utility/style.dart';

class SubServiceWidget extends StatelessWidget {
  final ServiceModel service;
  final Function onTap;

  SubServiceWidget({this.service, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: HouseHoldDimensions.PADDING_SIZE_LARGE),
        height: 65,
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(HouseHoldDimensions.PADDING_SIZE_EXTRA_SMALL),
                child: FadeInImage.assetNetwork(placeholder: Images.place_holder, image: service.imageUrl, width: 71, height: 65, fit: BoxFit.fill)),
            SizedBox(width: 6.0),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(service.title,
                      style: manropeRegular.copyWith(
                          color: HouseHoldColorResources.COLOR_CHARCOAL_HINT, fontSize: HouseHoldDimensions.FONT_SIZE_LARGE)),
                  Container(height: 1, color: HouseHoldColorResources.COLOR_CHARCOAL_HINT.withOpacity(.2)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
