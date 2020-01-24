import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/screens/authenticate/register.dart';
import 'package:brew_crew/screens/authenticate/sign_in.dart';
import 'package:brew_crew/screens/wrapper.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user ,
      child: MaterialApp(
        home: wrapper(),
        routes: {
          '/register': (context) => register(),
          '/signin': (context) => SignIn()
        },
        )
      );
  }  
}