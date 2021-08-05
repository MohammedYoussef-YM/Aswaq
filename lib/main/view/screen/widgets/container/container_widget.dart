import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/utils/images.dart';


class ContainerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Container Widget'),
        backgroundColor: Color(0xff5050D5),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(height: 20,),
              
              // for color container
              Text('Coloring Container',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Divider(height: 2,color: Colors.grey,thickness: 3,),
              SizedBox(height: 20,),
              Container(
                height: 50,
                  color: Colors.orangeAccent,),
              Container(
                height: 50,
                color: Colors.blueAccent,),
              SizedBox(height: 50,),
              
              // for gradient color container
              Text('Gradient Coloring Container',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Divider(height: 2,color: Colors.grey,thickness: 3,),
              SizedBox(height: 20,),
              Container(
                height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.greenAccent,Colors.redAccent]
                    )
                  ),
                 ),
              Container(
                height: 50,
                  decoration: BoxDecoration(
                      gradient: RadialGradient(
                          colors: [Colors.greenAccent,Colors.redAccent,Colors.blue]
                      ),
                  ),
              ),
              SizedBox(height: 50,),
              
              //for margin container
              Text('margin on Container',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Divider(height: 2,color: Colors.grey,thickness: 3,),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(left: 20),
                  color: Colors.grey[400],
                  child: Text('margin left')),
              SizedBox(height: 10,),
              Container(
                  margin: EdgeInsets.only(right: 20),
                  color: Colors.grey[400],
                  child: Text('margin Right')),
              SizedBox(height: 10,),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  color: Colors.grey[400],
                  child: Text('margin horizontal')),
              SizedBox(height: 50,),
              
              
              //for padding container
              Text('padding on Container',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Divider(height: 2,color: Colors.grey,thickness: 3,),
              SizedBox(height: 20,),
              Container(
                  padding: EdgeInsets.only(left: 20),
                  color: Colors.grey[400],
                  child: Text('padding left')),
              SizedBox(height: 10,),
              Container(
                  padding: EdgeInsets.only(right: 20),
                  color: Colors.grey[400],
                  child: Text('padding Right')),
              SizedBox(height: 10,),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  color: Colors.grey[400],
                  child: Text('padding horizontal')),
              SizedBox(height: 10,),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  color: Colors.grey[400],
                  child: Text('padding vertical')),
              SizedBox(height: 50,),
              
              //for border container
              Text('Border on Container',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Divider(height: 2,color: Colors.grey,thickness: 3,),
              SizedBox(height: 20,),
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1,),
                  ),
                  child: Text('border all')),
              SizedBox(height: 10,),
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1,color: Colors.green),
                  ),
                  child: Text('border all with color')),
              SizedBox(height: 10,),
              Container(
                  decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            color: Color.fromRGBO(255, 167, 38, 1),
                            width: 5),
                      )),
                  child: Text(' top side border')),
              SizedBox(height: 10,),
              Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Color.fromRGBO(255, 167, 38, 1),
                        width: 5),
                      top: BorderSide(
                        color: Color.fromRGBO(255, 167, 38, 1),
                        width: 5),
                  )),
                  child: Text(' 2 side border')),
              SizedBox(height: 10,),
              Container(
                  decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                            color: Colors.green,
                            width: 10),
                        right: BorderSide(
                            color: Colors.blueAccent,
                            width: 10),
                        top: BorderSide(
                            color: Colors.orangeAccent,
                            width: 5),
                        bottom: BorderSide(
                            color: Colors.pink,
                            width: 5),
                      )),
                  child: Text(' All side border')),
              SizedBox(height: 50,),

              //for radius container
              Text('Radius on Container',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Divider(height: 2,color: Colors.grey,thickness: 3,),
              SizedBox(height: 20,),
              Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1,),
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Text('Radius all Border')),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 3,),
                      borderRadius: BorderRadius.only(topRight: Radius.circular(30),bottomLeft: Radius.circular(30)),
                  ),
                  child: Text(' Radius Border topRight and bottomLeft')),
              SizedBox(height: 10,),
              Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 3,),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
                  ),
                  child: Text(' Radius Border topRight and topLeft')),
              SizedBox(height: 10,),
              Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 3,),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30)),
                  ),
                  child: Text(' Radius Border topLeft and bottomLeft')),
              SizedBox(height: 10,),
              Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(width: 3,),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Text(' Radius Border with color',style: TextStyle(color: Colors.white),)),
              SizedBox(height: 50,),

              //for radius container
              Text('Radius on Container and Image',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Divider(height: 2,color: Colors.grey,thickness: 3,),
              SizedBox(height: 20,),
              Container(
                width: 200.0,
                height: 200.0,
                padding: EdgeInsets.all(10),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: FadeInImage.assetNetwork(
                        placeholder: MainAppImages.place_holder,
                        image: MainAppImages.widget_six,fit: BoxFit.cover)
                ),
              )
            ],),
        ),
      ),
    );
  }
}
