import 'package:cloud_firestore/cloud_firestore.dart';
import 'file:///C:/Users/gomez/AndroidStudioProjects/trabajo%20de%20android/debug/lib/instagram/pages/Pagina_User.dart';
import 'package:debug/instagram/usuario.dart';
import 'package:flutter/material.dart';
import '../global.dart';

class search extends StatefulWidget {
  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {
  final _db = Firestore.instance;
  String name;
  List<Usuario> listUser;
  @override
  void initState(){
    super.initState();
    _isSearching = false;
    listUser = List<Usuario>();
    _users = SizedBox();
    readData();
  }
  Widget appBarTitle = Text(
    "Search user",
    style: TextStyle(color: Colors.white),
  );
  Icon icon = Icon(
    Icons.search,
    color: Colors.white,
  );
  bool _isSearching;
  Widget _users;
  final TextEditingController _controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: appBarTitle,
        actions: <Widget>[
          IconButton(
              icon: icon,
              onPressed:(){
                setState(() {
                  if(this.icon.icon == Icons.search){
                    this.icon = Icon(
                      Icons.close,
                      color: Colors.white,
                    );
                    this.appBarTitle = TextField(
                      controller: _controller,
                      style: new TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search, color: Colors.white),
                          hintText: "Search...",
                          hintStyle: TextStyle(color: Colors.white)
                      ),
                      onChanged: searchOperation,
                    );
                    _handleSearchStart();
                  }else{
                    searchOperation(null);
                    _handleSearchEnd();
                  }
                });
              }
          ),
        ],
      ),
      body: Container(
        color:Colors.black,
        //Image.asset('assets/img/insta.jpg'),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Image.asset('assets/img/instagram.jpg',height: 110,),
                _users,
                SizedBox(height: 150.0,),
                Divider(color:Colors.white ,),

              ],
            )
          ],
        ),

      ),
    );
  }

  Container buildItem (Usuario doc){
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
  void readData(){
    Stream<QuerySnapshot> qs = _db.collection('Usuarios').snapshots();
    qs.listen((QuerySnapshot onData)=>{
      onData.documents.map((doc)=>{
        listUser.add(Usuario(
            doc.data['Nombre'],
            doc.data['Image'],
            doc.documentID
        )),
      }).toList(),
      userList(null),
    });
  }

  GestureDetector card(Usuario doc){

    return new GestureDetector(
        onTap: () =>{
          Global.doc= doc,
          Navigator.of(context).push(new PageRouteBuilder(
            pageBuilder: (_, __, ___) => new DetailsUsuarios(),
          ))
        },
        child: new Container(
          height: 60.0,
          margin: new EdgeInsets.only(left: 10.0),
          decoration: new BoxDecoration(
            color: Colors.black,
            borderRadius: new BorderRadius.circular(50.0),

          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        '${doc.Nombre}',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),

                    ],
                  ),
                ] ),
          ),
        ) );
  }
  Container thumbnail(Usuario doc){
    return Container(
      alignment: FractionalOffset.centerLeft,
      child: new Container(
        height: 60.0,
        width: 60.0,
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(50.0),
          image: DecorationImage(
            image: NetworkImage(doc.Image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
  void _handleSearchStart() {
    setState(() {
      _isSearching = true;
    });
  }
  void _handleSearchEnd(){
    setState(() {
      this.icon = Icon(
        Icons.search,
        color: Colors.white,
      );
      this.appBarTitle = Text(
        "Search user",
        style: new TextStyle(color: Colors.white),
      );
      _isSearching = false;
      _controller.clear();

    });
  }
  void searchOperation(String searchText){
    if(_isSearching){
      userList(searchText);
    }
  }
  void userList(String searchText){
    setState(() {
      if(listUser != null){
        if(searchText == null || searchText == ""){
          _users = Column(
              children: listUser.map((user) => buildItem(user)).toList()
          );

        }else{
          var usuario = listUser.where((item)=> item.Nombre.startsWith(searchText)).toList();
          if(0 < usuario.length){
            _users =  Column(
                children: usuario.map((user) => buildItem(user)).toList()
            );
          }else{
            _users = SizedBox();
          }
        }
      }else{
        _users = SizedBox();
      }
    });

  }


}
class Global{
  //static DocumentSnapshot doc;
  static Usuario doc;
}