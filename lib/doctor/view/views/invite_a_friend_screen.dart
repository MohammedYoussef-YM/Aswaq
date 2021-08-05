import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/data/model/contact_model.dart';
import 'package:flutter_ui_kit/doctor/provider/contact_provider.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/dimensions.dart';
import 'package:flutter_ui_kit/doctor/utility/strings.dart';
import 'package:flutter_ui_kit/doctor/utility/style.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class InviteAFriendScreen extends StatefulWidget {
  @override
  _InviteAFriendScreenState createState() => _InviteAFriendScreenState();
}

class _InviteAFriendScreenState extends State<InviteAFriendScreen> {
  bool isContact = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_HOME_BACKGROUND,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: Strings.INVITE_A_FRIEND),
            SizedBox(height: 15),
            Row(
              children: [
                SizedBox(width: 10),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isContact = true;
                      });
                    },
                    child: ContactButton(imageUrl: 'assets/doctor/Icon/contact blue.png', title: Strings.CONTACTS, isSelected: isContact),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isContact = false;
                      });
                    },
                    child: ContactButton(imageUrl: 'assets/doctor/Icon/facebook blue.png', title: Strings.FACEBOOK, isSelected: !isContact),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                  itemCount: Provider.of<ContactProvider>(context).getContactList().length,
                  itemBuilder: (context, index) {
                    ContactModel contactModel = Provider.of<ContactProvider>(context).getContactList()[index];

                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      decoration: BoxDecoration(
                        color: ColorResources.COLOR_WHITE,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: ListTile(
                        leading: Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: ColorResources.COLOR_PRIMARY
                                  .withOpacity(.24),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            contactModel.name.substring(0, 1),
                            style: khulaBold.copyWith(color: ColorResources.COLOR_CONFLOWER_BLUE, fontSize: 20),
                          ),
                        ),
                        title: Text(
                          contactModel.name,
                          style: khulaBold.copyWith(color: ColorResources.COLOR_CONFLOWER_BLUE, fontSize: 20),
                        ),
                        trailing: Container(
                          width: 70,
                          height: 20,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: contactModel.isInvited ? ColorResources.COLOR_HOME_BACKGROUND : ColorResources.COLOR_PRIMARY,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text(Strings.INVITE, style: khulaRegular.copyWith(fontSize: 12, color: contactModel.isInvited ? ColorResources.COLOR_GREY : ColorResources.COLOR_WHITE)),
                        ),
                      ),
                    );
                  },
              ),
            )],
        ),
      ),
    );
  }
}

class ContactButton extends StatelessWidget {
  final String imageUrl;
  final String title;
  final bool isSelected;
  ContactButton({@required this.imageUrl, @required this.title, @required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: isSelected ? ColorResources.COLOR_PRIMARY : ColorResources.COLOR_WHITE,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            margin: EdgeInsets.only(left: 5),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: isSelected ? ColorResources.COLOR_WHITE : ColorResources.COLOR_PRIMARY,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Image.asset(imageUrl, color: isSelected ? ColorResources.COLOR_PRIMARY : ColorResources.COLOR_WHITE),
          ),
          Expanded(
              child: Center(child: Text(title, style: khulaSemiBold.copyWith(
                color: isSelected ? ColorResources.COLOR_WHITE : ColorResources.COLOR_PRIMARY,
              ))),
          ),
        ],
      ),
    );
  }
}