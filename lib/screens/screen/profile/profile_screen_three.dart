import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/screens/utility/colorResources.dart';
import 'package:flutter_ui_kit/screens/utility/dimensions.dart';
import 'package:flutter_ui_kit/screens/utility/strings.dart';
import 'package:flutter_ui_kit/screens/utility/style.dart';

class ProfileScreenThree extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.view_profile,
          style: ibmSemiBold.copyWith(color: ColorResources.COLOR_WHITE, fontSize: Dimensions.FONT_SIZE_LARGE),
        ),
        backgroundColor: ColorResources.COLOR_PRIMARY,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: ColorResources.COLOR_WHITE),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 230,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CircleAvatar(
                      child: Icon(Icons.call, size: 20.0, color: ColorResources.COLOR_WHITE),
                      minRadius: 25.0,
                      backgroundColor: ColorResources.COLOR_PRIMARY,
                    ),
                    CircleAvatar(
                      minRadius: 60,
                      backgroundColor: ColorResources.COLOR_MARINER,
                      child: CircleAvatar(backgroundImage: AssetImage('assets/food/images/account_profile_image.png'), minRadius: 59),
                    ),
                    CircleAvatar(
                      child: Icon(Icons.message, size: 20.0, color: ColorResources.COLOR_WHITE),
                      minRadius: 25.0,
                      backgroundColor: ColorResources.COLOR_PRIMARY,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  Strings.mehedi_hasan_shuvo,
                  style: ibmBold.copyWith(color: ColorResources.COLOR_NERO),
                ),
                Text(
                  Strings.kalkini_madaripur,
                  style: montserratRegular.copyWith(color: ColorResources.COLOR_GRAY),
                )
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: ColorResources.COLOR_PRIMARY.withOpacity(.5),
                  child: ListTile(
                    title: Text(
                      Strings.followers_count,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.0),
                    ),
                    subtitle: Text(
                      Strings.followers,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: ColorResources.COLOR_PRIMARY,
                  child: ListTile(
                    title: Text(
                      Strings.following_count,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.0),
                    ),
                    subtitle: Text(
                      Strings.following,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ),
              ),
            ],
          ),
          ListTile(
            title: Text(Strings.email, style: ibmRegular.copyWith(color: ColorResources.COLOR_GRAY)),
            subtitle: Text(
              Strings.mail_one,
              style: montserratRegular,
            ),
          ),
          Divider(),
          ListTile(
            title: Text(Strings.phone, style: ibmRegular.copyWith(color: ColorResources.COLOR_GRAY)),
            subtitle: Text(
              Strings.phone_number,
              style: montserratRegular,
            ),
          ),
          Divider(),
          ListTile(
            title: Text(Strings.website, style: ibmRegular.copyWith(color: ColorResources.COLOR_GRAY)),
            subtitle: Text(
              Strings.blog_link,
              style: montserratRegular,
            )
          ),
          Divider(),
          ListTile(
            title: Text(Strings.about, style: ibmRegular.copyWith(color: ColorResources.COLOR_GRAY)),
            subtitle: Text(
              Strings.over_two_year_of_experence,
              style: montserratRegular,
            )
          ),
          Divider(),
          ListTile(
            title: Text(Strings.joined_date, style: ibmRegular.copyWith(color: ColorResources.COLOR_GRAY)),
            subtitle: Text(
              Strings.joined_full_date,
              style: montserratRegular,
            )
          ),
          Divider(),
        ],
      ),
    );
  }
}
