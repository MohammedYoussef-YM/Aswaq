import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/helper/network_info.dart';
import 'package:flutter_ui_kit/sixvalley/localization/language_constrants.dart';
import 'package:flutter_ui_kit/sixvalley/provider/mega_deal_provider.dart';
import 'package:flutter_ui_kit/sixvalley/utill/dimensions.dart';
import 'package:flutter_ui_kit/sixvalley/view/basewidget/custom_app_bar.dart';
import 'package:flutter_ui_kit/sixvalley/view/basewidget/title_row.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/home/widget/flash_deals_view.dart';
import 'package:provider/provider.dart';

class SixFlashDealScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NetworkInfo.checkConnectivity(context);

    return Scaffold(
      body: Column(children: [
        
        CustomAppBar(title: getTranslated('flash_deal', context)),
        
        Padding(
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
          child: TitleRow(title: getTranslated('flash_deal', context), eventDuration: Provider.of<SixMegaDealProvider>(context).duration),
        ),

        Expanded(child: Padding(
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
          child: FlashDealsView(isHomeScreen: false),
        )),
        
      ]),
    );
  }
}
