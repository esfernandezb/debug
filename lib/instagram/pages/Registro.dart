import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'file:///C:/Users/gomez/AndroidStudioProjects/trabajo%20de%20android/debug/lib/instagram/pages/login.dart';
import 'file:///C:/Users/gomez/AndroidStudioProjects/trabajo%20de%20android/debug/lib/instagram/pages/Pagina_User.dart';
import 'file:///C:/Users/gomez/AndroidStudioProjects/trabajo%20de%20android/debug/lib/instagram/pages/search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import '../foto.dart';

class registro extends StatefulWidget {
  @override
  _registroState createState() => _registroState();
}

class _registroState extends State<registro> {
  final _fromKey = GlobalKey<FormState>();
  File _selectedPicture;
  var email = TextEditingController();
  var nombre = TextEditingController();
  var password = TextEditingController ();
  bool _obscureText = true;
  bool passwordVisible= true;
  String _image;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  DocumentSnapshot doc;
  DetailsFormState(){
  doc = Global.doc as DocumentSnapshot;
  }
  bool _isEnabled = true;
  void initState() {
    passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: ListView(
          children: <Widget>[
            Form(
              key: _fromKey,
              child: Column(
                 children: <Widget>[
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                gradient:  LinearGradient(
                colors: [Colors.pink,Colors.redAccent,Colors.amber],
                stops: [0.2,0.4,1.0],
                begin: FractionalOffset.topRight,
                end: FractionalOffset.bottomCenter)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, ),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 40,),
                         Image.asset('assets/img/insta.png', width: 200,height: 200,color: Colors.white
                           ,),
                          Text('Registrate para ver fotos y vídeos de tus amigos',style: TextStyle( color: Colors.white, fontSize: 20,fontWeight: FontWeight.w900),textAlign: TextAlign.center,),
                          SizedBox(height: 10,)
                        ],
                      ),
                    ),

                  ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white30),
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(5.0)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.white,fontSize: 16),
                        decoration: InputDecoration(
                          hintText: 'Usuario',
                          hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                        validator: (value){
                          if (value.isEmpty){
                            return 'Ingrese un usuario';
                          }
                        },
                        controller: email,
                          enabled: _isEnabled,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white30),
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(5.0)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white,fontSize: 16),
                        decoration: InputDecoration(
                          hintText: 'Nombre',
                          hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                        validator: (value){
                          if (value.isEmpty){
                            return 'Ingrese un nombre';
                          }
                        },
                        controller: nombre,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white30),
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(5.0)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white,fontSize: 16),
                        keyboardType: TextInputType.text,
                        validator: (input){
                          if(input.length <6){
                            return'return mayor o igual a 6';
                          }
                        },
                        //controller: _userPasswordController,
                        obscureText: passwordVisible,//This will obscure text dynamically
                        decoration: InputDecoration(
                          hintText: 'Contraseña',
                          hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
                          // Here is key idea
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Theme.of(context).primaryColorLight,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                          ),
                        ),
                        controller: password,
                          enabled: _isEnabled,
                      ),
                    ),
                  ),
                ),
                   Padding(
                     padding: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 10.0),
                     child:CardFotos(),
                   ),
                SizedBox(height: 30,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RaisedButton( shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                      disabledColor: Colors.blue,
                      child: Text("Registrarse",style: TextStyle(fontStyle: FontStyle.normal,fontSize:16,fontWeight: FontWeight.bold,color: Colors.white),),
                      splashColor: Colors.blue,
                      color: Colors.blue,
                      onPressed: ()  {
                        if (_fromKey.currentState.validate()){

                            registrar(context);

                        }
                      },

                    ),
                  ),
                ),

               ] ),
            ),
        ]),
        ),
    );

  }
  String validateEmail(String value){
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    if (value.isEmpty){
      return 'Por favor ingrese el email';
    }else{
      RegExp regex = new RegExp(pattern);
      if (!regex.hasMatch(value)){
        return 'Enter Valid Email';
      }else{
        return null;
      }
    }
  }
  String validatePassword(String value){
    if(value.isEmpty){
      return 'Por favor ingrese el passwpord';
    }else{
      if(6 > value.length){
        return 'Por favor ingrese un passwpord de 6 caracteres';
      }
    }
  }
  int _state = 0;


  registrar(BuildContext context) async {
    final _auth = FirebaseAuth.instance;
    final _firebaseStorageRef = FirebaseStorage.instance;
    final _db = Firestore.instance;
    var image = CardFoto.galleryFile;
    if(image != null){
      setState(() {
        if (_state == 0) {

        }
      });
      StorageUploadTask task;
      await _auth.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      ).then( (FirebaseUser ) async {
        final StorageUploadTask task = _firebaseStorageRef.ref().child("Usuarios").child("${email.text}.png").putFile(image);
        if(await task.onComplete != null){
          StorageTaskSnapshot storageTaskSnapshot = await task.onComplete;
          String imgUrl = await storageTaskSnapshot.ref.getDownloadURL();
          DocumentReference ref = _db.collection('Usuarios').document(email.text);
          ref.setData({'Nombre': '${nombre.text}', 'Image': '$imgUrl'}).then((onValue){
            Navigator.of(context).push(new PageRouteBuilder(
                pageBuilder: (_,__,___) => new logininsta()
            ));
          });
        }
      });
    }

    }

}

