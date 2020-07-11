import 'package:flutter/material.dart';
import 'package:microblogging/screens/HomePage.dart';
import 'package:microblogging/screens/LoginPage.dart';
import 'package:microblogging/screens/RegisterPage.dart';
import 'package:microblogging/screens/Welcome.dart';

import 'screens/HomePage.dart';
import 'screens/HomePage.dart';

void main(){
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Micro-Blogging',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.amber
      ),
      initialRoute: WelcomePage.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        WelcomePage.id: (context) => WelcomePage(),
        RegisterPage.id: (context)=> RegisterPage(),
        LoginPage.id: (context) =>  LoginPage()
      },
    );
  }
}
