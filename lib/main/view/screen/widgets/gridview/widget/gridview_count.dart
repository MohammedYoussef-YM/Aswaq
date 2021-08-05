import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class GridViewCount extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('GridView Count'),
        backgroundColor: Color(0xff5050D5),
      ),
      body: SafeArea(
        child: GridView.count(
          padding: EdgeInsets.all(10),
          crossAxisCount: 2,
          childAspectRatio: 1/1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: [
            Container(
              alignment: Alignment.center,
              //padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.grey[200],spreadRadius: 0.5,blurRadius: 0.5)],
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15)),
                    child: Icon(Icons.person,color: Colors.white,),
                  ),
                  SizedBox(height: 5,),
                  Text('Person',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              //padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.grey[200],spreadRadius: 0.5,blurRadius: 0.5)],
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(15)),
                    child: Icon(Icons.home,color: Colors.white,),
                  ),
                  SizedBox(height: 5,),
                  Text('Home',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              //padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.grey[200],spreadRadius: 0.5,blurRadius: 0.5)],
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child:  Column( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15)),
                    child: Icon(Icons.explicit_outlined,color: Colors.white,),
                  ),
                  SizedBox(height: 5,),
                  Text('Explore',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              //padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.grey[200],spreadRadius: 0.5,blurRadius: 0.5)],
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child:  Column( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        borderRadius: BorderRadius.circular(15)),
                    child: Icon(Icons.edit_location_sharp,color: Colors.white,),
                  ),
                  SizedBox(height: 5,),
                  Text('Edit',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              //padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.grey[200],spreadRadius: 0.5,blurRadius: 0.5)],
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child:  Column( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(15)),
                    child: Icon(Icons.favorite,color: Colors.white,),
                  ),
                  SizedBox(height: 5,),
                  Text('Favourite',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              //padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.grey[200],spreadRadius: 0.5,blurRadius: 0.5)],
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child:  Column( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15)),
                    child: Icon(Icons.message,color: Colors.white,),
                  ),
                  SizedBox(height: 5,),
                  Text('message',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              //padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.grey[200],spreadRadius: 0.5,blurRadius: 0.5)],
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(15)),
                    child: Icon(Icons.notifications_active,color: Colors.white,),
                  ),
                  SizedBox(height: 5,),
                  Text('notification',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              //padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.grey[200],spreadRadius: 0.5,blurRadius: 0.5)],
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child:  Column( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(15)),
                    child: Icon(Icons.book_rounded,color: Colors.white,),
                  ),
                  SizedBox(height: 5,),
                  Text('eBook',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              //padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.grey[200],spreadRadius: 0.5,blurRadius: 0.5)],
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child:  Column( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.purpleAccent,
                        borderRadius: BorderRadius.circular(15)),
                    child: Icon(Icons.menu,color: Colors.white,),
                  ),
                  SizedBox(height: 5,),
                  Text('Menu',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              //padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.grey[200],spreadRadius: 0.2,blurRadius: 0.3)],
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child:  Column( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.lightGreenAccent,
                        borderRadius: BorderRadius.circular(15)),
                    child: Icon(Icons.settings,color: Colors.white,),
                  ),
                  SizedBox(height: 5,),
                  Text('Settings',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
