import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/screens/utility/colorResources.dart';
import 'package:flutter_ui_kit/screens/utility/dimensions.dart';
import 'package:flutter_ui_kit/screens/utility/strings.dart';
import 'package:flutter_ui_kit/screens/utility/style.dart';
import 'package:flutter_ui_kit/wallet/utility/images.dart';

class ProfileScreenTwo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: 250,
              width: double.infinity,
              child: FadeInImage.assetNetwork(
                placeholder: Images.place_holder,
                image:  Images.image_one,
                  fit: BoxFit.fill,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16.0, 200.0, 16.0, 16.0),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(16.0),
                        margin: EdgeInsets.only(top: 16.0),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 96.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    Strings.mehedi_hasan_shuvo,
                                    style: ibmSemiBold.copyWith(color: ColorResources.COLOR_NERO, fontSize: Dimensions.FONT_SIZE_LARGE),
                                  ),
                                  ListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    title: Text(
                                      Strings.junior_android_developer,
                                      style: ibmRegular,
                                    ),
                                    subtitle: Text(
                                      Strings.kalkini_madaripur,
                                      style: ibmRegular,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        Strings.likes_count,
                                        style: montserratRegular,
                                      ),
                                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                      Text(
                                        Strings.likes,
                                        style: ibmRegular,
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        Strings.comments_count,
                                        style: montserratRegular,
                                      ),
                                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                      Text(
                                        Strings.comments,
                                        style: ibmRegular,
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        Strings.favourites_count,
                                        style: montserratRegular,
                                      ),
                                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                      Text(
                                        Strings.favourites,
                                        style: ibmRegular,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(image: AssetImage('assets/food/images/account_profile_image.png'), fit: BoxFit.cover)),
                        margin: EdgeInsets.only(left: 16.0),
                      ),
                    ],
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            Strings.user_information,
                            style: ibmSemiBold.copyWith(color: ColorResources.COLOR_BLACK, fontSize: Dimensions.FONT_SIZE_LARGE),
                          ),
                        ),
                        Divider(),
                        ListTile(
                          title: Text(Strings.email, style: ibmRegular.copyWith(color: ColorResources.COLOR_BLACK)),
                          subtitle: Text(
                            Strings.mail_one,
                            style: montserratRegular,
                          ),
                          leading: Icon(Icons.email),
                        ),
                        ListTile(
                          title: Text(Strings.phone, style: ibmRegular.copyWith(color: ColorResources.COLOR_BLACK)),
                          subtitle: Text(
                            Strings.phone_number,
                            style: montserratRegular,
                          ),
                          leading: Icon(Icons.phone),
                        ),
                        ListTile(
                          title: Text(Strings.website, style: ibmRegular.copyWith(color: ColorResources.COLOR_BLACK)),
                          subtitle: Text(
                            Strings.blog_link,
                            style: montserratRegular,
                          ),
                          leading: Icon(Icons.web),
                        ),
                        ListTile(
                          title: Text(Strings.about, style: ibmRegular.copyWith(color: ColorResources.COLOR_BLACK)),
                          subtitle: Text(
                            Strings.over_two_year_of_experence,
                            style: montserratRegular,
                          ),
                          leading: Icon(Icons.person),
                        ),
                        ListTile(
                          title: Text(Strings.joined_date, style: ibmRegular.copyWith(color: ColorResources.COLOR_BLACK)),
                          subtitle: Text(
                            Strings.joined_full_date,
                            style: montserratRegular,
                          ),
                          leading: Icon(Icons.calendar_view_day),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: ColorResources.COLOR_WHITE),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
