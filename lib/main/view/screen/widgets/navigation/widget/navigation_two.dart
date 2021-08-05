import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class NavigationTwo extends StatefulWidget {
  @override
  _IconNavigationState createState() => _IconNavigationState();
}

class _IconNavigationState extends State<NavigationTwo> {

  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('NavigationBar'),
        backgroundColor: Color(0xff5050D5),
      ),
      body: SafeArea(
        child: Center(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
              },
            children: [
              Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment:  CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.home,size: 50,color: Colors.green,),
                      Text('Home Button',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                    ],
                  ),
              ),

              Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment:  CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.messenger,size: 50,color: Colors.orangeAccent,),
                      Text('Inbox Button',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                    ],
                  ),
              ),

              Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment:  CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.home,size: 50,color: Colors.pinkAccent,),
                      Text('Settings Button',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                    ],
                  ),
              ),

              Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment:  CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.home,size: 50,color: Colors.purple,),
                      Text('More Button',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                    ],
                  ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Color(0xff5050D5),
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              activeColor: Colors.white,
              inactiveColor: Colors.grey[100],
              title: Text('Home',style: TextStyle(color: Colors.white),),
              icon: Icon(Icons.home,color: Colors.white,)
          ),
          BottomNavyBarItem(
              activeColor: Colors.white,
              inactiveColor: Colors.grey[100],
              title: Text('Inbox',style: TextStyle(color: Colors.white),),
              icon: Icon(Icons.chat_bubble,color: Colors.white,)
          ),
          BottomNavyBarItem(
              activeColor: Colors.white,
              inactiveColor: Colors.grey[100],
              title: Text('Settings',style: TextStyle(color: Colors.white),),
              icon: Icon(Icons.settings,color: Colors.white,)
          ),
          BottomNavyBarItem(
              activeColor: Colors.white,
              inactiveColor: Colors.grey[100],
              title: Text('More',style: TextStyle(color: Colors.white),),
              icon: Icon(Icons.apps,color: Colors.white,)

          ),
        ],
      ),
    );
  }
}
