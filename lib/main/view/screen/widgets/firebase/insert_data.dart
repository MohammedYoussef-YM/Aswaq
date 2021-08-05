

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewFirebaseInsert extends StatefulWidget {
  @override
  _FirebaseInsertState createState() => _FirebaseInsertState();
}

class _FirebaseInsertState extends State<NewFirebaseInsert> {

  final TextEditingController _controller=TextEditingController();
  final db=FirebaseFirestore.instance;
  String value;

   void showDialogWidget(bool isUpdate, DocumentSnapshot ds){
     final _formKey = GlobalKey<FormState>();
     showDialog(
         context: context,
         builder: (context){
           return AlertDialog(
             title:  isUpdate ? Text('Update Data') : Text('Add Data'),
             content: Form(
               key: _formKey,
               child: TextFormField(
                 controller: _controller,
                 decoration: InputDecoration(
                     border: OutlineInputBorder(),
                     labelText: 'Input Data'
                 ),
                 validator: (val) =>
                 (val.length == 0 ? 'This field is mandatory' : null),
                   onChanged: (val){
                     value=val;
                   }
               ),
             ),

             actions: [
               Container(
                 margin: EdgeInsets.all(10.0),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(30)
                 ),
                 child: TextButton(
                   onPressed: () async {
                     var form = _formKey.currentState;
                     if (form.validate()) {
                       form.save();
                       if(isUpdate){
                         db.collection('Tasks').doc(ds.id).update({
                           'task' : value, 'time' : DateTime.now()});
                       } else{
                         db.collection('Tasks').add({'task' : value, 'time' : DateTime.now()});
                       }
                       Navigator.pop(context);
                       form.reset();
                     }
                   },
                   child: isUpdate? Text('Update') : Text('Add'),
                 ),
               ),
             ],
           );
         });
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Firebase CRUD Operation'),
      ),

      // for data add
      floatingActionButton: FloatingActionButton(
        onPressed:()=>showDialogWidget(false,null),
        child: Icon(Icons.add,color: Colors.white,),
      ),

      body: StreamBuilder(
        stream: db.collection('Tasks').orderBy('time').snapshots(),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){

          if(snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context,index){
                  DocumentSnapshot ds=snapshot.data.docs[index];
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                    elevation: 2,
                    child: ListTile(
                      title: Text(ds['task']),
                      leading: Icon(Icons.person),
                      trailing: Icon(Icons.call),
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (context) =>CupertinoAlertDialog(
                            title: Text('Delete Data'),
                            content: Text('Are you sure to delete this Data?'),
                            insetAnimationCurve: Curves.linearToEaseOut,
                            actions: [

                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                  },
                                child: Text('No'),
                              ),

                              TextButton(
                                onPressed: () {
                                  db.collection('Tasks').doc(ds.id).delete();
                                  Navigator.pop(context);
                                  },
                                child: Text('Yes'),
                              ),
                            ],
                          ),
                        );},
                      onTap: () => showDialogWidget(true,ds),
                    ),

                  );},
            );
          } else if(snapshot.hasError){
            return CircularProgressIndicator();
          } else {
            return Text('No data found');
          }
        },
      ),
    );
  }
}