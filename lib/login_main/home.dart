import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:how_much_flutter/login_main/login.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'How Much ?',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber),
            ),
            SizedBox(height: 20),
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://engineering.linecorp.com/wp-content/uploads/2019/08/flutter1.png'),
              radius: 60,
            ),
            SizedBox(height: 20),
            SignInButton(Buttons.Google,
                text: 'Sign out',
                onPressed: () => {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => LoginScreen()))
                    })
          ],
        ),
      ),
    );
  }
}
