import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screens/utility/colorResources.dart';
import 'package:flutter_ui_kit/screens/utility/dimensions.dart';
import 'package:flutter_ui_kit/screens/utility/strings.dart';
import 'package:flutter_ui_kit/screens/utility/style.dart';
import 'package:flutter_ui_kit/wallet/utility/images.dart';

class ProfileScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black54),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader(),
            Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(color: Colors.grey.shade200),
              child: Text(
                Strings.over_two_year_of_experence,
                style: ibmRegular.copyWith(color: Colors.black87),
              ),
            ),
            _buildTitle(Strings.skills),
            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
            _buildSkillRow(Strings.flutter, 0.75),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            _buildSkillRow(Strings.ui_ux_design, 0.3),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            _buildSkillRow(Strings.swift, 0.65),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            _buildSkillRow(Strings.native_app_development, 0.5),
            SizedBox(height: 30.0),
            _buildTitle(Strings.experience),
            _buildExperienceRow(company: Strings.company_two, position: Strings.company_one_position, duration: Strings.company_one_duration),
            _buildExperienceRow(company: Strings.company_one, position: Strings.company_two_position, duration: Strings.company_two_duration),
            SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
            _buildTitle(Strings.education),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            _buildExperienceRow(company: Strings.education_one, position: Strings.education_one_position, duration: Strings.education_one_duration),
            _buildExperienceRow(company: Strings.education_two, position: Strings.education_two_position, duration: Strings.education_two_duration),
            _buildExperienceRow(
                company: Strings.education_three, position: Strings.education_three_position, duration: Strings.education_three_duration),
            SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
            _buildTitle(Strings.contact),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            Row(
              children: <Widget>[
                SizedBox(width: 30.0),
                Icon(
                  Icons.mail,
                  color: Colors.black54,
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                Text(
                  Strings.mail_one,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
            Row(
              children: <Widget>[
                SizedBox(width: 30.0),
                Icon(
                  Icons.phone,
                  color: Colors.black54,
                ),
                SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                Text(
                  Strings.phone_number,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            _buildSocialsRow(),
            SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
          ],
        ),
      ),
    );
  }

  Row _buildSocialsRow() {
    return Row(
      children: <Widget>[
        SizedBox(width: Dimensions.PADDING_SIZE_LARGE),
        IconButton(
          color: Colors.indigo,
          icon: ImageIcon(
            AssetImage("assets/doctor/Icon/facebook.png"),
            color: Color(0xFF3A5A98),
          ),
          onPressed: () {},
        ),
        SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
        IconButton(
          color: Colors.indigo,
          icon: ImageIcon(
            AssetImage("assets/doctor/Icon/instagram.png"),
            color: Color(0xFF3A5A98),
          ),
          onPressed: () {},
        ),
        SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
        IconButton(
          color: Colors.red,
          icon: ImageIcon(
            AssetImage("assets/doctor/Icon/twitter.png"),
            color: Color(0xFF3A5A98),
          ),
          onPressed: () {},
        ),
        SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
      ],
    );
  }

  ListTile _buildExperienceRow({String company, String position, String duration}) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 20.0),
        child: Icon(
          Icons.circle,
          size: 12.0,
          color: Colors.black54,
        ),
      ),
      title: Text(
        company,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      subtitle: Text("$position ($duration)"),
    );
  }

  Row _buildSkillRow(String skill, double level) {
    return Row(
      children: <Widget>[
        SizedBox(width: 16.0),
        Expanded(
            flex: 2,
            child: Text(
              skill.toUpperCase(),
              textAlign: TextAlign.right,
            )),
        SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
        Expanded(
          flex: 5,
          child: LinearProgressIndicator(
            value: level,
            valueColor: AlwaysStoppedAnimation<Color>(ColorResources.COLOR_PRIMARY),
            backgroundColor: ColorResources.COLOR_GRAY_CHATEAU,
          ),
        ),
        SizedBox(width: 16.0),
      ],
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title.toUpperCase(),
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Divider(
            color: Colors.black54,
          ),
        ],
      ),
    );
  }

  Row _buildHeader() {
    return Row(
      children: <Widget>[
        SizedBox(width: Dimensions.PADDING_SIZE_LARGE),
        Container(
            width: 80.0,
            height: 80.0,
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey,
              child: FadeInImage.assetNetwork(
                placeholder: Images.place_holder,
                image: Images.person_three,
                width: 75,
                height: 75,
                fit: BoxFit.fill,),
            )),
        SizedBox(width: Dimensions.PADDING_SIZE_LARGE),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              Strings.mehedi_hasan_shuvo,
              style: ibmBold.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE, color: ColorResources.COLOR_BLACK),
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            Text(
              Strings.junior_android_developer,
              style: ibmRegular.copyWith(color: Colors.black87),
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            Row(
              children: <Widget>[
                Icon(
                  Icons.location_city,
                  size: 12.0,
                  color: Colors.black54,
                ),
                SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                Text(
                  Strings.kalkini_madaripur,
                  style: ibmRegular.copyWith(color: Colors.black54),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
