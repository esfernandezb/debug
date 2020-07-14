import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'actualizar.dart';
import '../global.dart';

class DetailsUsuarios extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    const int _blackPrimaryValue = 0xFF000000;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Usuario',
      theme: ThemeData(
          primarySwatch:MaterialColor(
            _blackPrimaryValue,
            <int, Color>{
              50: Color(0xFF000000),
              100: Color(0xFF000000),
              200: Color(0xFF000000),
              300: Color(0xFF000000),
              400: Color(0xFF000000),
              500: Color(_blackPrimaryValue),
              600: Color(0xFF000000),
              700: Color(0xFF000000),
              800: Color(0xFF000000),
              900: Color(0xFF000000),
            },
          )
      ),
      home: DetailsUsuario(title: 'Detalles'),
    );;
  }

}
class DetailsUsuario extends StatelessWidget{
  final String title ;
  DetailsUsuario({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: Details(),
    );
  }

}
class Details extends StatefulWidget{
  @override
  DetailsFormState createState() {
    // TODO: implement createState
    return DetailsFormState();
  }

}
class DetailsFormState extends State<Details>{

  DocumentSnapshot _doc;
  DetailsFormState(){
    _doc= Global.doc;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:Container(
        constraints: BoxConstraints.expand(),
        color: Color(0xFF000000),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: <Widget>[
                       _getBackground(),

                       Column(
                         children: <Widget>[
                           Text('0',textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.white),),
                           Text('Siguiendo',textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: Colors.white),),
                         ],
                       ),
                       Column(
                         children: <Widget>[
                           Text('1',textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.white),),
                           Text('Siguidores',textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: Colors.white),),
                         ],
                       ),
                       Column(
                         children: <Widget>[
                           Text('0',textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.white),),
                           Text('Me gusta',textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: Colors.white),),
                         ],
                       )
                     ],
                   ),

                  Text(
                    '${_doc.data['Nombre']}',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                   Text('Descripcion',textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.white)),
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child:
                    FlatButton(onPressed: (){
                      Navigator.of(context).push(new PageRouteBuilder(
                        pageBuilder: (_,__,___) => new Actualizar(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child)=>
                            FadeTransition(opacity: animation, child: child),
                      ));
                    },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black87,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 1.0
                              ),
                            ]
                        ),
                        width:MediaQuery.of(context).size.width,height:30,child: Center(child: Text('Editar perfil',textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white,fontStyle:FontStyle.normal,fontSize: 15,),)))

                    ),

                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 40.0,right: 40.0),
                    child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[
                      Icon(Icons.view_headline,color: Colors.white,),
                      Icon(Icons.favorite_border,color: Colors.white,),

                    ],),
                  ),
                  Divider(
                    color: Colors.white,
                    height: 30,
                  )
                  //_getGradient(),
                  //_getContent()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Container _getBackground(){
    return Container(
      height: 100.0,
      width: 100.0,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(_doc.data['Image']),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Container _getContent(){
    final _overviewTitle = "Overview".toUpperCase();
    return Container(
      child: ListView(
        padding: EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
        children: <Widget>[
         // UsuarioSummary(
           // horizontal: false,
          //),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(_overviewTitle,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                //Separator(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

