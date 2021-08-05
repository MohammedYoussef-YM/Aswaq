import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/provider/wish_list_provider.dart';
import 'package:flutter_ui_kit/academy/utility/colorResources.dart';
import 'package:flutter_ui_kit/academy/utility/dimensions.dart';
import 'package:flutter_ui_kit/academy/view/screen/cart/cart_screen.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';
import 'package:provider/provider.dart';

class CardWidget extends StatelessWidget {
  final bool isWhiteIcon;

  CardWidget({this.isWhiteIcon = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => CartScreen()));
      },
      child: Consumer<AcademyWishListProvider>(
        builder: (context, card, child) => Container(
          margin: EdgeInsets.only(top: AcademyDimensions.PADDING_SIZE_LARGE, right: AcademyDimensions.PADDING_SIZE_SMALL),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(
                Icons.shopping_cart,
                color: isWhiteIcon ? AcademyColorResources.COLOR_WHITE : AcademyColorResources.COLOR_GREY,
              ),
              Positioned(
                  top: -12,
                  left: 8,
                  child: Text(card.allCardList.length.toString(),
                      style: robotoMedium.copyWith(
                        color: isWhiteIcon ? AcademyColorResources.COLOR_WHITE : AcademyColorResources.COLOR_GREY,
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
