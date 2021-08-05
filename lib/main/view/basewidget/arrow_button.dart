import 'package:flutter/material.dart';
class WidgetArrowButton extends StatelessWidget {
  final String title;
  final Widget widget;
  WidgetArrowButton({@required this.widget,@required this.title});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_)=>widget));
      },
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        decoration: BoxDecoration(
          color: Color(0xffFFFFFF),
          boxShadow: [BoxShadow(color: Colors.grey[300], spreadRadius: .5, blurRadius: 5)],
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
