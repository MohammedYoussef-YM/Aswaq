import 'package:flutter_ui_kit/wallet/data/models/gift_model.dart';
import 'package:flutter_ui_kit/wallet/utility/strings.dart';

class GiftRepo {
  List<GiftModel> getGiftList() {
    List<GiftModel> giftList = [
      GiftModel(
        imageUrl: 'assets/wallet/Illustration/gift4.png',
        title: Strings.BIRTHDAY,
        isSelected: false,
      ),
      GiftModel(
        imageUrl: 'assets/wallet/Illustration/gift3.png',
        title: Strings.EID_MUBARAK,
        isSelected: false,
      ),
      GiftModel(
        imageUrl: 'assets/wallet/Illustration/gift2.png',
        title: Strings.CHINESE_NEW_YEAR,
        isSelected: true,
      ),
      GiftModel(
        imageUrl: 'assets/wallet/Illustration/gift.png',
        title: Strings.ANIVERSARY,
        isSelected: false,
      ),
      GiftModel(
        imageUrl: 'assets/wallet/Illustration/gift4.png',
        title: Strings.BIRTHDAY,
        isSelected: false,
      ),
      GiftModel(
        imageUrl: 'assets/wallet/Illustration/gift3.png',
        title: Strings.EID_MUBARAK,
        isSelected: false,
      ),
      GiftModel(
        imageUrl: 'assets/wallet/Illustration/gift2.png',
        title: Strings.CHINESE_NEW_YEAR,
        isSelected: true,
      ),
      GiftModel(
        imageUrl: 'assets/wallet/Illustration/gift.png',
        title: Strings.ANIVERSARY,
        isSelected: false,
      ),
    ];
    return giftList;
  }
}
