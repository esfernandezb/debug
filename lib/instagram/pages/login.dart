import 'file:///C:/Users/gomez/AndroidStudioProjects/trabajo%20de%20android/debug/lib/instagram/pages/Lista_usuario.dart';
import 'file:///C:/Users/gomez/AndroidStudioProjects/trabajo%20de%20android/debug/lib/instagram/pages/Registro.dart';
import 'package:debug/instagram/global.dart';
import 'file:///C:/Users/gomez/AndroidStudioProjects/trabajo%20de%20android/debug/lib/instagram/pages/inicio.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class logininsta extends StatefulWidget {
  @override
  _logininstaState createState() => _logininstaState();
}

class _logininstaState extends State<logininsta> {
  String email, password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  singIn() async{
    final formState =_formKey.currentState;
    if(!formState.validate())return;
    formState.save();
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> ListaUser()));
    }catch(e){
      print(e);
    }
  }
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Colors.black,

          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(

              children: <Widget> [Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox( height: 120,),
                    Image.asset('assets/img/instagram.jpg',height: 110,),
                    Container(
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
                          onSaved: (input) => email = input,
                          decoration: InputDecoration(
                            hintText: 'Usuario',
                            hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox( height: 12,),
                    Container(
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
                            hintText: 'Contraseña',
                            hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
                          ),
                          onSaved: (input) => password = input,
                        ),
                      ),
                    ),
                    SizedBox( height: 15,),
                    Padding(
                      padding: const EdgeInsets.only(left:200.0),
                      child: Text('¿Olvidaste tu contraseña?',textAlign: TextAlign.end,style: TextStyle(color: Colors.blue),),
                    ),
                    SizedBox( height: 30,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: RaisedButton( shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                        disabledColor: Colors.blue,
                        child: Text("Iniciar sesión",style: TextStyle(fontStyle: FontStyle.normal,fontSize:16,fontWeight: FontWeight.bold,color: Colors.white),),
                        splashColor: Colors.blue,
                        color: Colors.blue,
                        onPressed: ()  {
                          singIn();
                        },
                      ),
                    ),
                    SizedBox( height: 30,),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child:
                          new Container(
                              margin: const EdgeInsets.only(left: 1.0, right: 1.0),
                              child: Divider(
                                color: Colors.white,
                                height: 30,
                              )),
                        ),
                        Text("  O  ",style: TextStyle(fontStyle: FontStyle.normal,fontSize:16,fontWeight: FontWeight.bold,color: Colors.white),),
                        Expanded(
                          child:
                          new Container(
                              margin: const EdgeInsets.only(left: 1.0, right: 1.0),
                              child: Divider(
                                color: Colors.white,
                                height: 30,
                              )),
                        ),
                      ],
                    ),
                    SizedBox( height: 30,),
                    Text("Continuar con facebook",style: TextStyle(fontStyle: FontStyle.normal,fontWeight: FontWeight.bold,color: Colors.blue),),
                    SizedBox( height: 150,),
                    Divider(color: Colors.white,),
                    Padding(
                      padding: const EdgeInsets.only(left: 90),
                      child: Row(
                        children: <Widget>[
                          Text("¿No tienes una cuenta?",style: TextStyle(fontStyle: FontStyle.normal,color: Colors.white),),
                          Container(
                            width: 110,
                            height: 60,
                            child: RaisedButton( shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(5.0)),
                              disabledColor: Colors.black,
                              child: Text("Registrate",style: TextStyle(fontStyle: FontStyle.normal,fontWeight: FontWeight.bold,color: Colors.blue),),
                              splashColor: Colors.black,
                              color: Colors.black,
                              onPressed: ()  {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> registro()));
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ),

      ),
    );
  }
}
