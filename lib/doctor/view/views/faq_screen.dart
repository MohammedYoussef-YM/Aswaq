import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/provider/faq_provider.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/dimensions.dart';
import 'package:flutter_ui_kit/doctor/utility/strings.dart';
import 'package:flutter_ui_kit/doctor/utility/style.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class FAQScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    List<Color> iconColors = [
      Colors.orange, Colors.green, Colors.yellow, Colors.blue, Colors.brown, Colors.grey,
      Colors.deepPurple, Colors.pink, Colors.cyan,
    ];
    
    return Scaffold(
      backgroundColor: ColorResources.COLOR_HOME_BACKGROUND,
      body: SafeArea(child: Column(children: [

        CustomAppBar(title: Strings.FAQ),

        Expanded(child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: Provider.of<FaqProvider>(context).getFaqList().length,
            shrinkWrap: true,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL, vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
              padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
              decoration: BoxDecoration(
                color: ColorResources.COLOR_WHITE,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Container(
                  height: 50,
                  width: 50,
                  child: Icon(Icons.question_answer, color: iconColors[index%7]),
                  decoration: BoxDecoration(color: iconColors[index%7].withOpacity(0.2), borderRadius: BorderRadius.circular(10)),
                ),
                title: Text(
                  Provider.of<FaqProvider>(context).getFaqList()[index].question,
                  style: khulaRegular.copyWith(fontSize: 12, color: ColorResources.COLOR_GREY),
                ),
                subtitle: Text(
                  Provider.of<FaqProvider>(context).getFaqList()[index].answer,
                  style: khulaRegular.copyWith(fontSize: 12, color: ColorResources.COLOR_GREY),
                ),
              ),
            ),
        )),
      ])),
    );
  }
}
