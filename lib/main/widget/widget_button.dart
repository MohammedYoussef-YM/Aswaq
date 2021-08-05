import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';

class WidgetButton extends StatelessWidget {
  final String widgetName;
  final Widget widgetData;
  final Color iconColor;
  final IconData icon;

  WidgetButton({
    this.widgetName,
    this.icon,
    this.iconColor,
    this.widgetData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>widgetData));
      },
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(4),
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: Color(0xffFFFFFF),
          boxShadow: [BoxShadow(color: Colors.grey[300], spreadRadius: .5, blurRadius: 0.5)],
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,color: iconColor,),
            SizedBox(height: 5,),
            Text(widgetName,
              style: robotoRegular.copyWith(fontSize: 12),maxLines: 2,overflow:TextOverflow.ellipsis, textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}
