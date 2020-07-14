
import 'file:///C:/Users/gomez/AndroidStudioProjects/trabajo%20de%20android/debug/lib/instagram/pages/Agg_foto.dart';
import 'file:///C:/Users/gomez/AndroidStudioProjects/trabajo%20de%20android/debug/lib/instagram/pages/Pagina_User.dart';
import 'file:///C:/Users/gomez/AndroidStudioProjects/trabajo%20de%20android/debug/lib/instagram/pages/search.dart';

import 'package:flutter/material.dart';

import 'Bandeja.dart';
import 'home.dart';



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  int _seletedItem = 0;
  var _pages = [HomePage(), search(), PhotoUploadSate(),bandeja(),DetailsUsuarios()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages[_seletedItem],),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white30,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home,), title: Text(''),),
          BottomNavigationBarItem(icon: Icon(Icons.search,), title: Text('')),
          BottomNavigationBarItem(icon: Icon(Icons.add_box,), title: Text('')),
          BottomNavigationBarItem(icon: Icon(Icons.favorite,), title: Text('')),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline,), title: Text('')),
        ],
        currentIndex: _seletedItem,
        onTap: (index){
          setState(() {
            _seletedItem = index;

        },
      );
    }
    ),
    );
  }
}