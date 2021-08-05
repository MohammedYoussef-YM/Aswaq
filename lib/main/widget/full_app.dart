import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/widget/app_button.dart';
import 'package:flutter_ui_kit/main/data/app_data.dart';

class FullAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 18),
        itemCount: AppData.getAppList().length,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: (1 / 1),
        ),
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.symmetric(vertical: 0),
          child: AppButton(
            title: AppData.getAppList()[index].title,
            description: AppData.getAppList()[index].description,
            screens: AppData.getAppList()[index].screens,
            color: AppData.getAppList()[index].color,
            widget: AppData.getAppList()[index].widget,
            app: AppData.getAppList()[index].app,
            icons: AppData.getAppList()[index].icons,
            version: AppData.getAppList()[index].version,
            isHome: AppData.getAppList()[index].isHome,
          ),
        ),
    );
  }
}


