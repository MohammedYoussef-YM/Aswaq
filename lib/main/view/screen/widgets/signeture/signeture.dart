import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class SignaturePad extends StatefulWidget {
  @override
  _SignatureDemo2State createState() => _SignatureDemo2State();
}

class _SignatureDemo2State extends State<SignaturePad> {
  SignatureController controller;
  @override
  void initState(){
    super.initState();
    controller = SignatureController(
      penStrokeWidth: 3,
      penColor: Colors.black,
    );
  }
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Signature Widget'),
        backgroundColor: Color(0xff5050D5),
      ),
      body: Column(
        children: <Widget>[
          Signature(
            controller : controller,
            backgroundColor: Colors.white,
          ),
        ],
      ),
      floatingActionButton:FloatingActionButton(
        backgroundColor: Color(0xff5050D5),
        elevation: 5,
        focusElevation: 10,
        child: Icon(Icons.clear,color: Colors.white,),
        onPressed: () => controller.clear(),
      ),
    );

  }

  Future<Uint8List>exportSignature() async {
    final exportController = SignatureController(
      penColor: Colors.black,
      penStrokeWidth: 2,
      exportBackgroundColor: Colors.black,
      points: controller.points,
    );
    final signature = await exportController.toPngBytes();
    exportController.dispose();
    return signature;
  }
}
