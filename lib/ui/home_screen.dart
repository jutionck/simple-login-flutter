import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:simple_flutter_login/model/login_model.dart';
import 'package:simple_flutter_login/preferences/pref_manager.dart';
import 'package:simple_flutter_login/ui/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String? name;
  String? email;

  @override
  void initState() {
    super.initState();
    PrefManager.getUserData.then((value) {
      LoginModel userLogin = LoginModel.fromJson(jsonDecode(value));
      setState(() {
        email = userLogin.data.email;
        name = userLogin.data.name;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Login as',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20.0),
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    PrefManager.logout().then((value) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    });
                  },
                  height: 50,
                  color: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'Sign Out',
                    style: TextStyle(color: Colors.white),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
