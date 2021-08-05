import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/food/data/mock_data.dart';
import 'package:flutter_ui_kit/food/screens/widget/open_cart_bottom_sheet.dart';
import 'package:flutter_ui_kit/food/utility/dimensions.dart';
import 'package:flutter_ui_kit/food/utility/colorResources.dart';
import 'package:flutter_ui_kit/food/utility/images.dart';
import 'package:flutter_ui_kit/food/utility/strings.dart';
import 'package:flutter_ui_kit/food/utility/style.dart';

class CategoryScreen extends StatelessWidget {
  final String title;
  CategoryScreen({@required this.title});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () => Navigator.pop(context)),
                SizedBox(
                  width: Dimensions.PADDING_SIZE_DEFAULT,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: Dimensions.TEXT_SIZE_EXTRA_LARGE, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 22,
            ),
            //for search
            Padding(
              padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT, right: Dimensions.PADDING_SIZE_DEFAULT),
              child: SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  style: CustomStyle.textStyle,
                  controller: searchController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return Strings.FIELD_REQUIRED;
                    } else {
                      return null;
                    }
                  },
                  cursorColor: ColorResources.COLOR_PRIMARY,
                  decoration: InputDecoration(
                      hintText: Strings.SEARCH_KEYWORD,
                      hintStyle: CustomStyle.textStyle,
                      focusedBorder: CustomStyle.focusBorderStyle,
                      enabledBorder: CustomStyle.enableBorderStyle,
                      focusedErrorBorder: CustomStyle.enableBorderStyle,
                      errorBorder: CustomStyle.enableBorderStyle,
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      prefixIcon: Icon(
                        Icons.search,
                        color: ColorResources.COLOR_PRIMARY,
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: MockData.productList.length,
                  padding: EdgeInsets.only(top: 5,bottom: 20),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        openCartBottomSheet(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: Dimensions.PADDING_SIZE_DEFAULT,
                          right: Dimensions.PADDING_SIZE_DEFAULT,
                          top: 10,
                        ),
                        child: Container(
                          height: 100,
                          padding: const EdgeInsets.only(
                              left: Dimensions.PADDING_SIZE_DEFAULT, right: Dimensions.PADDING_SIZE_DEFAULT, top: 10.0),
                          decoration: BoxDecoration(
                            color: ColorResources.COLOR_WHITE,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Expanded(flex: 2, child: FadeInImage.assetNetwork(placeholder: Images.place_holder, image: MockData.productList[index].image,fit: BoxFit.fill,)),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                flex: 4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          MockData.productList[index].name,
                                          style: TextStyle(fontSize: Dimensions.TEXT_SIZE_DEFAULT, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        MockData.productList[index].description,
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
