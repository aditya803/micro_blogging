import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState  createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:Color(0xFFD5A893),
          title: Text('Profile',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        ),
      body: ListView(
        children: <Widget>[
          createProfileTopView(),

          Container(
           height: 480,

            color: Color(0xFFB79389),

            child: Padding(
              padding: const EdgeInsets.only(left: 100,top: 10),
              child: Text("My Blogs",style: TextStyle(color: Colors.brown,fontWeight: FontWeight.bold,fontSize: 40),),
            ),

          )
        ],
      ),
    );
  }

  createProfileTopView(){

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(17),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage("https://miro.medium.com/max/2560/1*EdiYhIyg-QR-QsojYoVd4A.jpeg"),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          createColumns("blogs",0),
                          createColumns("Subscribers",0),

                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          createButton()
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 13),
              child: Text(
                "Mr Brown",style: TextStyle(fontSize: 14,color:Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 5),
              child: Text(
                "BlogItMyWay",style: TextStyle(fontSize: 18,color:Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 3),
              child: Text(
                "Blogger",style: TextStyle(fontSize: 18,color:Colors.white70),
              ),
            )
          ],

        ),
      ),
    );
  }
  Column createColumns(String title,int count){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          count.toString(),
          style: TextStyle(fontSize: 20,color: Colors.brown,fontWeight: FontWeight.bold),
        ),
        Container(
          margin: EdgeInsets.only(top: 5),
          child: Text(
            title,
            style: TextStyle(fontSize: 16,color: Colors.brown,fontWeight: FontWeight.w300),
          ),
        )
      ],
    );
  }

  createButton(){


    return createButtonTitleAndFunction(title:"Edit Profile");

  }


  Container createButtonTitleAndFunction({String title, Function performFunction}) {
    return Container(
      padding: EdgeInsets.only(top: 3),
      child: FlatButton(

        child: Container(
          width: 200,
          height: 26,
          child: Text(title,style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.brown.shade600,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );

  }
}







