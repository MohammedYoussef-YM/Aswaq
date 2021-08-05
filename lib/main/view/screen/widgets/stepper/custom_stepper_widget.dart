
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/utils/custom_theme.dart';

class CustomStepper extends StatefulWidget {
  @override
  _CustomStepperState createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {

  int _currentStep =0;
  StepperType _stepperType=StepperType.vertical;

  switchStepType(){
    setState(()=>_stepperType==StepperType.vertical ?
    _stepperType=StepperType.horizontal :
    _stepperType=StepperType.vertical);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Stepper'),
        backgroundColor: Color(0xff5050D5),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stepper(
              steps: _stepper(),
              physics: BouncingScrollPhysics(),
              currentStep: this._currentStep,
              type: _stepperType,
              onStepTapped: (step){
                setState(() {
                  this._currentStep=step;
                });
              },
              onStepContinue: (){
                setState(() {
                  if(this._currentStep < this._stepper().length-1){
                    this._currentStep= this._currentStep +1;
                  } else {
                    print("Complete");
                  }
                });
              },
              onStepCancel: (){
                setState(() {
                  if(this._currentStep>0){
                    this._currentStep = this._currentStep-1;
                  }else{
                    this._currentStep=0;
                  }
                });
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: switchStepType,
        backgroundColor: Color(0xff5050D5),
        child: Icon(Icons.swap_horizontal_circle,color: Colors.white,),),
    );
  }

  List<Step> _stepper(){
    List<Step>  _steps=[
      Step(
          title: Text('Name',style: poppinsBold.copyWith(fontSize: 12,color: Colors.black)),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Personal Information',style: poppinsSemiBold.copyWith(fontSize: 14,color: Colors.black),),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'First Name',
                    icon: Icon(Icons.person,color: Colors.black,),
                    labelStyle: poppinsRegular.copyWith(fontSize: 12,color: Color(0xff5050D5),))),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Last Name',
                    icon: Icon(Icons.person,color:Colors.black),
                    labelStyle: poppinsRegular.copyWith(fontSize: 12,color: Color(0xff5050D5),)),),
            ],
          ),
          state: StepState.complete,
          isActive: _currentStep >=0,
      ),
      Step(
          title: Text('Email',style: poppinsBold.copyWith(fontSize: 12,color: Colors.black)),
          content: Column(
            children: [
              Text('Email Info',style: poppinsSemiBold.copyWith(fontSize: 14,color: Colors.black),),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Email',
                      icon: Icon(Icons.email_rounded,color: Colors.black,),
                      labelStyle: poppinsRegular.copyWith(fontSize: 12,color: Color(0xff5050D5),))),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Password',
                    icon: Icon(Icons.lock_rounded,color: Colors.black,),
                    labelStyle: poppinsRegular.copyWith(fontSize: 12,color: Color(0xff5050D5),)),),
            ],
          ),
          state: _currentStep>=1 ? StepState.complete: StepState.editing,
          isActive: _currentStep>=1,
      ),
      Step(
        title: Text('Address',style: poppinsBold.copyWith(fontSize: 12,color: Colors.black)),
        content: Column(
          children: [
            Text('Address Info',style: poppinsSemiBold.copyWith(fontSize: 14,color: Colors.black),),
            TextFormField(
                decoration: InputDecoration(
                    labelText: 'Present Address',
                    icon: Icon(Icons.add_location_alt,color: Colors.black,),
                    labelStyle: poppinsRegular.copyWith(fontSize:12,color: Color(0xff5050D5),))),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Permanent Address',
                  icon: Icon(Icons.add_location_alt,color: Colors.black,),
                  labelStyle: poppinsRegular.copyWith(fontSize: 12,color: Color(0xff5050D5),)),),
          ],
        ),
        state: _currentStep>=2 ? StepState.complete: StepState.disabled,
        isActive: _currentStep>=2,
      ),
      Step(
        title: Text('Avatar',style: poppinsBold.copyWith(fontSize: 12,color: Colors.black)),
        content: Row(
          children: [
            Icon(Icons.camera_alt_rounded,color: Colors.black,),
            Text('Add your image',style: poppinsSemiBold.copyWith(fontSize: 14,color: Colors.black)),
          ],
        ),
        state: _currentStep>=3 ? StepState.complete: StepState.disabled,
        isActive: _currentStep>=3,
      )
    ];
    return _steps;
  }
}
