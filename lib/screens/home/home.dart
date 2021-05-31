import 'package:flutter/material.dart';
// import 'package:orbital_app/services/auth.dart';
import 'package:orbital_app/shared/drawer.dart';

class Home extends StatelessWidget {
  
  static const String routeName = "/home";

  // final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      backgroundColor: Colors.red[400],
      appBar: AppBar(
        title: Text("Home Screen"),
        backgroundColor: Colors.red[300],
        // actions: <Widget>[
        //   TextButton.icon(
        //     icon: Icon(Icons.person),
        //     label: Text("logout"),
        //     onPressed: () async{
        //       await _auth.signOut();
        //     },
        //   )
        // ],
      ),
    );
  }
}