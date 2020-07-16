import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:microblogging/models/NetworkHandling.dart';
import 'package:microblogging/screens/HomePage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class RegisterPage extends StatefulWidget {
  
  static const String id = '/AuthPage';
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  NetworkHandling networkHandling = NetworkHandling();
  bool vis = true;
  bool circular = false;
  bool validator =false;
  String errorText;
  final _globalkey = GlobalKey<FormState>();
  final storage = new FlutterSecureStorage();
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
              colors: [Color(0xFF8F6255), Color(0xFFB79389)]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
//            Container(
//              height: 100.0,
//              decoration: BoxDecoration(
//                image: DecorationImage(
//                    image: AssetImage('assets/images/Exclusion 1.png'),
//                    fit: BoxFit.cover),
//              ),
//            ),
//            SizedBox(height: 10.0),
//            Container(
//              height: 207.0,
//              color: Colors.transparent,
//              child: Center(child: Image.asset('assets/images/Group 208.png')),
//            ),
            SizedBox(height: 150.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.0),
              child: Text(
                'Create an Account..',
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Form(
              key: _globalkey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(37.5, 0.0, 37.5, 0.0),
                    child: Column(
                      children: [
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 5,
                              child: TextFormField(
                                controller: _firstNameController,
                                validator: (value){
                                  if(value.isEmpty)
                                    return "First name can't be empty";
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: 'First Name',
                                  labelStyle: TextStyle(color: Colors.grey[400]),
                                ),
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Expanded(
                              flex: 5,
                              child: TextFormField(
                                controller: _lastNameController,
                                validator: (value){
                                  if(value.isEmpty)
                                    return "Last name can't be empty";
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Last Name',
                                  labelStyle: TextStyle(color: Colors.grey[400]),
                                ),
                              ),
                            ),
                          ],
                        ),
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
                            labelStyle: TextStyle(color: Colors.grey[400]),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          controller: _passController,
                          obscureText: vis,
                          decoration: InputDecoration(
                            errorText: validator? null: errorText,
                            suffixIcon: IconButton(icon: Icon(vis? Icons.visibility_off: Icons.visibility),
                              onPressed: (){
                              setState(() {
                                vis = !vis;
                              });
                              },
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: Colors.grey[400],
                            ),
                          ),
                        ),
                        SizedBox(height: 28.0),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60.0),
                    child: InkWell(
                      onTap: () async{
                        setState(() {
                          circular = true;
                        });
                        await checkUser();
                        if(_globalkey.currentState.validate() && validator){
                          Map<String, String> data = {
                            "First Name": _firstNameController.text,
                            "Last Name": _lastNameController.text,
                            "E-mail": _emailController.text,
                            "Password": _passController.text
                          };
                          print(data);
                          //TODO: add url to store info of user here:
                          var responseRegister = await networkHandling.post(url, data);
                          //TODO: add status code for successful login here
                          if(responseRegister.statusCode== 200|| responseRegister.statusCode==201){
                            Map<String, String> data = {
                              "email" : _emailController.text,
                              "password" : _passController.text,
                            };
                            //TODO: add url to login file here
                            var response = await networkHandling.post(url, data);
                            if(response.statusCode == 200|| response.statusCode == 201){
                              Map <String, dynamic> output = json.decode(response.body);
                              print(output["token"]);
                              await storage.write(key: "token", value: output["token"]);
                              setState(() {
                                validator = true;
                                circular = false;
                              });
                              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                            }
                            else{
                              Scaffold.of(context).showSnackBar(
                                  SnackBar(content: Text("Network Error"))
                              );
                            }
                          }
                          else{
                            setState(() {
                              circular = false;
                            });
                          }
                        }
                        else{
                          setState(() {
                            circular = false;
                          });
                        }
                      },
                      child: Container(
                        height: 45.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(100.0),
                          ),
                        ),
                        child: Center(
                          child: circular? CircularProgressIndicator():Text(
                            'Sign Up',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.brown,
                            ),
                          ),
                        ),
                      ),
                    )
                  ),
                ],
              )
            )
          ],
        ),
      ),
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

