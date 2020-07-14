

import 'file:///C:/Users/gomez/AndroidStudioProjects/trabajo%20de%20android/debug/lib/instagram/pages/carga.dart';

import 'package:flutter/material.dart';


void main() => runApp(Prueba());
class Prueba extends StatelessWidget{
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
  @override
  Widget  build(BuildContext context) {
    return MaterialApp(
      theme:  ThemeData(primarySwatch: Colors.red),
      home: new TestScreen(),
    );
  }
}

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: entrada(),
      /*appBar: AppBar(
        title: Text('Notas'),
      ),
      body: Container(
        decoration:  new BoxDecoration(
          gradient:  LinearGradient(
              colors: [Colors.yellow,Colors.orange,Colors.red],
          stops: [0.2,0.6,0.8],
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter)
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_texto,style: TextStyle(fontSize: 20)),
              SizedBox(height: 20,),
              RaisedButton(
                color: Colors.red,
                child: Text('Edita',style: TextStyle(fontSize: 20),),
                  onPressed:(){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditScreen(_texto),
                  )).then((result){
                    if (result != null)
                    setState(() {
                      _texto = result;
                    });
                  });
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class EditScreen extends StatefulWidget {
  final String texto;
  EditScreen(this.texto) ;

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text:this.widget.texto);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit the Text'),
        ),
        body: Container(
          decoration:  new BoxDecoration(
              gradient:  LinearGradient(
                  colors: [Colors.yellow,Colors.orange,Colors.red],
                  stops: [0.2,0.6,0.8],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter)
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
                child: Column(children: <Widget>[
                  TextField(
                    controller: _controller,
                  ),
                  RaisedButton(
                    color: Colors.red,
                      child: Text('Guardar',style: TextStyle(fontSize: 20)),onPressed:(){
                        Navigator.of(context).pop(_controller.text);
                  })
                ],)
            ),
          ),
        )*/
    );
  }
}
