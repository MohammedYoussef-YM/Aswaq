import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/strings.dart';
import 'package:flutter_ui_kit/doctor/utility/style.dart';

class SelectALanguageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> languageList = ['Bangla (Bangladesh)', 'Hindi (Indian)', 'English (US)', 'English (UK)', 'Bahasa (Indonesia)'];
    return Container(
      height: 450,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ColorResources.COLOR_WHITE,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(Strings.SELECT_LANGUAGE, style: khulaSemiBold.copyWith(color: ColorResources.COLOR_GREY, fontSize: 16)),
          Expanded(
            child: CupertinoPicker(
              itemExtent: 40,
              useMagnifier: true,
              magnification: 1.2,
              onSelectedItemChanged: (i) {},
              children: languageList.map((language) {
                return Center(child: Text(language, style: khulaSemiBold.copyWith(color: ColorResources.COLOR_GREY, fontSize: 12)));
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
