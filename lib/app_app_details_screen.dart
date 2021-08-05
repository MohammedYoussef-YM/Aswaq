import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_ui_kit/main/main_provider.dart';
import 'package:flutter_ui_kit/main/model/app_model.dart';
import 'package:flutter_ui_kit/main/utils/custom_theme.dart';
import 'package:provider/provider.dart';

class AllAppDetailsScreen extends StatelessWidget {
  final List<ScreenListModel> screenlists;
  final String screenName;
  final bool isOpenModalButtonSheet;

  AllAppDetailsScreen({this.screenlists, this.screenName, this.isOpenModalButtonSheet = false});

   final double _crossAxisSpacing = 10, _mainAxisSpacing = 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Color(0xff5050D5),
        title: Text(
          screenName,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal:18.0,vertical: 18),
          children: [
              StaggeredGridView.countBuilder(
                  padding: const EdgeInsets.symmetric(horizontal:12.0,vertical: 10),
                shrinkWrap: true,
                // 1st add
                physics: ClampingScrollPhysics(),
                // 2nd add
                itemCount: screenlists.length,
                crossAxisCount: 2,
                staggeredTileBuilder: (int index) => new StaggeredTile.count(2, .35),
                mainAxisSpacing: _mainAxisSpacing,
                crossAxisSpacing: _crossAxisSpacing,
                itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Provider.of<MainProvider>(context, listen: false).setThemeAndLocale(screenlists[index].app, context);
                        isOpenModalButtonSheet
                                ?screenlists[index].onTap()
                                : Navigator.push(context, MaterialPageRoute(builder: (_) => screenlists[index].widget));
                      },
                      child: Container(
                        height: 50,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal:10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: Offset(0, 1), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(4)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              screenlists[index].screenName,
                              style: poppinsMedium.copyWith(color: Color(0xff25282B),fontSize: 12),
                            ),
                            SizedBox(width: 8,),
                            Icon(Icons.arrow_forward_ios,size: 12,color: Color(0xff000000),)
                          ],
                        ),
                      ),
                    )),
          ],
        ),
    );
  }
}
