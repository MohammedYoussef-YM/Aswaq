import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/food/utility/colorResources.dart';
import 'package:flutter_ui_kit/food/utility/images.dart';

class OtpWidget extends StatelessWidget {
  final Widget child;
  OtpWidget({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_WHITE,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: 260,
              color: Colors.grey.withOpacity(0.5),
            ),
            Container(
              margin: EdgeInsets.only(top: 220),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: ColorResources.COLOR_WHITE,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: child,
            ),
            Positioned(
              top: 120,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                        Images.otp_phone,
                        height: 200,
                        width: 200) ,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
