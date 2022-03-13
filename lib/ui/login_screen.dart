import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:simple_flutter_login/model/error_model.dart';
import 'package:simple_flutter_login/model/login_model.dart';
import 'package:simple_flutter_login/ui/home_screen.dart';
import 'package:simple_flutter_login/ui/register_screen.dart';
import 'package:simple_flutter_login/utils/api_util.dart';
import 'package:simple_flutter_login/preferences/pref_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(top: 40.0),
                  child: Text('Sign In',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: TextFormField(
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(), labelText: 'Your email'),
                  onChanged: (String text) {
                    email = text;
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: TextFormField(
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Your password'),
                  onChanged: (String text) {
                    password = text;
                  },
                ),
              ),
              SizedBox(height: 20),
              isLoading ? setLoading() : setButton(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                    padding: EdgeInsets.all(5.0),
                    child: Text('Don\'t have account?',
                        style: TextStyle(fontSize: 16)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                    padding: EdgeInsets.all(5.0),
                    child: InkWell(
                      child: Text('Sign Up',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => RegisterScreen()));
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget setButton() {
    return Container(
        width: double.infinity,
        child: MaterialButton(
          onPressed: () {
            if (isRequired()) login();
          },
          height: 50,
          color: Colors.blueAccent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Text(
            'Sign In',
            style: TextStyle(color: Colors.white),
          ),
        ));
  }

  Widget setLoading() {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(),
        ));
  }

  bool isRequired() {
    if (email.isEmpty) {
      Fluttertoast.showToast(msg: "Email is required");
      return false;
    } else if (password.isEmpty) {
      Fluttertoast.showToast(msg: "Password is required");
      return false;
    }
    return true;
  }

  login() async {
    setState(() => isLoading = true);

    final response = await http.get(ApiUtil.baseUrl("login.php?email=$email&password=$password"));

    if (response.statusCode == 200) {
      var login = LoginModel.fromJson(jsonDecode(response.body));
      Fluttertoast.showToast(msg: login.message);
      print("Response ${login.data.toString()}");

      PrefManager.setIsLogin(1);
      PrefManager.setUserData(response.body);

      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));

    } else {
      var error = ErrorModel.fromJson(jsonDecode(response.body));
      Fluttertoast.showToast(msg: error.message);
      print("Response ${error.message}");
    }
  }
}
