import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';
  bool isLoggedIn = false;
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
              Container(
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {},
                    height: 50,
                    color: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
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
                      onTap: () {},
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
}
