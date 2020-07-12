import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:microblogging/screens/ProfilePage.dart';


class navBar extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    Widget itemTile(String name, Function onTap){
      return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          height: 30.0,
          child: InkWell(
            onTap: onTap,
            child: Text(
              name,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF707070)
              ),
            ),
          ),
        ),
      );
    }
//    Widget subTile(String name, Function onTap){
//      return Padding(
//        padding: EdgeInsets.only(left: 30.0),
//        child: Align(
//          alignment: Alignment.centerLeft,
//          child: Container(
//            height: 25.0,
//            child: InkWell(
//              onTap: onTap,
//              child: Text(
//                name,
//                style: TextStyle(
//                  fontWeight: FontWeight.w300,
//                  color: Color(0xFF707070),
//                  fontFamily: 'PlayfairDisplay',
//                ),
//              ),
//            ),
//          ),
//        ),
//      );
//    }
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
              height: 120.0,
              color: Color(0xFFD5A893),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
                child: Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {

                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text('Home',
                        style: GoogleFonts.playfairDisplay(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    )
                  ],
                ),
              )
          ),
          Padding(padding: EdgeInsets.only(left: 30, top: 10.0),
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: (){},
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('assets/Images/dp.jpg'),
                    backgroundColor: Color(0xFFB79389),
                  ),
                ),
                SizedBox(height: 50.0),
                itemTile('My Blogs', (){
                  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                }),
                itemTile('Settings', (){}),
                itemTile('Log Out', (){}),
              ],
            ),
          )
        ],
      ),
    );

  }
}