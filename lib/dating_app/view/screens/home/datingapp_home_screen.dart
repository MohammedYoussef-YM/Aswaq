import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:flutter_ui_kit/dating_app/data/models/dating_model.dart';
import 'package:flutter_ui_kit/dating_app/provider/dating_app_home_provider.dart';
import 'package:flutter_ui_kit/dating_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/dating_app/utility/dating_image.dart';
import 'package:flutter_ui_kit/dating_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/dating_app/utility/strings.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';
import 'package:flutter_ui_kit/dating_app/view/screens/home/widget/choice_widget.dart';
import 'package:flutter_ui_kit/dating_app/view/screens/home/widget/location_widget.dart';
import 'package:provider/provider.dart';

class DatingAppHomeScreen extends StatefulWidget {
  @override
  _DatingAppHomeScreenState createState() => _DatingAppHomeScreenState();
}

class _DatingAppHomeScreenState extends State<DatingAppHomeScreen> with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    Provider.of<DatingAppHomeProvider>(context, listen: false).initializeDatingData();
    Provider.of<DatingAppHomeProvider>(context, listen: false).initializeLocationData();
  }


  @override
  Widget build(BuildContext context) {

    CardController controller; //Use this to trigger swap.
    return Scaffold(
      backgroundColor: ColorResources.COLOR_PRIMARY,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 30,
                    width: 109,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT),
                    decoration:
                        BoxDecoration(color: ColorResources.COLOR_WHITE, borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_DEFAULT)),
                    child: InkWell(
                      onTap: (){
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: LocationWidget(),
                              );
                            });
                      },
                      child: Consumer<DatingAppHomeProvider>(
                        builder: (context,homeProvider,child)=>Row(
                          children: [
                            Image.asset(
                              'assets/dating_app/icon/location.png',
                              width: 8,
                              height: 12,
                              fit: BoxFit.fill,
                              color: ColorResources.COLOR_DARK_ORANGE,
                            ),
                            SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            Expanded(
                              child: Text(
                                homeProvider.initializeLocation,
                                style: robotoMedium.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                              ),
                            ),
                            Icon(Icons.keyboard_arrow_down,color: ColorResources.COLOR_GREY_GONDOLA,size: 20,),
                            SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 81,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT),
                    decoration:
                        BoxDecoration(color: ColorResources.COLOR_WHITE, borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_DEFAULT)),
                    child: InkWell(
                      onTap: (){
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: ChoiceWidget(),
                              );
                            });
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/dating_app/icon/filter.png',
                            width: 8,
                            height: 12,
                            fit: BoxFit.fill,
                            color: ColorResources.COLOR_DARK_ORANGE,
                          ),
                          SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          Text(Strings.filters, style: robotoMedium.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
              Expanded(
                child: Consumer<DatingAppHomeProvider>(
                    builder: (context, homeProvider, child) => Container(
                      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                      height: MediaQuery.of(context).size.height/1,
                      decoration:
                      BoxDecoration(color: ColorResources.COLOR_WHITE, borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_DEFAULT)),
                      child: new TinderSwapCard(
                        swipeUp: true,
                        swipeDown: true,
                        orientation: AmassOrientation.BOTTOM,
                        totalNum: homeProvider.getAllDatingModels.length * 100,
                        stackNum: 2,
                        swipeEdge: 4.0,
                        maxWidth: MediaQuery.of(context).size.width*0.9,
                        maxHeight: MediaQuery.of(context).size.height*0.9,
                        minWidth: MediaQuery.of(context).size.width*0.7,
                        minHeight: MediaQuery.of(context).size.height*0.7,
                        cardBuilder: (BuildContext context, int index)=> _cardWidget(homeProvider.getAllDatingModels[index < homeProvider.getAllDatingModels.length ? index : index%homeProvider.getAllDatingModels.length],controller),
                        cardController: controller = CardController(),
                        swipeUpdateCallback: (DragUpdateDetails details,Alignment align){
                          if(align.x < 0){
                            //Card swipe left
                          }else if(align.x > 0){
                            //Card swipe right
                          }
                        },
                        swipeCompleteCallback: (CardSwipeOrientation orientation,int index){
                        },
                          ),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardWidget(DatingModel datingModel,CardController controller) {
    return Container(
      decoration: BoxDecoration(color: ColorResources.COLOR_WHITE),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius:BorderRadius.circular(Dimensions.PADDING_SIZE_DEFAULT),
                child: FadeInImage.assetNetwork(
                  placeholder: DatingImages.place_holder_dating,
                  image:  datingModel.imageUrl,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.width - 40,
                  width: double.infinity,)
              ),

              Positioned(
                  bottom: -10,
                  right: MediaQuery.of(context).size.width / 4,
                  child: Container(
                    width: 128,
                    height: 30,
                    decoration: BoxDecoration(
                        color: ColorResources.COLOR_DARK_ORANGE, borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_DEFAULT)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/dating_app/icon/heart.png',
                          color: ColorResources.COLOR_WHITE,
                          width: 18,
                          height: 18,
                        ),
                        SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                        Text(
                          datingModel.percentMatch,
                          style: robotoMedium.copyWith(color: ColorResources.COLOR_WHITE),
                        )
                      ],
                    ),
                  ))
            ],
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(datingModel.name,style: robotoMedium.copyWith(fontSize: 28.0),),
              Text(Strings.yr,style: robotoRegular.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE),),
            ],
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT,),
          Text(datingModel.subtitle,style: robotoLight.copyWith(fontSize: 13),textAlign: TextAlign.center,),
          SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/dating_app/icon/star.png',
                width: 40,
                height: 40,
              ),
              InkWell(
                onTap: () => controller.triggerLeft(),
                child: Image.asset(
                  'assets/dating_app/icon/cancel.png',
                  width: 85,
                  height: 90,
                ),
              ),
              InkWell(
                onTap: () => controller.triggerRight(),
                child: Image.asset(
                  'assets/dating_app/icon/favourite.png',
                  width: 85,
                  height: 90,
                ),
              ),
              Image.asset(
                'assets/dating_app/icon/bost.png',
                width: 40,
                height: 40,
              ),
            ],
          )
        ],
      ),
    );
  }
}
