import 'package:microblogging/models/NetworkHandling.dart';
import 'package:microblogging/screens/ForgotPassword.dart';
import 'package:microblogging/screens/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:microblogging/screens/RegisterPage.dart';



class LoginPage extends StatefulWidget{
  static const String id = '/LoginPage';

  @override
  LoginPageState createState() => LoginPageState();
}
class LoginPageState extends State<LoginPage> {
  NetworkHandling networkHandling = NetworkHandling();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool validator= false;
  bool circular= false;
  String errorText;
  bool vis = true;
  final _globalkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.5, 1],
                  colors: [Color(0xFF8F6255), Color(0xFFB79389)]
              )
          ),
          child: Form(
            key: _globalkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
//              Container(
//                height: 100.0,
//                decoration: BoxDecoration(
//                  image: DecorationImage(
//                      image: AssetImage('assets/images/Exclusion 1.png'),
//                      fit: BoxFit.cover
//                  ),
//                ),
//              ),
//              SizedBox(height: 10.0),
//              Container(
//                height: 200.0,
//                color: Colors.transparent,
//                child: Center(
//                    child: Image.asset('assets/images/Group 208.png')
//                ),
//              ),
                SizedBox(height: 150.0),
                Padding(
                  child: Text(
                    'Existing User..',
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ) ,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 35.0),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(37.5, 20.0, 37.5, 0.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 10.0),
                        TextFormField(
                          controller: _emailController,
                          validator: (value){
                            if(value.isEmpty)
                              return "E-mail can't be empty";
                            if(!value.contains("@"))
                              return "E-mail is invalid";
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'E-mail/Mobile Number',
                              labelStyle: TextStyle(
                                  color: Colors.grey[400]
                              )
                          ),
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          controller: _passController,
                          validator: (value){
                            if(value.isEmpty)
                              return "Password can't be empty";
                            if(value.length <8)
                              return "Password can't be less than 8 characters";
                            return null;
                          },
                          obscureText: vis,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(icon: Icon(vis ? Icons.visibility_off : Icons.visibility),
                                onPressed: (){
                                  setState(() {
                                    vis = !vis;
                                  });
                                },
                              ),
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                color: Colors.grey[400],
                              )
                          ),
                        ),
                      ],
                    )
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                        onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=> ForgotPassword())
                          );
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.brown),
                        )
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(padding: EdgeInsets.symmetric(horizontal: 60.0),
                    child: circular? CircularProgressIndicator():Container(
                        height: 45.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(100.0))
                        ),
                        child: Center(
                          child: InkWell(
                            onTap: () async{
                              setState(() {
                                circular =true;
                              });
                              await checkUser();
                              if(_globalkey.currentState.validate()&& validator)
                              {
                                setState(() {
                                  circular = false;
                                });
                              }
                              else{
                                setState(() {
                                  circular = false;
                                });
                              }
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HomeScreen()),
                              );
                            },
                            child: Text(
                              'Log In',
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),),
                          ),
                        )
                    )
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Don\'t have an account?   ',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterPage()),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.brown,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        )
    );
  }
  checkUser() async{
    if(_emailController.text.length==0){
      setState(() {
        validator =false;
        circular = false;
        errorText = "Please enter an email";
      });
    }
    else{
      var response = await networkHandling.get
        ("/user/checkUserName/${_emailController.text}");
      if(response["Status"])
      {
        setState(() {
          validator =false;
          circular = false;
          errorText = "An account of this Email id already exists";
        });
      }
      else{
        setState(() {
          validator =true;
        });
      }
    }
  }
}