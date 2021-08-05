import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';

class DeliveryAddressWidget extends StatelessWidget {
  final String positionType;
  final String condition;

  DeliveryAddressWidget({this.positionType, this.condition});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
      decoration: BoxDecoration(
        color: ColorResources.COLOR_WHITE,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                positionType,
                style: poppinsRegular,
              ),
              InkWell(
                onTap: (){
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChangeDeliveryAddressScreen()));
                },
                child: Text(
                  condition??'',
                  style: poppinsRegular.copyWith(color: ColorResources.COLOR_PRIMARY),
                ),
              ),
            ],
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/grocery/images/map.png',fit: BoxFit.fill,width: 80,height: 80,),
              SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.add_location,
                        color: ColorResources.COLOR_GRAY.withOpacity(.3),
                        size: 14,
                      ),
                      SizedBox(
                        width: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                      ),
                      Text(
                        Strings.address4,
                        style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                      )
                    ],
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: ColorResources.COLOR_GRAY.withOpacity(.3),
                        size: 14,
                      ),
                      SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      Text(
                        Strings.todd_benson,
                        style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                      )
                    ],
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  Row(
                    children: [
                      Icon(
                        Icons.call,
                        color: ColorResources.COLOR_GRAY.withOpacity(.3),
                        size: 14,
                      ),
                      SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      Text(
                        Strings.phone_number_two,
                        style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
