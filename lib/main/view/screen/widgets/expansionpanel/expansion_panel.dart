import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/utils/strings.dart';

class ExpansionPanelWidget extends StatefulWidget {
  CriteriaState createState() => new CriteriaState();
}

class NewItem {
  bool isExpanded;
  final String header;
  final Widget body;
  final Icon iconPic;
  NewItem(this.isExpanded, this.header, this.body, this.iconPic);
}

class CriteriaState extends State<ExpansionPanelWidget> {

  //for Item List
  List<NewItem> items = <NewItem>[

    NewItem( false,'Expansion 1',
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(Strings.CLIPRREACT,style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        Icon(Icons.person)),

    NewItem( false,'Expansion 2',
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(Strings.CLIPRREACT,style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        Icon(Icons.person)),

    NewItem( false,'Expansion 3',
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(Strings.CLIPRREACT,style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        Icon(Icons.person)),

    NewItem( false,'Expansion 4',
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(Strings.CLIPRREACT,style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        Icon(Icons.person)),

    NewItem( false,'Expansion 5',
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(Strings.CLIPRREACT,style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        Icon(Icons.person)),

    NewItem( false,'Expansion 6',
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(Strings.CLIPRREACT,style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        Icon(Icons.person)),
    NewItem( false,'Expansion 7',
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(Strings.CLIPRREACT,style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        Icon(Icons.person)),
    NewItem( false,'Expansion 8',
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(Strings.CLIPRREACT,style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        Icon(Icons.person)),
    NewItem( false,'Expansion 9',
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(Strings.CLIPRREACT,style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        Icon(Icons.person)),
    NewItem( false,'Expansion 10',
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(Strings.CLIPRREACT,style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        Icon(Icons.person)),
    NewItem( false,'Expansion 11',
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(Strings.CLIPRREACT,style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        Icon(Icons.person)),
    NewItem( false,'Expansion 12',
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(Strings.CLIPRREACT,style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        Icon(Icons.person)),
  ];

  ListView itemList;
  Widget build(BuildContext context) {
    itemList = ListView(
      children: [
        Padding(
          padding: new EdgeInsets.all(10.0),
          child: new ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                items[index].isExpanded = !items[index].isExpanded;
              });
            },
            children: items.map((NewItem item) {
              return  ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return  ListTile(
                      leading: item.iconPic,
                      title: Text(
                        item.header,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ));
                },
                isExpanded: item.isExpanded,
                body: item.body,
              );
            }).toList(),
          ),
        )
      ],
    );

    Scaffold scaffold = Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Expansion Widget"),
        backgroundColor: Color(0xff5050D5),
      ),
      body: itemList
    );
    return scaffold;
  }
}