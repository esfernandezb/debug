import 'file:///C:/Users/gomez/AndroidStudioProjects/trabajo%20de%20android/debug/lib/instagram/pages/Lista_usuario.dart';
import 'package:debug/instagram/Posts.dart';
import 'file:///C:/Users/gomez/AndroidStudioProjects/trabajo%20de%20android/debug/lib/instagram/pages/Pagina_User.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Posts> postList = List();

  final fb = FirebaseDatabase.instance.reference().child("Posts");

  @override
  void initState() {
    super.initState();
    fb.once().then((DataSnapshot snap){
      var data = snap.value;
      postList.clear();
      data.forEach((key, value) {
        Posts posts = Posts(
            image: value['image'],
            descripcion: value['descripcion'],
            date: value['date'],
            time: value['time']
        );

        postList.add(posts);
      });
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
            actions: <Widget>[
              InkWell(
                child: Icon(Icons.arrow_back_ios,color: Colors.black,),
                onTap: (){
                  Navigator.of(context).push(new PageRouteBuilder(
                      pageBuilder: (_,__,___) => new ListaUser()
                  ));
                },
              ),
            ]  ),
        body: Container(
          color: Colors.black,
          child: postList.length == 0
              ? Text("No Blog Available")
              : ListView.builder(
            itemCount: postList.length,
            itemBuilder: (_, index){
              return postsUI(
                  postList[index].image,
                  postList[index].descripcion,
                  postList[index].date,
                  postList[index].time
              );
            },
          ),
        ),
        );
  }

  Widget postsUI(String image, String description, String date, String time){
    return Card(
      elevation: 10.0,
      margin: EdgeInsets.all(14.0),
      child: Container(
        padding: EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment:  MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  date,
                  style: Theme.of(context).textTheme.subtitle2,
                  textAlign: TextAlign.center,
                ),
                Text(
                  time,
                  style: Theme.of(context).textTheme.subtitle2,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 10.0,),
            Image.network(
                image,
                fit: BoxFit.cover
            ),
            SizedBox(height: 10.0,),
            Text(
              description,
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}