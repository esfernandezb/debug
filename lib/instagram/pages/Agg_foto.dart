

import 'dart:io';

import 'file:///C:/Users/gomez/AndroidStudioProjects/trabajo%20de%20android/debug/lib/instagram/pages/home.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';


class PhotoUploadSate extends StatefulWidget {
  @override
  _PhotoUploadSateState createState() => _PhotoUploadSateState();
}

class _PhotoUploadSateState extends State<PhotoUploadSate> {
  File sampleImage;
  final formkey = GlobalKey<FormState>();
  String url;
 String _myValue ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        child: Center(
          child: sampleImage == null
              ? Text("Selecciona una foto",style: TextStyle(color: Colors.white),)
              : enableUpload(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
          setState(() {
            sampleImage = File(pickedFile.path);
          });
        },
        backgroundColor: Colors.black87,
        tooltip: "Agregar fotos",
        child: Icon(Icons.add_a_photo,),
      ),
    );
  }

  Widget enableUpload(){
    return SingleChildScrollView(
      child: Container(
        child: Form(
          key: formkey,
          child: Column(
            children: <Widget>[
              Image.file(
                sampleImage,
                height: 300,
                width: 600,
              ),
              SizedBox(height: 15.0,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(color:Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white)
                      ),

                  ),
                  validator: (value){
                    return value.isEmpty ? "Falata Descripcion" : null;
                  },
                  onSaved: (value){
                    return _myValue = value;
                  }
                ),
              ),
              SizedBox(height: 15.0,),
              RaisedButton(
                elevation: 10.0,
                child: Text('Agragar nuevo post'),
                textColor: Colors.white,
                color:Colors.black,
                onPressed: uploadStatusImage,
              ),
            ],
          ),
        ),
      ),
    );
  }
  void uploadStatusImage()async{
    if(validateAndSave()) {
      final StorageReference postImageRef =
          FirebaseStorage.instance.ref().child('Post Image');
      var timeKey = DateTime.now();
      final StorageUploadTask uploadTask =
          postImageRef.child(timeKey.toString() + ".jpg").putFile(sampleImage);
      var imageUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
      url = imageUrl.toString();
      print('Image url:' + url);
      saveToDatabase(url);
      Navigator.pop(context);
      Navigator.pushReplacement(context, MaterialPageRoute(builder:
      (context){
        return HomePage();
      }));
    }
  }
  void saveToDatabase(String url){
    var dbTimeKey = DateTime.now();
    var formatDate = DateFormat('MMM d, yyyy');
    var formatTime = DateFormat('EEEE, hh:mm aaa');
    String date = formatDate.format(dbTimeKey);
    String time = formatTime.format(dbTimeKey);

    DatabaseReference ref = FirebaseDatabase.instance.reference();
    var data = {
      'image': url,
      'descripcion': _myValue,
      'date': date,
      'time': time
    };
    ref.child('Posts').push().set(data);
  }
  bool validateAndSave(){
    final form = formkey.currentState;
    if(form.validate()){
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
