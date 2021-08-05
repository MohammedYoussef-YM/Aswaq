import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';


class FormFieldWidget extends StatefulWidget {
  @override
  _FormFieldWidgetState createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {

  //for checkBox
  bool rememberMe = false;

  //for radio button
  Color iconColor=Colors.black;
  //for Switch
  bool status2 = true;
  bool status3 = false;
  bool  enabled =false;

  //for dropdown button
  String chooseMonth;
  List monthItem=['January','February','March','April','May','June','July','August','September','October','November','December'];
  String chooseYear;
  List yearItem=['2010','2011','2012','2013','2014','2015','2016','2017','2018','2019','2020','2021','2022','2023'];

  //for Slider
  double _currentSliderValue = 20;
  double _sliderCurrentValue = 50;

  //for Toggle button
  List<bool> _selections=List.generate(3, (_) => false);
  List<bool> _isSelected=List.generate(3, (_) => false);

  //for checkBox
  void _onRememberMeChanged(bool newValue) =>
      setState(() {
        rememberMe = newValue;
      });

  //for Date Picker
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Form Field Widget'),
        backgroundColor: Color(0xff5050D5),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              //text field
              SizedBox(height: 20,),
              Text('Text Field',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Normal Text Field',
                  hintStyle: TextStyle(color: Colors.white)
                ),
                cursorColor: Colors.redAccent,
              ),

              //text field color
              SizedBox(height: 10,),
              Container(
                color: Colors.grey[400],
                child: TextField(
                  scrollPadding: EdgeInsets.only(left: 10),
                  decoration: InputDecoration(
                      hintText: 'Enter Your Name',contentPadding: EdgeInsets.only(left: 10),
                      fillColor: Color(0xff5050D5),
                  ),
                ),
              ),


