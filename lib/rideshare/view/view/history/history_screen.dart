import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/rideshare/provider/history_provider.dart';
import 'package:flutter_ui_kit/rideshare/utility/colorResources.dart';
import 'package:flutter_ui_kit/rideshare/utility/dimensions.dart';
import 'package:flutter_ui_kit/rideshare/utility/strings.dart';
import 'package:flutter_ui_kit/rideshare/view/view/history/widget/history_details_widget.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<HistoryProvider>(context, listen: false).initializeHistory();
    return Scaffold(
      backgroundColor: ColorResources.COLOR_WHITE,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          Strings.history,
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
      body: Consumer<HistoryProvider>(
        builder: (context, historyProvider, child) => ListView.builder(
            itemCount: historyProvider.historyModels.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => InkWell(
              onTap: (){
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
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
                                        style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY_SIMPLE, fontSize: Dimensions.FONT_SIZE_LARGE),
                                      ),
                                      Text(historyProvider.historyModels[index].subtitle,
                                          style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL)),
                                    ],
                                  ),
                                  Text(historyProvider.historyModels[index].price,
                                      style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY_SIMPLE, fontSize: Dimensions.FONT_SIZE_LARGE)),
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
    );
  }
}
