import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:microblogging/screens/HomePage.dart';
import 'package:microblogging/screens/LoginPage.dart';
import 'package:microblogging/screens/RegisterPage.dart';
import 'package:microblogging/screens/Welcome.dart';
import 'screens/HomePage.dart';


void main(){
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  String page = "WelcomePage.id";
  final storage = FlutterSecureStorage();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  void checkLogin() async{
    String token = await storage.read(key: "token");
    if(token != null){
      setState(() {
        page = "HomeScreen.id";
      });
    }
    else{
      setState(() {
        page = "WelcomePage.id";
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Micro-Blogging',
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.amber
      ),
      initialRoute: page,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        WelcomePage.id: (context) => WelcomePage(),
        RegisterPage.id: (context)=> RegisterPage(),
        LoginPage.id: (context) =>  LoginPage()
      },
    );
  }
}

