import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bandeja extends StatefulWidget {
  @override
  _bandejaState createState() => _bandejaState();
}

class _bandejaState extends State<bandeja> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title:
            Center(child: Text('Actividad',style: TextStyle(color: Colors.white,fontStyle:FontStyle.normal),)),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.black87,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Solicitudes de seguidores',style: TextStyle(color: Colors.white,fontStyle:FontStyle.normal,fontSize: 15,),textAlign: TextAlign.start,),
                  SizedBox(width: 80,),
                  Icon(Icons.fiber_manual_record,color: Colors.blue,size: 15,),
                  Text('8',style: TextStyle(color: Colors.white,fontStyle:FontStyle.normal,fontSize: 15,),textAlign: TextAlign.start,),
                ],
              ),
              Text('Este mes',style: TextStyle(color: Colors.grey,fontStyle:FontStyle.normal,fontSize: 15,),textAlign: TextAlign.start,),
              Row(
                children: <Widget>[
                  Bola,
                  SizedBox(width: 5,),
                  textoo,
                  SizedBox(width: 60,),
                  ButtonBar( children: <Widget>[
                    Container(width:80,height:35,color: Colors.red,child: Center(child: Text('Seguir',textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white,fontStyle:FontStyle.normal,fontSize: 15,),)))
                  ],)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget textoo = Column(
    children: <Widget>[
      Text('El_amor_de_tu_vida',style: TextStyle(color: Colors.white,fontStyle:FontStyle.normal,fontSize: 15,),textAlign: TextAlign.start,),
      SizedBox(width: 5,),
      Text('Empezo a seguirte. 3sem',style: TextStyle(color: Colors.grey,fontStyle:FontStyle.normal,fontSize: 15,),textAlign: TextAlign.start,)
    ],
  );
  Widget Bola = Container(
    height: 60,
    width: 60,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        color: Colors.lightBlue
    ),
    child: Center(child: Text('EF'),),
  );
}
