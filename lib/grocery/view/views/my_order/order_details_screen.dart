import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/grocery/view/widgets/custom_button.dart';
import 'package:flutter_ui_kit/grocery/view/views/track_map/track_map_screen.dart';

class OrderDetailsScreen extends StatelessWidget {
  final bool fromComplete;
  OrderDetailsScreen({this.fromComplete = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_CART_BACKGROUND,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        //leading: SizedBox.shrink(),
        title: Text(
          Strings.order_id_number,
          style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK, fontSize: Dimensions.FONT_SIZE_LARGE),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT,right: Dimensions.PADDING_SIZE_DEFAULT,top: Dimensions.PADDING_SIZE_DEFAULT),
          child: Column(
            children: [
              fromComplete ? SizedBox() : Container(
                decoration: BoxDecoration(color: ColorResources.COLOR_WHITE, borderRadius: BorderRadius.circular(8.0)),
                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(Strings.order,style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),),
                        Text(Strings.arrange,style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),),
                        Text(Strings.shipping,style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL,color: ColorResources.COLOR_PRIMARY),),
                        Text(Strings.done,style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),),
                      ],
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Row(
                          children: [
                            CircleAvatar(backgroundColor: ColorResources.COLOR_PRIMARY,radius: 5,),
                            Expanded(child: Container(height: 3,color: ColorResources.COLOR_PRIMARY,))
                          ],
                        )),
                        Expanded(child: Row(
                          children: [
                            CircleAvatar(backgroundColor: ColorResources.COLOR_PRIMARY,radius: 5,),
                            Expanded(child: Container(height: 3,color: ColorResources.COLOR_PRIMARY,))
                          ],
                        )),
                        Expanded(child: Row(
                          children: [
                            Container(
                              width:15,
                              height: 15,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: ColorResources.COLOR_PRIMARY)
                              ),
                            ),
                            Expanded(child: Container(height: 3,color: ColorResources.COLOR_GRAY.withOpacity(.4),))
                          ],
                        )),
                        CircleAvatar(backgroundColor: ColorResources.COLOR_GRAY.withOpacity(.4),radius: 5,),
                      ],
                    ),
                    SizedBox(height: 40),
                    CustomButton(btnTxt: Strings.track_map,onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TrackMapScreen()));
                    },),
                    SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                  ],
                ),
              ),
              SizedBox(height: fromComplete ? 0 : Dimensions.PADDING_SIZE_LARGE),
              Container(
                decoration: BoxDecoration(color: ColorResources.COLOR_WHITE, borderRadius: BorderRadius.circular(8.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        Strings.order_bill,
                        style: poppinsRegular.copyWith(color: ColorResources.COLOR_DIM_GRAY.withOpacity(.8)),
                      ),
                    ),
                    Container(height: 1, color: ColorResources.COLOR_DIM_GRAY.withOpacity(.2), margin: EdgeInsets.symmetric(vertical: 5)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Strings.order_list,
                            style: poppinsRegular.copyWith(color: ColorResources.COLOR_DIM_GRAY.withOpacity(.8)),
                          ),
                          Text(
                            Strings.items_12,
                            style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK.withOpacity(.7)),
                          ),
                        ],
                      ),
                    ),
                    Container(height: 1, color: ColorResources.COLOR_DIM_GRAY.withOpacity(.2), margin: EdgeInsets.symmetric(vertical: 5)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Strings.total_price,
                            style: poppinsRegular.copyWith(color: ColorResources.COLOR_DIM_GRAY.withOpacity(.8)),
                          ),
                          Text(
                            Strings.doller_580,
                            style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK.withOpacity(.8)),
                          ),
                        ],
                      ),
                    ),
                    Container(height: 1, color: ColorResources.COLOR_DIM_GRAY.withOpacity(.2), margin: EdgeInsets.symmetric(vertical: 5)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Strings.delivery_fee,
                            style: poppinsRegular.copyWith(color: ColorResources.COLOR_DIM_GRAY.withOpacity(.8)),
                          ),
                          Text(
                            Strings.doller_9,
                            style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK.withOpacity(.8)),
                          ),
                        ],
                      ),
                    ),
                    Container(height: 1, color: ColorResources.COLOR_DIM_GRAY.withOpacity(.2), margin: EdgeInsets.symmetric(vertical: 5)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Strings.total_bill,
                            style: poppinsRegular.copyWith(color: ColorResources.COLOR_DIM_GRAY.withOpacity(.8)),
                          ),
                          Text(
                            Strings.doller_580,
                            style: poppinsRegular.copyWith(color: ColorResources.COLOR_PRIMARY),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
