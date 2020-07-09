import 'package:flutter/material.dart';
import 'package:microblogging/screens/HomePage.dart';

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
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => HomePage(),
      },
    );
  }
}
