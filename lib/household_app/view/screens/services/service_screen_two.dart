import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/household_app/data/models/service_model.dart';
import 'package:flutter_ui_kit/household_app/provider/service_provider.dart';
import 'package:flutter_ui_kit/household_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/household_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/household_app/utility/strings.dart';
import 'package:flutter_ui_kit/household_app/utility/style.dart';
import 'package:flutter_ui_kit/household_app/view/screens/services/service_details_screen.dart';
import 'package:flutter_ui_kit/household_app/view/screens/services/widget/service_widget.dart';
import 'package:flutter_ui_kit/household_app/view/screens/services/widget/sub_service_widget.dart';
import 'package:provider/provider.dart';

class ServiceScreenTwo extends StatelessWidget {
  final int selectIndex;

  ServiceScreenTwo({this.selectIndex = 0});

  @override
  Widget build(BuildContext context) {
    Provider.of<ServiceProvider>(context, listen: false).initializeAllService();
    Provider.of<ServiceProvider>(context, listen: false).changeSelectedIndex(selectIndex);
    return Scaffold(
      backgroundColor: HouseHoldColorResources.COLOR_SOLITUDE,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: HouseHoldColorResources.COLOR_WHITE), onPressed: () => Navigator.pop(context)),
        title: Text(
          Strings.all_services,
          style: manropeMedium.copyWith(
            color: HouseHoldColorResources.COLOR_WHITE,
            fontSize: HouseHoldDimensions.FONT_SIZE_LARGE,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: HouseHoldColorResources.COLOR_PRIMARY,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: HouseHoldDimensions.PADDING_SIZE_LARGE),
        child: Consumer<ServiceProvider>(
          builder: (context, searchProvider, child) {
            return searchProvider.getAllService.length != 0
                ? Row(children: [
                    Container(
                      width: 112,
                      margin: EdgeInsets.only(top: 3),
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: HouseHoldColorResources.COLOR_WHITE,
                        boxShadow: [BoxShadow(color: Colors.grey[200], spreadRadius: 3, blurRadius: 10)],
                      ),
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: searchProvider.getAllService.length,
                        padding: EdgeInsets.all(0),
                        itemBuilder: (context, index) {
                          ServiceModel _service = searchProvider.getAllService[index];
                          return ServiceWidget(
                            service: _service,
                            isSubService: true,
                            isSelectService: searchProvider.categorySelectedIndex == index ? true : false,
                            onTap: () {
                              Provider.of<ServiceProvider>(context, listen: false).changeSelectedIndex(index);
                            },
                            //isSelected: searchProvider.categorySelectedIndex == index,
                          );
                        },
                      ),
                    ),
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(HouseHoldDimensions.PADDING_SIZE_EXTRA_SMALL),
                        color: HouseHoldColorResources.COLOR_WHITE,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(HouseHoldDimensions.PADDING_SIZE_SMALL),
                            child: Text(
                              '${searchProvider.getAllService[searchProvider.categorySelectedIndex].serviceSubList.length}${Strings.services_in_painting}${searchProvider.getAllService[searchProvider.categorySelectedIndex].title}',
                              style: manropeLight,
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.only(left: HouseHoldDimensions.PADDING_SIZE_SMALL, top: HouseHoldDimensions.PADDING_SIZE_SMALL),
                              itemCount: searchProvider.getAllService[searchProvider.categorySelectedIndex].serviceSubList.length,
                              itemBuilder: (context, index) {
                                ServiceModel _service = searchProvider.getAllService[searchProvider.categorySelectedIndex].serviceSubList[index];
                                return SubServiceWidget(
                                  service: _service,
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (_) => ServiceDetailsScreen(
                                              service: _service,
                                              selectedServiceIndex: searchProvider.categorySelectedIndex,
                                          selectedSubServiceIndex: index,
                                            )));
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )),
                  ])
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
