import 'package:flutter/material.dart';
import 'package:orbital_app/models/user.dart';
import 'package:orbital_app/screens/home/home.dart';
import 'package:orbital_app/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {

  static const String routeName = "/wrapper";
  @override
  Widget build(BuildContext context) {
    //return either home or authenticate depending or logged in
    final user = Provider.of<Individual>(context);
    
    if (user == null) {
      return Authenticate();
    }
    return Home();
  }
}