import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/utils/images.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/motion/details_page.dart';
import 'package:showcaseview/showcaseview.dart';


class ShowCase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Show Case'),
          backgroundColor: Color(0xff5050D5),
        ),
        body: ShowCaseWidget(
          builder: Builder(builder: (context) => MailPage()),
          autoPlay: true,
          autoPlayDelay: Duration(seconds: 3),
          autoPlayLockEnable: true,
        ),
    );
  }
}

class MailPage extends StatefulWidget {
  @override
  _MailPageState createState() => _MailPageState();
}

class _MailPageState extends State<MailPage> {
  GlobalKey _one = GlobalKey();
  GlobalKey _two = GlobalKey();
  GlobalKey _three = GlobalKey();
  GlobalKey _four = GlobalKey();
  GlobalKey _five = GlobalKey();

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((_) =>
        ShowCaseWidget.of(context).startShowCase([_one, _two, _three, _four, _five]));

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 3,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Row(
                              children: [
                                Showcase(
                                  key: _one,
                                  description: 'Tap to see menu options',
                                  showcaseBackgroundColor: Color(0xff5050D5),
                                  textColor: Colors.white,
                                  child: Icon(
                                    Icons.menu,
                                    color: Colors.black45,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Search email...',
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Showcase(
                            key: _two,
                            title: 'Profile',
                            description: 'Tap to see profile',
                            showcaseBackgroundColor: Color(0xff5050D5),
                            textColor: Colors.white,
                            shapeBorder: CircleBorder(),
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30.0),
                                  child: FadeInImage.assetNetwork(
                                      placeholder: MainAppImages.place_holder,
                                      image: MainAppImages.widget_four,fit: BoxFit.cover)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16, top: 4),
                  child: Text(
                    'PRIMARY',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 8)),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailsProfilePage(),
                    ),
                  );

                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Showcase(
                    key: _three,
                    description: 'Tap to check mail',
                    textColor: Colors.white,
                    showcaseBackgroundColor: Color(0xff5050D5),
                    disposeOnTap: true,
                    onTargetClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailsProfilePage(),
                        ),
                      ).then((_) {
                        setState(() {
                          ShowCaseWidget.of(context).startShowCase([_four, _five]);
                        });
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 6, right: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Showcase.withWidget(
                                  key: _four,
                                  height: 50,
                                  width: 140,
                                  shapeBorder: CircleBorder(),
                                  container: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width: 45,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.blue[200],
                                        ),
                                        child: Center(
                                          child: Text('S'),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Your sender profile',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    child: Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blue[200],
                                      ),
                                      child: Center(
                                        child: Text('S'),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(left: 8)),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Slack',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                    Text(
                                      'Slack Notification',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      'You have new Notification',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                '1 Jun',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.star_border,
                                color: Colors.grey,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )),
            MailTile(
              Mail(
                sender: 'Jennifer',
                sub: 'She is an actress',
                msg: 'Check new showcase View',
                date: '01 March',
                isUnread: false,
              ),
            ),
            MailTile(
              Mail(
                sender: 'Scarlett',
                sub: 'Question for you',
                msg: 'There is new question for you',
                date: '24 April',
                isUnread: false,
              ),
            ),
            MailTile(
              Mail(
                  sender: 'Natalie',
                  sub: 'Flutter 2.0',
                  msg: 'We have launched Flutter 2.0',
                  date: '2 Jun',
                  isUnread: true),
            ),
            MailTile(
              Mail(
                  sender: 'Emma Stone',
                  sub: 'Debit card Plugin',
                  msg: 'Check out our credit card plugin',
                  date: '19 Jan',
                  isUnread: true),
            ),
            MailTile(
              Mail(
                sender: 'Margot',
                sub: 'She is Hollywood actress',
                msg: 'She is new movies released ',
                date: '18 Jan',
                isUnread: true,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Showcase(
        key: _five,
        title: 'Compose Mail',
        description: 'Click here to compose mail',
        textColor: Colors.white,
        showcaseBackgroundColor: Color(0xff5050D5),
        shapeBorder: CircleBorder(),
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            setState(() {
              ShowCaseWidget.of(context)
                  .startShowCase([_one, _two, _three, _four, _five]);
            });
          },
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class Mail {
  String sender;
  String sub;
  String msg;
  String date;
  bool isUnread;

  Mail({
    this.sender,
    this.sub,
    this.msg,
    this.date,
    this.isUnread,
  });
}

class MailTile extends StatelessWidget {
  final Mail mail;

  MailTile(this.mail);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 6, right: 16, top: 8, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(10),
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue[200],
                  ),
                  child: Center(
                    child: Text(mail.sender[0]),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 8)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      mail.sender,
                      style: TextStyle(
                        fontWeight:
                        mail.isUnread ? FontWeight.bold : FontWeight.normal,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      mail.sub,
                      style: TextStyle(
                        fontWeight:
                        mail.isUnread ? FontWeight.bold : FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      mail.msg,
                      style: TextStyle(
                        fontWeight:
                        mail.isUnread ? FontWeight.bold : FontWeight.normal,
                        fontSize: 15,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Column(
            children: [
              Text(
                mail.date,
                style: TextStyle(
                  fontWeight:
                  mail.isUnread ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              Icon(
                Icons.star_border,
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}