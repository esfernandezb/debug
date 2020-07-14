
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../foto.dart';
import '../global.dart';
import 'Pagina_User.dart';
class Actualizar extends StatefulWidget {
  @override
  _ActualizarState createState() => _ActualizarState();
}

class _ActualizarState extends State<Actualizar> {
  final _fromKey = GlobalKey<FormState>();
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
    doc = Global.doc ;
  }
  bool _isEnabled = true;
  void initState() {
    passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(
        color: Colors.black,
        child: ListView(
            children: <Widget>[
              Form(
                key: _fromKey,
                child: Column(
                    children: <Widget>[
                     SizedBox(height: 100,),
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
                            child: Text("Actualizar",style: TextStyle(fontStyle: FontStyle.normal,fontSize:16,fontWeight: FontWeight.bold,color: Colors.white),),
                            splashColor: Colors.blue,
                            color: Colors.blue,
                            onPressed: ()  {
                              if (_fromKey.currentState.validate()){

                                actualizar(context);

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


  actualizar(BuildContext context) async{
    final _firebaseStorageRef = FirebaseStorage.instance;
    final _db = Firestore.instance;
    var image = CardFoto.galleryFile;
    DocumentReference ref = _db.collection('Usuarios').document(email.text);
    if(image != null){
      final StorageUploadTask task = _firebaseStorageRef.ref().child("Usuarios")
          .child("${email.text}.png").putFile(image);
      if(await task.onComplete != null){
        StorageTaskSnapshot storageTaskSnapshot = await task.onComplete;
        String imgUrl = await storageTaskSnapshot.ref.getDownloadURL();
        ref.setData({
          'Nombre': '${nombre.text}',
          'Image': '$imgUrl'
        }).then((onValue){
          Navigator.of(context).push(new PageRouteBuilder(
              pageBuilder: (_,__,___) => new DetailsUsuarios()
          ));
        });
      }
    }else{
      if(_image != null){
        ref.setData({
          'Nombre': '${nombre.text}',
          'Image': '$_image'
        }).then((onValue){
          Navigator.of(context).push(new PageRouteBuilder(
              pageBuilder: (_,__,___) => new DetailsUsuarios()
          ));
        });
      }else{
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Seleccione una imagen')));
      }
    }
  }
}
