
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/utils/images.dart';


class GridViewCustom extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('GridView Custom'),
        backgroundColor: Color(0xff5050D5),
      ),
      body: SafeArea(
        child: GridView.custom(
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1/1.4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10
          ),
          childrenDelegate: SliverChildListDelegate(
            [

              Container( margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                    boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), spreadRadius: 1, blurRadius: 5)],
                  ),

                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                        // Product Image
                        Container(
                          height: 150,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                          ),
                          child: FadeInImage.assetNetwork(
                            placeholder: MainAppImages.place_holder,
                            image: MainAppImages.widget_four,fit: BoxFit.fill,),
                        ),

                        // Product Details
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text('Apple',style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(height: 5),

                              Row(children: [
                                Text('\$50 - \$230',
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                                SizedBox(width: 5,),
                                Text('\$ 300', style: TextStyle(color: Colors.grey[600], decoration: TextDecoration.lineThrough, fontSize: 10,)),
                                Expanded(child: SizedBox.shrink()),
                                Text('3.8'),
                                Icon(Icons.star_half, color:Colors.orangeAccent,size: 15),
                              ]),
                            ],
                          ),
                        ),
                      ]),

                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          height: 20,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                          ),
                          child: Center(
                            child: Text('10% Off',
                              style: TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),

              Container( margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                    boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), spreadRadius: 1, blurRadius: 5)],
                  ),

                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                        // Product Image
                        Container(
                          height: 150,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                          ),
                          child: FadeInImage.assetNetwork(
                            placeholder: MainAppImages.place_holder,
                            image: MainAppImages.widget_three,fit: BoxFit.fill,),
                        ),

                        // Product Details
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text('Tomato',style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(height: 5),

                              Row(children: [
                                Text('\$20 - \$200',
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                                SizedBox(width: 5,),
                                Text('\$ 250', style: TextStyle(color: Colors.grey[600], decoration: TextDecoration.lineThrough, fontSize: 10,)),
                                Expanded(child: SizedBox.shrink()),
                                Text('4.8'),
                                Icon(Icons.star, color:Colors.orangeAccent,size: 15),
                              ]),
                            ],
                          ),
                        ),
                      ]),

                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          height: 20,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                          ),
                          child: Center(
                            child: Text('10% Off',
                              style: TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
              Container( margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                    boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), spreadRadius: 1, blurRadius: 5)],
                  ),

                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                        // Product Image
                        Container(
                          height: 150,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                          ),
                          child: FadeInImage.assetNetwork(
                            placeholder: MainAppImages.place_holder,
                            image: MainAppImages.widget_nine,fit: BoxFit.fill,),
                        ),

                        // Product Details
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text('Potato',style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(height: 4),

                              Row(children: [
                                Text('\$90 - \$230',
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                                SizedBox(width: 4,),
                                Text('\$ 200', style: TextStyle(color: Colors.grey[600], decoration: TextDecoration.lineThrough, fontSize: 10,)),
                                Expanded(child: SizedBox.shrink()),
                                Text('3.4'),
                                Icon(Icons.star_border_sharp, color:Colors.orangeAccent,size: 15),
                              ]),
                            ],
                          ),
                        ),
                      ]),

                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          height: 20,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                          ),
                          child: Center(
                            child: Text('10% Off',
                              style: TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
              Container( margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                    boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), spreadRadius: 1, blurRadius: 5)],
                  ),

                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                        // Product Image
                        Container(
                          height: 150,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                          ),
                          child: FadeInImage.assetNetwork(
                            placeholder: MainAppImages.place_holder,
                            image: MainAppImages.widget_five,fit: BoxFit.fill,),
                        ),

                        // Product Details
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text('Coconut',style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(height: 5),

                              Row(children: [
                                Text('\$50 - \$130',
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                                SizedBox(width: 5,),
                                Text('\$ 200', style: TextStyle(color: Colors.grey[600], decoration: TextDecoration.lineThrough, fontSize: 10,)),
                                Expanded(child: SizedBox.shrink()),
                                Text('4.8'),
                                Icon(Icons.star, color:Colors.orangeAccent,size: 15),
                              ]),
                            ],
                          ),
                        ),
                      ]),

                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          height: 20,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                          ),
                          child: Center(
                            child: Text('10% Off',
                              style: TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
              Container( margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                    boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), spreadRadius: 1, blurRadius: 5)],
                  ),

                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                        // Product Image
                        Container(
                          height: 150,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                          ),
                          child: FadeInImage.assetNetwork(
                            placeholder: MainAppImages.place_holder,
                            image: MainAppImages.widget_seven,fit: BoxFit.fill,),
                        ),

                        // Product Details
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text('Nut',style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(height: 5),

                              Row(children: [
                                Text('\$20 - \$100',
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                                SizedBox(width: 5,),
                                Text('\$ 150', style: TextStyle(color: Colors.grey[600], decoration: TextDecoration.lineThrough, fontSize: 10,)),
                                Expanded(child: SizedBox.shrink()),
                                Text('3.8'),
                                Icon(Icons.star_outline_sharp, color:Colors.orangeAccent,size: 15),
                              ]),
                            ],
                          ),
                        ),
                      ]),

                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          height: 20,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                          ),
                          child: Center(
                            child: Text('10% Off',
                              style: TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
              Container( margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300],
                  boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), spreadRadius: 1, blurRadius: 5)],
                ),

                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                      // Product Image
                      Container(
                        height: 150,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                        ),
                        child: FadeInImage.assetNetwork(
                          placeholder: MainAppImages.place_holder,
                          image: MainAppImages.widget_six,fit: BoxFit.fill,),
                      ),

                      // Product Details
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text('Tomato',style: TextStyle(fontWeight: FontWeight.bold),),
                            SizedBox(height: 5),

                            Row(children: [
                              Text('\$50 - \$230',
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                              SizedBox(width: 5,),
                              Text('\$ 200', style: TextStyle(color: Colors.grey[600], decoration: TextDecoration.lineThrough, fontSize: 10,)),
                              Expanded(child: SizedBox.shrink()),
                              Text('3.8'),
                              Icon(Icons.star, color:Colors.orangeAccent,size: 15),
                            ]),
                          ],
                        ),
                      ),
                    ]),

                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        height: 20,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                        ),
                        child: Center(
                          child: Text('10% Off',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
              Container( margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300],
                  boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), spreadRadius: 1, blurRadius: 5)],
                ),

                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                      // Product Image
                      Container(
                        height: 150,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                        ),
                        child: FadeInImage.assetNetwork(
                          placeholder: MainAppImages.place_holder,
                          image: MainAppImages.widget_eight,fit: BoxFit.fill,),
                      ),

                      // Product Details
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text('Apple',style: TextStyle(fontWeight: FontWeight.bold),),
                            SizedBox(height: 5),

                            Row(children: [
                              Text('\$50 - \$230',
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                              SizedBox(width: 5,),
                              Text('\$ 200', style: TextStyle(color: Colors.grey[600], decoration: TextDecoration.lineThrough, fontSize: 10,)),
                              Expanded(child: SizedBox.shrink()),
                              Text('3.8'),
                              Icon(Icons.star, color:Colors.orangeAccent,size: 15),
                            ]),
                          ],
                        ),
                      ),
                    ]),

                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        height: 20,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                        ),
                        child: Center(
                          child: Text('10% Off',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
              Container( margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                    boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), spreadRadius: 1, blurRadius: 5)],
                  ),

                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                        // Product Image
                        Container(
                          height: 150,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                          ),
                          child: FadeInImage.assetNetwork(
                            placeholder: MainAppImages.place_holder,
                            image: MainAppImages.widget_six,fit: BoxFit.fill,),
                        ),

                        // Product Details
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text('Apple',style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(height: 5),

                              Row(children: [
                                Text('\$50 - \$230',
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                                SizedBox(width: 5,),
                                Text('\$ 200', style: TextStyle(color: Colors.grey[600], decoration: TextDecoration.lineThrough, fontSize: 10,)),
                                Expanded(child: SizedBox.shrink()),
                                Text('3.8'),
                                Icon(Icons.star, color:Colors.orangeAccent,size: 15),
                              ]),
                            ],
                          ),
                        ),
                      ]),

                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          height: 20,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                          ),
                          child: Center(
                            child: Text('10% Off',
                              style: TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
              Container( margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                    boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), spreadRadius: 1, blurRadius: 5)],
                  ),

                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                        // Product Image
                        Container(
                          height: 150,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                          ),
                          child: FadeInImage.assetNetwork(
                            placeholder: MainAppImages.place_holder,
                            image: MainAppImages.widget_four,fit: BoxFit.fill,),
                        ),

                        // Product Details
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text('Apple',style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(height: 5),

                              Row(children: [
                                Text('\$50 - \$230',
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                                SizedBox(width: 5,),
                                Text('\$ 200', style: TextStyle(color: Colors.grey[600], decoration: TextDecoration.lineThrough, fontSize: 10,)),
                                Expanded(child: SizedBox.shrink()),
                                Text('3.8'),
                                Icon(Icons.star, color:Colors.orangeAccent,size: 15),
                              ]),
                            ],
                          ),
                        ),
                      ]),

                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          height: 20,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                          ),
                          child: Center(
                            child: Text('10% Off',
                              style: TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
              Container( margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                    boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), spreadRadius: 1, blurRadius: 5)],
                  ),

                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                        // Product Image
                        Container(
                          height: 150,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                          ),
                          child: FadeInImage.assetNetwork(
                            placeholder: MainAppImages.place_holder,
                            image: MainAppImages.widget_three,fit: BoxFit.fill,),
                        ),

                        // Product Details
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text('Apple',style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(height: 5),

                              Row(children: [
                                Text('\$50 - \$230',
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                                SizedBox(width: 5,),
                                Text('\$ 200', style: TextStyle(color: Colors.grey[600], decoration: TextDecoration.lineThrough, fontSize: 10,)),
                                Expanded(child: SizedBox.shrink()),
                                Text('3.8'),
                                Icon(Icons.star, color:Colors.orangeAccent,size: 15),
                              ]),
                            ],
                          ),
                        ),
                      ]),

                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          height: 20,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                          ),
                          child: Center(
                            child: Text('10% Off',
                              style: TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),


            ]
          ),
        ),
      ),
    );
  }
}