              //text field color
              SizedBox(height: 10,),
              Container(
                color: Color(0xff5050D5),
                child: TextField(
                  scrollPadding: EdgeInsets.only(left: 10),
                  decoration: InputDecoration(
                      hintText: 'Text Field with color',
                      hintStyle: TextStyle(color: Colors.white),
                      contentPadding: EdgeInsets.only(left: 10),
                      fillColor: Colors.redAccent
                  ),
                  cursorColor: Colors.white,
                ),
              ),
              //text field color
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff5050D5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  scrollPadding: EdgeInsets.only(left: 10),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Text Field with color and Shape',
                      hintStyle: TextStyle(color: Colors.white),
                      contentPadding: EdgeInsets.only(left: 10),
                      fillColor: Colors.redAccent
                  ),
                  cursorColor: Colors.white,
                ),
              ),


              //text field color
              SizedBox(height: 10,),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password Text Field',
                ),
              ),



              //text field color
              SizedBox(height: 10,),
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.call),
                  border: OutlineInputBorder(),
                  labelText: 'Prefix Icon Text Field',
                ),
              ),


              //text field color
              SizedBox(height: 10,),
              TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  labelText: 'Suffix Icon Text Field',
                ),
              ),

              //text field color
              SizedBox(height: 10,),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'type something...',
                ),
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                maxLines: 4,
                maxLength: 10,
              ),


              //CheckBox button
              SizedBox(height: 50,),
              Text('CheckBox',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children:[
                    Checkbox(
                    value: rememberMe,
                    onChanged: (value){
                      Fluttertoast.showToast(msg: "Clicked CheckBox");
                      rememberMe=value;
                      setState(() {

                      });
                    }),

                    Checkbox(
                      value: rememberMe,
                      onChanged: _onRememberMeChanged,
                      activeColor: Colors.green,
                      checkColor: Colors.redAccent,
                    ),

                    Checkbox(
                      value: rememberMe,
                      onChanged: _onRememberMeChanged,
                      activeColor: Colors.grey[200],
                      checkColor: Colors.black,
                    ),

                    InkWell(
                      onTap: (){
                        Fluttertoast.showToast(msg: "Clicked CheckBox");
                        setState(() {
                          rememberMe =! rememberMe;
                        });
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          border: rememberMe ? null: Border.all(color: Color(0xff5050D5), width: 2.0),
                          borderRadius: BorderRadius.circular(10),
                          color: rememberMe? Color(0xff5050D5) : Colors.transparent,
                        ),
                        child: rememberMe ? Icon(Icons.check,color: Colors.white,):null,
                      ),
                    ),

                    SizedBox(width: 10,),
                    InkWell(
                      onTap: (){
                        Fluttertoast.showToast(msg: "Clicked CheckBox");
                        setState(() {
                          rememberMe =! rememberMe;
                        });
                      },
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: rememberMe?Colors.orange: Color(0xff5050D5),
                        child: rememberMe ? Icon(Icons.check,color: Colors.white,):null,
                      ),
                    ),
                  ],
                ),
              ),


              //radio button
              SizedBox(height: 50,),
              Text('Radio Button',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row( children: <Widget>[
                        Radio(
                           value: Color(0xff5050D5),
                           groupValue: iconColor,
                           onChanged: (value){
                             Fluttertoast.showToast(msg: "Blue Selected");
                             iconColor=value;
                             setState(() {

                             });
                           }
                       ),
                       Text(
                         "Blue selected",
                       ),
                     ],
                   ),
                   Row(
                     children: <Widget>[
                       Radio(
                           value: Colors.green,
                           groupValue: iconColor,
                           onChanged: (value){
                             Fluttertoast.showToast(msg: "Green Selected");
                             iconColor=value;
                             setState(() {

                             });
                           }
                       ),
                       Text(
                         "Green selected",
                       ),
                     ],
                   ),
                   Row(
                     children: <Widget>[
                       Radio(
                           value: Colors.red,
                           groupValue: iconColor,
                           onChanged: (value){
                             Fluttertoast.showToast(msg: "Red Selected");
                             iconColor=value;
                             setState(() {

                             });
                           }
                       ),
                       Text(
                         "Red selected",
                       ),
                     ],
                   ),
                 ],
               ),
               Expanded(child: Icon(Icons.lightbulb,size: 150,color: iconColor,))
             ],),


              //for Dropdown button
              SizedBox(height: 50,),
              Text('Dropdown Menu',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey,width: 2)
                  ),
                  child: DropdownButton(
                    hint: Text('Select Month'),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.calendar_today_sharp,color: Color(0xff5050D5),size: 16,),
                    isExpanded: true,
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),
                    underline: SizedBox(),
                    value: chooseMonth,
                    onChanged: (newValue){
                      Fluttertoast.showToast(msg: "Change Month");
                      setState(() {
                        chooseMonth=newValue;
                      });
                    },
                    items: monthItem.map((valueItem) => DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem))).toList(),
                  ),
                ),
              ),

              // for Dropdown button
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                      color: Color(0xff5050D5),
                      borderRadius: BorderRadius.circular(12),
                  ),
                  child: DropdownButton(
                    hint: Text('Select Year',style: TextStyle(color: Colors.white),),
                    dropdownColor: Color(0xff5050D5),
                    icon: Icon(Icons.calendar_today_outlined,color: Colors.white,size: 16,),
                    isExpanded: true,
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
                    underline: SizedBox(),
                    value: chooseYear,
                    onChanged: (newValue){
                      Fluttertoast.showToast(msg: "Change year");
                      setState(() {
                        chooseYear=newValue;
                      });
                    },
                    items: yearItem.map((valueItem) => DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem))).toList(),
                  ),
                ),
              ),

              //for button
              SizedBox(height: 50,),
              Text('All Kinds Of Button',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              //flat Button
              SizedBox(height: 10,),
              TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(0),
                    primary: Color(0xff5050D5),
                  ),
                  onPressed: (){
                    Fluttertoast.showToast(msg: "Clicked Flat Button");
                  }, child: Text('Flat Button',style:TextStyle(color: Colors.white),)),

              SizedBox(height: 10,),
              TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(0),
                    primary: Color(0xff5050D5),
                    shape: StadiumBorder(),
                  ),
                  onPressed: (){
                    Fluttertoast.showToast(msg: "Clicked Flat Button with Shape");
                  }, child: Text('Flat Button with Shape',style:TextStyle(color: Colors.white),)),

              //Outline Button
              SizedBox(height: 10,),
              Container(
                //padding: EdgeInsets.symmetric(horizontal: 5),
                  child: OutlinedButton(onPressed: (){
                    Fluttertoast.showToast(msg: "Clicked Outline Button");
                    }, child: Text('Outline Button',style:TextStyle(color: Colors.black),))),

              SizedBox(height: 10,),
              OutlinedButton(
                 style: OutlinedButton.styleFrom(
                   shape: StadiumBorder(),
                   primary: Color(0xff5050D5),
                 ),
                  onPressed: (){
                    Fluttertoast.showToast(msg: "Clicked Outline Button and Shape");
                  }, child: Text('Outline Button and Shape',style:TextStyle(color: Colors.black),)),

              //Raise Button
              SizedBox(height: 10,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    primary:  Color(0xff5050D5),
                    shape: StadiumBorder()
                  ),
                  onPressed: (){
                    Fluttertoast.showToast(msg: "Clicked Raise Button and Shape");
                  }, child: Text('Raise Button and Shape',style:TextStyle(color: Colors.white),)),

              ClipOval(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff5050D5),
                  ),
                  onPressed: () {
                    Fluttertoast.showToast(msg: "Clicked ClipOval Raise Button");
                  },
                  child: Text("ClipOval Raise Button",style:TextStyle(color: Colors.white),),
                ),
              ),


              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff5050D5),
                  ),
                  onPressed: () {
                    Fluttertoast.showToast(msg: "Clicked ClipRRect Raise Button");
                  },
                  child: Text(" ClipRRect Raise Button",style:TextStyle(color: Colors.white)),
                ),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff5050D5),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                ),
                onPressed: () {
                  Fluttertoast.showToast(msg: "Clicked Gradient Color Button");
                },
                child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.orangeAccent,
                              Colors.green,
                              Colors.red
                            ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight
                        ),
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Container(
                        constraints: BoxConstraints(maxWidth: 200,maxHeight: 40),
                        alignment: Alignment.center,
                        child: Text(" Gradient Color Button"))),
              ),


              // Slider
              SizedBox(height: 50),
              Text('Slider with divisions', style: TextStyle(fontSize: 16)),
              Slider(
                value: _currentSliderValue,
                min: 0,
                max: 100,
                divisions: 5,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
              ),

              SizedBox(height: 10,),
              Text('Slider without divisions',style: TextStyle(fontSize: 16),),
              Slider(
                activeColor: Colors.redAccent,
                inactiveColor: Colors.green,
                value: _sliderCurrentValue,
                min: 0,
                max: 100,
                label: _sliderCurrentValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _sliderCurrentValue = value;
                  });
                },
              ),


              //for toggle button
              SizedBox(height: 50,),
              Text('Toggle Button ',style: TextStyle(fontSize: 16),),
              SizedBox(height: 10,),
              ToggleButtons(
                children: [
                  Icon(Icons.home_sharp),
                  Icon(Icons.favorite_border),
                  Icon(Icons.settings_voice),
                ],
                isSelected: _selections,
                onPressed: (int index){
                  Fluttertoast.showToast(msg: "Clicked Toggle Button");
                  setState(() {
                    _selections[index] =!_selections[index];
                  });
              },),


              SizedBox(height: 10,),
              Text('Toggle Button Shape ',style: TextStyle(fontSize: 16),),
              SizedBox(height: 10,),
              ToggleButtons(
                children: [
                  Icon(Icons.emoji_emotions),
                  Icon(Icons.next_plan),
                  Icon(Icons.approval),
                ],
                isSelected: _isSelected,
                borderRadius: BorderRadius.circular(30),
                onPressed: (int index){
                  Fluttertoast.showToast(msg: "Clicked Toggle Button Shape ");
                  setState(() {
                    _isSelected[index] =!_isSelected[index];
                  });
                },),


              //for Switch
              SizedBox(height: 50.0),
              Text("Switch",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
              SizedBox(height: 10.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlutterSwitch(
                    showOnOff: true,
                    activeTextColor: Colors.black,
                    inactiveTextColor: Colors.blue[50],
                    activeIcon: Icon(Icons.check),
                    inactiveIcon: Icon(Icons.close),
                    value: status3,
                    onToggle: (val) {
                      Fluttertoast.showToast(msg: "Clicked Switch Button");
                      setState(() {
                        status3 = val;
                      });
                    },
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Value: $status3",style: TextStyle(fontSize: 14,),
                    ),
                  ),


                  SizedBox(height: 10.0),
                  Text("Custom Colors and Borders",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  SizedBox(height: 10.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlutterSwitch(
                        width: 80.0,
                        height: 40.0,
                        toggleSize: 30.0,
                        value: status2,
                        borderRadius: 20.0,
                        padding: 5.0,
                        activeIcon: Icon(Icons.mic_none_sharp),
                        inactiveIcon: Icon(Icons.mic_off_outlined),
                        activeToggleColor: Color(0xff5050D5),
                        inactiveToggleColor: Colors.grey,
                        activeColor: Colors.pinkAccent,
                        inactiveColor: Colors.grey[200],
                        onToggle: (val) {
                          Fluttertoast.showToast(msg: "Clicked Switch Button Custom Colors and Borders");
                          setState(() {
                            status2 = val;
                          });
                        },
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Value: $status2",style: TextStyle(fontSize: 14,)
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 10.0),
              Text(" Custom Switch",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
              Switch(
                value: enabled,
                onChanged: (bool value) {
                  Fluttertoast.showToast(msg: "Clicked Custom Switch");
                  setState(() {
                    enabled = value;
                    },);
                  },
                activeThumbImage: new NetworkImage('https://lists.gnu.org/archive/html/emacs-devel/2015-10/pngR9b4lzUy39.png'),
                inactiveThumbImage: new NetworkImage('http://wolfrosch.com/_img/works/goodies/icon/vim@2x'),
              ),


              //for Date Picker
              SizedBox(height: 50.0),
              Text(" Date Picker",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.symmetric(horizontal: 5),
                margin: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  boxShadow: [BoxShadow(color: Colors.grey[300], spreadRadius: .5, blurRadius: 5)],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    Icon(Icons.calendar_today_outlined,color: Color(0xff5050D5),),
                    SizedBox(width: 10,),
                    Text("${selectedDate.toLocal()}".split(' ')[0],style: TextStyle(color: Color(0xff5050D5),fontWeight: FontWeight.bold),),
                    Expanded(child: SizedBox.shrink()),
                    TextButton(
                      onPressed: (){
                        _selectDate(context);
                        Fluttertoast.showToast(msg: "Select Date");
                      },
                      child: Text('Select date',style: TextStyle(color: Color(0xff5050D5),fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

