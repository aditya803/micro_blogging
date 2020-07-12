import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:microblogging/models/recommendations.dart';
import 'package:microblogging/screens/SideNav.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  static const String id= '/HomePage';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //page controller
  final _pageController=PageController(viewportFraction: 0.877);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor:Color(0xFFD5A893),
        title: Text('Blogging app',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      drawer: navBar(),
      body: SafeArea(
        child: Container(

          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
//              Container(
//                height: 57.6,
//                margin: EdgeInsets.only(top: 28.8,left: 28.8,right: 28.8),
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
//                    //custom navigation drawer and search button
//                    Container(
//                      height: 57.6,
//                      width: 57.6,
//                      padding: EdgeInsets.all(18),
//                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(9.6),
//                          color: Color(0x080a0928)),
//                      child: SvgPicture.asset("assets/svg/menu.svg"),
//                    ),
//                    Container(
//                      height: 57.6,
//                      width: 57.6,
//                      padding: EdgeInsets.all(18),
//                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(9.6),
//                        color: Color(0x080a0928),
//                      ),
//                      child: SvgPicture.asset("assets/svg/search.svg"),
//                    )
//                  ],
//                ),
//              ),
              //Text Widget for title
              Padding(padding: EdgeInsets.only(top: 48,left: 28.8),
                child: Text("Find\nYour Genre",style: GoogleFonts.playfairDisplay(
                    fontSize: 45.6,
                    fontWeight: FontWeight.w700,
                  color: Colors.brown.shade600
                ),),
              ),

              SizedBox(
                height: 30,
              ),
              Container(
                height: 250.4,
                margin: EdgeInsets.only(top: 16),
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(recommendations.length, (index) => Container(

                    margin: EdgeInsets.only(right: 28.8),
                    width: 333.6,
                    height: 218.4,
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(9.6),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(recommendations[index].image),
                        )
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          bottom: 19.2,
                          left: 19.2,
                          child: ClipRRect(borderRadius: BorderRadius.circular(4.8),
                            child: BackdropFilter(filter: ImageFilter.blur(
                                sigmaY: 19.2,
                                sigmaX: 19.2
                            ),
                              child: Container(
                                height: 36,
                                padding: EdgeInsets.only(left: 16.72,right: 14.4),
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: <Widget>[
                                    SvgPicture.asset("assets/svg/search.svg"),
                                    SizedBox(width: 9.52,),
                                    Text(recommendations[index].name,
                                      style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          fontSize: 16.8
                                      ),)
                                  ],
                                ),
                              ),),
                          ),
                        )
                      ],
                    ),
                  )),
                ),
              ),

              //dots indicator
              Padding(padding: EdgeInsets.only(left:28.8,top: 28.8 ),
                child: SmoothPageIndicator(controller: _pageController,count: recommendations.length,
                  effect: ExpandingDotsEffect(
                      activeDotColor: Colors.brown.shade600,
                      dotColor: Color(0xFFD5A893),
                      dotHeight: 4.8,
                      dotWidth: 6,
                      spacing: 4.8
                  ),),
              ),


            ],
          ),
        ),
      ),
    );
  }
}