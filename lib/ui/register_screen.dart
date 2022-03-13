import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:simple_flutter_login/model/register_model.dart';
import 'package:simple_flutter_login/utils/api_util.dart';

import 'login_screen.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  String name = '';
  String email = '';
  String password = '';
  String confirm = '';
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
                  child: Text('Sign Up',
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
                      border: UnderlineInputBorder(), labelText: 'Your name'),
                  onChanged: (String text) {
                    name = text;
                  },
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
              SizedBox(height: 10),
              Container(
                child: TextFormField(
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Your password confirm'),
                  onChanged: (String text) {
                    confirm = text;
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
                    child: Text('Have account?',
                        style: TextStyle(fontSize: 16)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                    padding: EdgeInsets.all(5.0),
                    child: InkWell(
                      child: Text('Sign In',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
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
            if (isRequired()) register();
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
    if (name.isEmpty) {
      Fluttertoast.showToast(msg: "Name is required");
      return false;
    } else if (email.isEmpty) {
      Fluttertoast.showToast(msg: "Email is required");
      return false;
    } else if (password.isEmpty) {
      Fluttertoast.showToast(msg: "Password is required");
      return false;
    } else if (password != confirm) {
      Fluttertoast.showToast(msg: "Password not same");
      return false;
    }
    return true;
  }

  register() async {
    setState(() {
      isLoading = true;
    });

    final response = await http.post(
        ApiUtil.baseUrl("register.php"),
        body: {
            'name': name,
            'email': email,
            'password': password
        });

    if (response.statusCode == 200) {
      var register = RegisterModel.fromJson(jsonDecode(response.body));
      Fluttertoast.showToast(msg: register.message);
      print("Response ${register.message}");
    } else {
      var error = RegisterModel.fromJson(jsonDecode(response.body));
      Fluttertoast.showToast(msg: error.message);
      print("Response ${error.message}");
    }
  }
}
