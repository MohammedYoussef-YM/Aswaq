import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/utils/images.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';


class WaveWidgetScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Wave Widget'),
        backgroundColor: Color(0xff5050D5),
      ),
      body: SafeArea(
        child: Stack(clipBehavior: Clip.none,
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(left: 10,top: 30,right: 10,bottom: 20),
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //for Headline
                  Text('Example of WaveWidget',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  Divider(height: 5,indent: 50,endIndent: 50,thickness: 2,),
                  SizedBox(height: 70,),
                  //for positioned
                  Column(
                    children: [
                      SizedBox(
                        height: 200,
                        child: WaveWidget(
                          config: CustomConfig(
                            gradients: [
                              [Colors.red, Color(0xEEF44336)],
                              [Colors.red[800], Color(0x77E57373)],
                              [Colors.orange, Color(0x66FF9800)],
                              [Colors.yellow, Color(0x55FFEB3B)]
                            ],
                            durations: [35000, 19440, 10800, 6000],
                            heightPercentages: [0.20, 0.23, 0.25, 0.30],
                            blur: MaskFilter.blur(BlurStyle.solid, 1),
                            gradientBegin: Alignment.bottomLeft,
                            gradientEnd: Alignment.topRight,
                          ),
                          waveAmplitude: 0,
                          backgroundImage: DecorationImage(
                            image: NetworkImage(MainAppImages.motion_three),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(Colors.white, BlendMode.softLight),
                          ),
                          size: Size(
                            double.infinity,
                            double.infinity,
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      SizedBox(
                        height: 200,
                        child: WaveWidget(
                          config: CustomConfig(
                            gradients: [
                              [Colors.blue[100], Color(0xff92C1E3)],
                              [Colors.blue[200], Color(0xff87C8F7)],
                              [Colors.blue[300], Color(0xff6DADDC)],
                              [Colors.white, Color(0xffFAFDFE)]
                            ],
                            durations: [35000, 19440, 10800, 6000],
                            heightPercentages: [0.20, 0.23, 0.25, 0.30],
                            blur: MaskFilter.blur(BlurStyle.solid, 1),
                            gradientBegin: Alignment.bottomLeft,
                            gradientEnd: Alignment.bottomCenter,
                          ),
                          waveAmplitude: 10,
                         backgroundColor: Colors.blue,
                         /* backgroundImage: DecorationImage(
                            image: NetworkImage(
                              'https://images.unsplash.com/photo-1600107363560-a2a891080c31?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=672&q=80',
                            ),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(Colors.white, BlendMode.softLight),
                          ),*/
                          size: Size(
                            double.infinity,
                            double.infinity,
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      SizedBox(
                        height: 200,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(400)
                          ),
                          child: WaveWidget(
                            waveFrequency: 5,
                            config: CustomConfig(
                              gradients: [
                                [Colors.pink[400], Color(0xffF666CA)],
                                [Colors.pink[300], Color(0x77E57373)],
                                [Colors.pink[200], Color(0xffF49AF2)],
                                [Colors.pink[100], Color(0xffFAAFF8)]
                              ],
                              durations: [35000, 19440, 10800, 6000],
                              heightPercentages: [0.20, 0.23, 0.25, 0.30],
                              blur: MaskFilter.blur(BlurStyle.solid, 1),
                              gradientBegin: Alignment.bottomRight,
                              gradientEnd: Alignment.bottomRight,
                            ),
                            waveAmplitude: 0,
                            backgroundColor: Colors.white,
                            size: Size(
                              double.infinity,
                              double.infinity,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
