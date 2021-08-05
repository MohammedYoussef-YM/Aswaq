import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class ProgressBarIndicator extends StatefulWidget {
  @override
  _ProgressIndicatorState createState() => _ProgressIndicatorState();
}

class _ProgressIndicatorState extends State<ProgressBarIndicator> with SingleTickerProviderStateMixin {
  // for circular loading
  bool _loading = false;

  void _onLoading() {
    setState(() {
      _loading = true;
      Future.delayed( Duration(seconds: 1), _login);
    });
  }

  Future _login() async{
    setState((){
      _loading = false;
    });
  }

  //for animated linearProgress Indicator
  AnimationController animationController;
  Animation<double> animation;

 //for animated linearProgress Indicator
  @override
  void initState() {

    animationController = AnimationController(
        vsync: this,
        duration: Duration(seconds: 15));
    animation = CurvedAnimation(parent: animationController, curve: Curves.elasticOut);
    animationController.addListener(() {
      this.setState(() {

      });
    });
    animation.addStatusListener((AnimationStatus status) {});
    animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animationValue=animationController.value *100;
    var body = SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(left: 10,top: 30,right: 10,bottom: 20),
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            //for Headline
            Text('Circular Progress Indicator',style: TextStyle(fontSize: 18)),
            SizedBox(height: 10,),
            Text('This is the Example of circular progress indicator',style: TextStyle(fontSize: 14)),
            SizedBox(height: 20,),
            Text('Circular Progressbar Indicator',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            Divider(height: 5,thickness: 2,indent: 40,endIndent: 40,),
            SizedBox(height: 25,),

            //for progress indicator
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              CircularProgressIndicator(),
              SizedBox(width: 30,),
              CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey[300],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.red),strokeWidth: 2,),
                  )),
              SizedBox(width: 30,),
              CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey[200],
                  child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.green),strokeWidth: 5,)),
                SizedBox(height: 20,),
            ],),
            SizedBox(height: 20,),
            SizedBox(
              height: 120,
              width: 200,
              child: LiquidCircularProgressIndicator(
                value: animationController.value,
                valueColor: AlwaysStoppedAnimation(Colors.green),
                backgroundColor: Colors.white,
                borderColor: Colors.black54,
                borderWidth: 0.0,
                direction: Axis.vertical,
                center: Text('${animationValue.toStringAsFixed(0)}%',
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              alignment: Alignment.center,
              height: 50,
              width: MediaQuery.of(context).size.width/1,
              padding: EdgeInsets.symmetric(horizontal: 6,vertical: 6),
              margin: EdgeInsets.symmetric(horizontal: 12,vertical: 6),
              child: LiquidCircularProgressIndicator(
                value: animationController.value,
                valueColor: AlwaysStoppedAnimation(Colors.amber),
                backgroundColor: Colors.blueAccent[100],
                direction: Axis.horizontal,
                center: Text('${animationValue.toStringAsFixed(0)}%',
                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              child: LiquidCustomProgressIndicator(
                value: animationController.value,
                valueColor: AlwaysStoppedAnimation(Colors.red),
                backgroundColor: Colors.white,
                direction: Axis.vertical,
                shapePath: _buildPath(),
                center: Text('${animationValue.toStringAsFixed(0)}%',
                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.amber),),
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: _onLoading,child: Text('Show Indicator'),),



            //for animated progress indicator
            SizedBox(height: 30,),
            Text('LinearProgressbar Indicator',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            Divider(height: 5,thickness: 2,indent: 40,endIndent: 40,),
            SizedBox(height: 30,),
            LinearProgressIndicator(backgroundColor: Colors.grey,),
            SizedBox(height: 30,),
            Container(
              color: Color(0xff5050D5),
              height: 3.0,
              width: animation.value * 100.0,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5.0),
            ),
            Container(
              color: Colors.blue[300],
              height: 3.0,
              width: animation.value * 75.0,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5.0),
            ),
            Container(
              color: Color(0xff5050D5),
              height: 3.0,
              width: animation.value * 50.0,
            ),
          ],
        ),
      ),
    );

    var bodyProgress = new Container(
      child: Stack(
        children: <Widget>[
          body,
          Container(
            alignment: AlignmentDirectional.center,
            decoration:  BoxDecoration(
              color: Colors.white70,
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xff5050D5),
                  borderRadius: BorderRadius.circular(10.0)
              ),
              width: 200.0,
              height: 150.0,
              alignment: AlignmentDirectional.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: SizedBox(
                      height: 40.0,
                      width: 40.0,
                      child: CircularProgressIndicator(
                        value: null,
                        strokeWidth: 5.0,
                        valueColor: AlwaysStoppedAnimation(Colors.white)
                      ),
                    ),
                  ),
                  Container(
                    margin:  EdgeInsets.only(top: 15.0),
                    child: Center(
                      child: Text(
                        "loading...",
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('ProgressBarIndicator Widget'),
        backgroundColor: Color(0xff5050D5),
      ),
      body:Container(
          child: _loading ? bodyProgress : body
      ),
    );
  }

  Path _buildPath(){
    return Path()
        ..moveTo(55, 15)
        ..cubicTo(55, 12, 50, 0, 30, 0)
        ..cubicTo(0, 0, 0, 37.5, 0, 37.5)
        ..cubicTo(0, 55, 20, 77, 55, 95)
        ..cubicTo(90, 77, 110, 55, 110, 37.5)
        ..cubicTo(110, 37.5, 110, 0, 80, 0)
        ..cubicTo(65, 0, 55, 12, 55, 15)
        ..close();
  }
}
