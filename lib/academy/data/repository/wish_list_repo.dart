import 'package:flutter_ui_kit/academy/data/model/course.dart';
import 'package:flutter_ui_kit/academy/data/model/wishlist_model.dart';
import 'package:flutter_ui_kit/academy/utility/images.dart';
import 'package:flutter_ui_kit/academy/utility/strings.dart';

class AcademyWishListRepo {
  List<WishListModel> getWishLists() {
    List<WishListModel> wishList = [
      WishListModel(Images.item_1, 'The Complete 2020 Web Development Bootcamp', 4.7, 40124, 'Dr.Angela Yu', 1000, 1100),
      WishListModel(Images.item_2, 'The Complete 2020 Web Development Bootcamp', 4.6, 40124, 'Dr.Angela Yu', 3000, 3100),
      WishListModel(Images.item_3, 'The Complete 2020 Web Development Bootcamp', 4.2, 40124, 'Dr.Angela Yu', 2200, 2500),
    ];
    return wishList;
  }

  List<Course> getAllCartLists() {
    List<Course> cardList = [
      Course(
          id: 1,
          imageUrl: Images.course_1,
          title: AcademyStrings.the_complete_2020_web_development_bootcamp,
          name: AcademyStrings.dr_angela_yu,
          rattingAndDownload: AcademyStrings.four_6_40124,
          lastPrice: AcademyStrings.number_11000,
          currentPrice: AcademyStrings.bdt_1000,
          condition: AcademyStrings.bestseller),
      Course(
          id: 2,
          imageUrl: Images.course_2,
          title: AcademyStrings.the_complete_2020_web_development_bootcamp,
          name: AcademyStrings.dr_angela_yu,
          rattingAndDownload: AcademyStrings.four_6_40124,
          lastPrice: AcademyStrings.number_11000,
          currentPrice: AcademyStrings.bdt_1000,
          condition: AcademyStrings.bestseller),
      Course(
          id: 3,
          imageUrl: Images.course_3,
          title: AcademyStrings.the_complete_2020_web_development_bootcamp,
          name: AcademyStrings.dr_angela_yu,
          rattingAndDownload: AcademyStrings.four_6_40124,
          lastPrice: AcademyStrings.number_11000,
          currentPrice: AcademyStrings.bdt_1000,
          condition: AcademyStrings.bestseller),
    ];
    return cardList;
  }
}
