import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_kit/household_app/data/models/service_model.dart';
import 'package:flutter_ui_kit/household_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/household_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/household_app/utility/style.dart';

class ServiceWidget extends StatelessWidget {
  final ServiceModel service;
  final Function onTap;
  final bool isSelectService;
  final bool isSubService;

  ServiceWidget({this.service, this.onTap, this.isSelectService = true, this.isSubService = false});

  @override
  Widget build(BuildContext context) {
    //Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ServiceScreenTwo()));
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(bottom: 2),
        height: 128,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(HouseHoldDimensions.PADDING_SIZE_SMALL),
              bottomRight: Radius.circular(HouseHoldDimensions.PADDING_SIZE_SMALL),
              topRight: Radius.circular(HouseHoldDimensions.PADDING_SIZE_SMALL),
              topLeft: Radius.circular(isSubService ? 0 : HouseHoldDimensions.PADDING_SIZE_SMALL)),
          color: isSubService
              ? isSelectService
                  ? HouseHoldColorResources.COLOR_PRIMARY
                  : HouseHoldColorResources.COLOR_WHITE_SMOKE
              : HouseHoldColorResources.COLOR_PRIMARY,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(service.imageUrl,
                color: isSubService
                    ? isSelectService
                        ? HouseHoldColorResources.COLOR_WHITE
                        : HouseHoldColorResources.COLOR_BLACK
                    : HouseHoldColorResources.COLOR_WHITE),
            SizedBox(height: HouseHoldDimensions.PADDING_SIZE_LARGE),
            Text(
              service.title,
              textAlign: TextAlign.center,
              style: manropeRegular.copyWith(
                color: isSubService
                    ? isSelectService
                        ? HouseHoldColorResources.COLOR_WHITE
                        : HouseHoldColorResources.COLOR_BLACK
                    : HouseHoldColorResources.COLOR_WHITE,
                fontSize: HouseHoldDimensions.FONT_SIZE_LARGE,
              ),
            )
          ],
        ),
      ),
    );
  }
}
