import 'package:cloud_firestore/cloud_firestore.dart';
import 'file:///C:/Users/gomez/AndroidStudioProjects/trabajo%20de%20android/debug/lib/instagram/pages/Registro.dart';

import 'file:///C:/Users/gomez/AndroidStudioProjects/trabajo%20de%20android/debug/lib/instagram/pages/inicio.dart';
import 'file:///C:/Users/gomez/AndroidStudioProjects/trabajo%20de%20android/debug/lib/instagram/pages/login.dart';
import 'package:flutter/material.dart';

import '../global.dart';

class ListaUser extends StatefulWidget {
  @override
  _ListaUserState createState() => _ListaUserState();
}

class _ListaUserState extends State<ListaUser> {
  final _db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color:Colors.black,


            //Image.asset('assets/img/insta.jpg'),
           child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Image.asset('assets/img/instagram.jpg',height: 110,),
                    StreamBuilder<QuerySnapshot>(
                      stream: _db.collection('Usuarios').snapshots(),
                      builder: (context, snapshot){
                        if(snapshot.hasData){
                          return Column(
                            children: snapshot.data.documents.map((doc) => RetornarItem(doc)).toList(),
                          );
                        }
                      }
                    ),
                    SizedBox(height: 150.0,),
                    Divider(color:Colors.white ,),
                    RaisedButton(
                      disabledColor: Colors.black,
                      child: Text("Iniciar sesión en otra cuenta",style: TextStyle(fontStyle: FontStyle.normal,fontSize:16,fontWeight: FontWeight.bold,color: Colors.white),),
                      splashColor: Colors.black,
                      color: Colors.black,
                      onPressed: ()  {
                        Navigator.push(context, new MaterialPageRoute(
                            builder: (context) =>
                            new logininsta()));
                      },
                    ),
                    Divider(color:Colors.white30),
                    RaisedButton(
                      disabledColor: Colors.black,
                      child: Text("Crear cuenta nueva",style: TextStyle(fontStyle: FontStyle.normal,fontSize:16,fontWeight: FontWeight.bold,color: Colors.white),),
                      splashColor: Colors.black,
                      color: Colors.black,
                      onPressed: ()  {
                        Navigator.push(context, new MaterialPageRoute(
                            builder: (context) =>
                            new registro()));
                      },
                    ),
                  ],
                )
              ],
            ),

      ),
    );
  }
  Container RetornarItem (DocumentSnapshot doc){
    return Container(
      decoration: BoxDecoration(
          border:Border.all(color: Colors.white),
        color: Colors.black,
      ),
      height: 60,
      width: MediaQuery.of(context).size.width,
      margin:  const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 5
      ),
      child: Row(
        children: <Widget>[
          thumbnail(doc),
          card(doc),
        ],
      ),
    );
  }
  GestureDetector card(DocumentSnapshot doc) {
    return GestureDetector(
      onTap: () => {
        Global.doc= doc,
        Navigator.of(context).push(PageRouteBuilder(
            pageBuilder:(_,__,___,)=> MyHomePage() ))
      },
      child: Container(
        height: 60,
        child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 8.0, horizontal: 20.0
            ),
            child:
            Text(
              '${doc.data['Nombre']}', style: TextStyle(fontWeight: FontWeight.w900,color: Colors.white,fontSize: 17.0),
            )
        ),
      ),
    );
  }
  Container thumbnail (DocumentSnapshot doc){
    return Container(
      alignment: FractionalOffset.centerLeft,
      child: new Container(
        height: 60.0,
        width: 60.0,
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(50.0),
          image: DecorationImage(
            image: NetworkImage(doc.data['Image']),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
    //NetworkImage(doc.data['Image']),

  }

}

