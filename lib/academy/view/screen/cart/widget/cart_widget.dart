import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/data/model/course.dart';
import 'package:flutter_ui_kit/academy/utility/colorResources.dart';
import 'package:flutter_ui_kit/academy/utility/dimensions.dart';
import 'package:flutter_ui_kit/academy/utility/images.dart';
import 'package:flutter_ui_kit/academy/utility/strings.dart';
import 'package:flutter_ui_kit/academy/utility/style.dart';
import 'package:flutter_ui_kit/academy/view/screen/cart/cart_screen.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';

class CartWidget extends StatelessWidget {
  final Course course;
  final bool fromCart;
  final bool showButton;
  final int index;
  final Function onTap;

  CartWidget({@required this.course, this.showButton = true, this.fromCart = false, this.onTap, this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: AcademyDimensions.PADDING_SIZE_SMALL),
        padding: EdgeInsets.all(AcademyDimensions.PADDING_SIZE_SMALL),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          fromCart
              ? Container(
                  height: 30,
                  width: 30,
                  margin: EdgeInsets.only(right: AcademyDimensions.PADDING_SIZE_SMALL),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all()),
                  child: course.isSelect ? Icon(Icons.check, size: 20, color: AcademyColorResources.COLOR_PRIMARY) : SizedBox(),
                )
              : SizedBox(),
          FadeInImage.assetNetwork(placeholder: Images.place_holder, image: course.imageUrl, width: 80, height: 80, fit: BoxFit.cover),
          SizedBox(width: 10),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(course.name, maxLines: 2, overflow: TextOverflow.ellipsis, style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_GREY)),
              Row(children: [
                Icon(Icons.star, color: AcademyColorResources.COLOR_ORANGE, size: 17),
                Icon(Icons.star, color: AcademyColorResources.COLOR_ORANGE, size: 17),
                Icon(Icons.star, color: AcademyColorResources.COLOR_ORANGE, size: 17),
                Icon(Icons.star, color: AcademyColorResources.COLOR_ORANGE, size: 17),
                Icon(Icons.star, color: AcademyColorResources.BORDER_COLOR, size: 17),
                Expanded(child: SizedBox()),
                Text('${course.rattingAndDownload}',
                    style: robotoMedium.copyWith(
                      fontSize: AcademyDimensions.FONT_SIZE_SMALL,
                      color: AcademyColorResources.TITLE_COLOR,
                    )),
              ]),
              Text(course.title,
                  style: robotoMedium.copyWith(
                    fontSize: AcademyDimensions.FONT_SIZE_SMALL,
                    color: AcademyColorResources.TITLE_COLOR,
                  )),
              Row(children: [
                Text('${course.currentPrice}', style: avenirHeavy),
                SizedBox(width: 10),
                Text('BDT ${course.lastPrice}',
                    style: robotoMedium.copyWith(
                      fontSize: AcademyDimensions.FONT_SIZE_SMALL,
                      color: AcademyColorResources.TITLE_COLOR,
                      decoration: TextDecoration.lineThrough,
                    )),
              ]),
              SizedBox(
                  height: fromCart
                      ? 0
                      : showButton
                          ? 10
                          : 0),
              showButton
                  ? !fromCart
                      ? Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                          InkWell(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CartScreen())),
                            child: Text(AcademyStrings.add_to_cart, style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_PRIMARY)),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(AcademyStrings.remove, style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_PRIMARY)),
                          ),
                        ])
                      : SizedBox()
                  : SizedBox(),
            ]),
          ),
        ]),
      ),
    );
  }
}
