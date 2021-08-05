import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/household_app/provider/service_provider.dart';
import 'package:flutter_ui_kit/household_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/household_app/utility/strings.dart';
import 'package:flutter_ui_kit/household_app/utility/images.dart';
import 'package:flutter_ui_kit/household_app/utility/style.dart';
import 'package:flutter_ui_kit/household_app/provider/house_home_provider.dart';
import 'package:flutter_ui_kit/household_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/household_app/view/screens/notification/notification_screen.dart';
import 'package:flutter_ui_kit/household_app/view/screens/location/location_screen.dart';
import 'package:flutter_ui_kit/household_app/view/screens/services/service_screen_two.dart';
import 'package:flutter_ui_kit/household_app/view/screens/services/widget/service_widget.dart';
import 'package:flutter_ui_kit/household_app/view/widget/custom_text_field.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final Function onTap;
  HomeScreen({@required this.onTap});

  @override
  Widget build(BuildContext context) {
    Provider.of<HouseHomeProvider>(context, listen: false).getOffers();
    Provider.of<HouseHomeProvider>(context, listen: false).getServices();
    Provider.of<ServiceProvider>(context, listen: false).initializeAllService();

    return Scaffold(
      backgroundColor: HouseHoldColorResources.COLOR_SOLITUDE,

      appBar: AppBar(
        backgroundColor: HouseHoldColorResources.COLOR_PRIMARY,
        automaticallyImplyLeading: false,
        title: InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LocationScreen())),
          child: Row(children: [
            Icon(Icons.location_on, size: 30, color: HouseHoldColorResources.COLOR_WHITE),
            Text(Strings.new_york, style: manropeRegular.copyWith(fontSize: HouseHoldDimensions.FONT_SIZE_LARGE, color: HouseHoldColorResources.COLOR_WHITE)),
            Icon(Icons.arrow_drop_down, color: HouseHoldColorResources.COLOR_WHITE),
          ]),
        ),
        actions: [IconButton(
          icon: Icon(Icons.notifications, color: HouseHoldColorResources.COLOR_WHITE),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => HouseNotificationScreen())),
        )],
      ),

      body: Consumer<HouseHomeProvider>(
        builder: (context, home, child) {
          return ListView(physics: BouncingScrollPhysics(), children: [

            // Search
            Padding(
              padding: EdgeInsets.all(HouseHoldDimensions.PADDING_SIZE_LARGE),
              child: CustomTextField(
                hintText: Strings.search_your_service_here,
                inputAction: TextInputAction.search,
                inputType: TextInputType.text,
                prefixIcon: Icon(Icons.search, color: HouseHoldColorResources.COLOR_BLACK, size: 25),
                isBorder: false,
              ),
            ),

            // Best offer
            SizedBox(
              height: 120,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: home.offerList.length,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: HouseHoldDimensions.PADDING_SIZE_LARGE),
                itemBuilder: (context, index) {
                  return Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width * 0.85,
                    margin: EdgeInsets.only(right: HouseHoldDimensions.PADDING_SIZE_SMALL),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: HouseHoldColorResources.COLOR_PRIMARY),
                    child: Row(children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: HouseHoldDimensions.PADDING_SIZE_SMALL),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                            Text(home.offerList[index].title, style: manropeRegular.copyWith(
                              fontSize: HouseHoldDimensions.FONT_SIZE_LARGE,
                              color: HouseHoldColorResources.COLOR_WHITE,
                            )),
                            Text(home.offerList[index].description, style: manropeRegular.copyWith(
                              fontSize: 22,
                              color: HouseHoldColorResources.COLOR_WHITE,
                            )),
                          ]),
                        ),
                      ),
                      FadeInImage.assetNetwork(placeholder: Images.place_holder,placeholderCacheHeight: 150,placeholderCacheWidth: 150, image: home.offerList[index].image,fit: BoxFit.cover,)
                    ]),
                  );
                },
              ),
            ),

            // Service
            Container(
              margin: EdgeInsets.symmetric(vertical: HouseHoldDimensions.PADDING_SIZE_LARGE),
              padding: EdgeInsets.all(HouseHoldDimensions.PADDING_SIZE_LARGE),
              decoration: BoxDecoration(color: HouseHoldColorResources.COLOR_WHITE, borderRadius: BorderRadius.circular(20)),
              child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text(Strings.services, style: manropeMedium.copyWith(fontSize: HouseHoldDimensions.FONT_SIZE_LARGE)),
                  InkWell(
                    onTap: () => onTap(1),
                    child: Text(Strings.view_all, style: manropeLight.copyWith(color: HouseHoldColorResources.COLOR_CRANBERRY)),
                  ),
                ]),
                Consumer<ServiceProvider>(
                  builder: (context,serviceProvider,child)=>GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: (1/1.3),
                      crossAxisCount: 3,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                    ),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: HouseHoldDimensions.PADDING_SIZE_SMALL),
                    itemCount: serviceProvider.getAllService.length > 6 ? 6 : serviceProvider.getAllService.length,
                    itemBuilder: (context, index) {
                      return ServiceWidget(service: serviceProvider.getAllService[index],onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ServiceScreenTwo(selectIndex: index,)));
                      },);
                    },
                  ),
                ),

              ]),
            ),

            // Top Service
            Container(
              margin: EdgeInsets.only(bottom: HouseHoldDimensions.PADDING_SIZE_LARGE),
              padding: EdgeInsets.all(HouseHoldDimensions.PADDING_SIZE_LARGE),
              decoration: BoxDecoration(color: HouseHoldColorResources.COLOR_WHITE, borderRadius: BorderRadius.circular(20)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(Strings.top_services, style: manropeMedium.copyWith(fontSize: HouseHoldDimensions.FONT_SIZE_LARGE)),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(top: HouseHoldDimensions.PADDING_SIZE_SMALL),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: HouseHoldColorResources.COLOR_CARD_BG),
                      child: Row(children: [
                        Expanded(flex: 2, child: Container(
                          decoration: BoxDecoration(
                            color: HouseHoldColorResources.COLOR_PRIMARY.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: FadeInImage.assetNetwork(placeholder: Images.place_holder, image: index%2==0 ? Images.clean : Images.window_cleaning, fit: BoxFit.fill),
                        )),
                        Expanded(flex: 3, child: Padding(
                          padding: EdgeInsets.all(HouseHoldDimensions.PADDING_SIZE_EXTRA_SMALL),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text(index%2==0 ? Strings.floor_cleaning : Strings.service_in_town, style: manropeMedium.copyWith(fontSize: HouseHoldDimensions.FONT_SIZE_LARGE)),
                            SizedBox(height: HouseHoldDimensions.PADDING_SIZE_EXTRA_SMALL),
                            Text(Strings.all_kinds_of_home_cleaning, style: manropeLight.copyWith(color: HouseHoldColorResources.COLOR_CHARCOAL_HINT)),
                            SizedBox(height: HouseHoldDimensions.PADDING_SIZE_EXTRA_SMALL),
                            Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                              Icon(Icons.star, color: HouseHoldColorResources.COLOR_CRANBERRY, size: 15),
                              Icon(Icons.star, color: HouseHoldColorResources.COLOR_CRANBERRY, size: 15),
                              Icon(Icons.star, color: HouseHoldColorResources.COLOR_CRANBERRY, size: 15),
                              Icon(Icons.star, color: HouseHoldColorResources.COLOR_CRANBERRY, size: 15),
                              Icon(Icons.star, color: index%2==0 ? HouseHoldColorResources.COLOR_CRANBERRY : HouseHoldColorResources.COLOR_GREY, size: 15),
                              Expanded(child: SizedBox()),
                              Text('\$${index%2==0 ? 50 : 30}', style: manropeBold.copyWith(fontSize: 24, color: HouseHoldColorResources.COLOR_PRIMARY)),
                            ]),
                          ]),
                        )),
                      ]),
                    );
                  },
                ),
              ]),
            ),

          ]);
        },
      ),
    );
  }
}
