import 'package:flutter/material.dart';
import 'package:simple_flutter_login/ui/home_screen.dart';
import 'package:simple_flutter_login/ui/login_screen.dart';
import 'package:simple_flutter_login/preferences/pref_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PrefManager.getIsLogin.then((value) => {

          Future.delayed(Duration(seconds: 3), () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) {
                  if(value == 1) return HomeScreen();
                  else return LoginScreen();
                })
            );
          })
        });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          child: Image.asset('images/flutter.png'),
        ),
      ),
    );
  }
}
