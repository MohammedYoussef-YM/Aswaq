import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/rideshare/provider/history_provider.dart';
import 'package:flutter_ui_kit/rideshare/provider/wallet_provider.dart';
import 'package:flutter_ui_kit/rideshare/utility/colorResources.dart';
import 'package:flutter_ui_kit/rideshare/utility/dimensions.dart';
import 'package:flutter_ui_kit/rideshare/utility/strings.dart';
import 'package:flutter_ui_kit/rideshare/view/view/history/widget/history_details_widget.dart';
import 'package:flutter_ui_kit/rideshare/view/widget/custom_button.dart';
import 'package:provider/provider.dart';

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<WalletProvider>(context, listen: false).initializeCreditCards();
    Provider.of<HistoryProvider>(context, listen: false).initializeHistory();
    return Scaffold(
      backgroundColor: ColorResources.COLOR_WHITE,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          Strings.my_wallet,
          style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_GRAY_SIMPLE, fontSize: Dimensions.FONT_SIZE_LARGE),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined, color: ColorResources.COLOR_GRAY_SIMPLE),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: ColorResources.COLOR_WHITE,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
          Container(
            height: 200,
            margin: EdgeInsets.only(left: Dimensions.PADDING_SIZE_LARGE),
            child: Consumer<WalletProvider>(
              builder: (context, walletProvider, child) => ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: walletProvider.creditCards.length,
                  itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          walletProvider.changeSelectIndex(index);
                        },
                        child: Container(
                          width: 200,
                          height: 200,
                          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                          margin: EdgeInsets.only(right: Dimensions.PADDING_SIZE_LARGE, bottom: Dimensions.PADDING_SIZE_LARGE),
                          decoration: BoxDecoration(
                              color: walletProvider.selectIndex == index ? ColorResources.COLOR_PRIMARY : ColorResources.COLOR_CARD_BACKGROUND,
                              borderRadius: BorderRadius.circular(30.0),
                              boxShadow: [
                                BoxShadow(
                                  color: ColorResources.COLOR_PRIMARY.withOpacity(0.3),
                                  spreadRadius: 4,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                              border: Border.all(color: ColorResources.COLOR_PRIMARY, width: 2.0)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    walletProvider.creditCards[index].cartName,
                                    style: montserratSemiBold.copyWith(
                                        color: walletProvider.selectIndex == index ? ColorResources.COLOR_WHITE : ColorResources.COLOR_GRAY_DEEP),
                                  ),
                                  CircleAvatar(
                                    radius: 8,
                                    backgroundColor:
                                        walletProvider.selectIndex == index ? ColorResources.COLOR_CARD_BACKGROUND : ColorResources.COLOR_GRAY,
                                    child: Icon(Icons.done,
                                        color:
                                            walletProvider.selectIndex == index ? ColorResources.COLOR_PRIMARY : ColorResources.COLOR_CARD_BACKGROUND,
                                        size: 12),
                                  )
                                ],
                              ),
                              SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                              Text(
                                walletProvider.creditCards[index].cartNumber,
                                style: montserratSemiBold.copyWith(
                                    color: walletProvider.selectIndex == index ? ColorResources.COLOR_WHITE : ColorResources.COLOR_GRAY_DEEP),
                              ),
                              SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                              Text(
                                walletProvider.creditCards[index].balance,
                                style: poppinsSemiBold.copyWith(
                                    color: walletProvider.selectIndex == index ? ColorResources.COLOR_WHITE : ColorResources.COLOR_GRAY_DEEP),
                              ),
                              SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                              Text(
                                Strings.balance,
                                style: poppinsRegular.copyWith(
                                  color: walletProvider.selectIndex == index ? ColorResources.COLOR_WHITE : ColorResources.COLOR_GRAY_DEEP,
                                  fontSize: 9,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
            child: CustomButton(
              btnTxt: Strings.add_new_payment_method,
              isWhiteBackground: true,
              onTap: () {},
            ),
          ),
          Padding(
              padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
              child: Text(
                Strings.payment_receive,
                style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE, color: ColorResources.COLOR_GRAY_DEEP),
              )),
          Consumer<HistoryProvider>(
            builder: (context, historyProvider, child) => ListView.builder(
                itemCount: historyProvider.historyModels.length,
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                child: HistoryDetailsWidget(),
                              );
                            });
                      },
                      child: Container(
                        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  historyProvider.historyModels[index].time,
                                  style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY_SIMPLE),
                                ),
                                Container(
                                  width: 35,
                                  height: 18,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0), color: ColorResources.COLOR_GAINSBORO),
                                  child: Text(
                                    Strings.am,
                                    style: montserratRegular.copyWith(fontSize: 11),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: Dimensions.PADDING_SIZE_DEFAULT),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            historyProvider.historyModels[index].title,
                                            style: poppinsRegular.copyWith(
                                                color: ColorResources.COLOR_GRAY_SIMPLE, fontSize: Dimensions.FONT_SIZE_LARGE),
                                          ),
                                          Text(historyProvider.historyModels[index].subtitle,
                                              style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL)),
                                        ],
                                      ),
                                      Text(historyProvider.historyModels[index].price,
                                          style:
                                              poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY_SIMPLE, fontSize: Dimensions.FONT_SIZE_LARGE)),
                                    ],
                                  ),
                                  SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                                  Divider(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}
