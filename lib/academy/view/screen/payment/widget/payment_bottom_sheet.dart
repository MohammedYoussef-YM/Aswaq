import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/provider/wish_list_provider.dart';
import 'package:flutter_ui_kit/academy/utility/colorResources.dart';
import 'package:flutter_ui_kit/academy/utility/dimensions.dart';
import 'package:flutter_ui_kit/academy/utility/strings.dart';
import 'package:flutter_ui_kit/academy/utility/style.dart';
import 'package:flutter_ui_kit/academy/view/screen/mycourses/my_courses_screen.dart';
import 'package:flutter_ui_kit/academy/view/screen/wishlist/widget/wish_list_widget.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';
import 'package:provider/provider.dart';

class PaymentBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<AcademyWishListProvider>(context, listen: false).getWishLists();

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(AcademyDimensions.PADDING_SIZE_SMALL),
        decoration: BoxDecoration(
          color: AcademyColorResources.COLOR_WHITE,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text(AcademyStrings.you_successfully_added, style: avenirHeavy.copyWith(fontSize: 20)),
          SizedBox(height: 10),
          WishListWidget(wishListModel: Provider.of<AcademyWishListProvider>(context, listen: false).wishLists[0], showButton: false),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => MyCoursesScreen(isFromCardPerched: true)));
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 10),
              primary:  AcademyColorResources.COLOR_ORANGE,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(AcademyStrings.explore_my_course, style: robotoBold.copyWith(fontSize: 20, color: AcademyColorResources.COLOR_WHITE)),
          ),
        ]),
      ),
    );
  }
}
