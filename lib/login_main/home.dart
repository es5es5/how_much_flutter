import 'dart:async';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:how_much_flutter/auth/auth_bloc.dart';
import 'package:how_much_flutter/login_main/login.dart';
import 'package:how_much_flutter/screens/pay_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  StreamSubscription<User> loginStateSubscription;

  @override
  void initState() {
    @override
    void initState() {
      var authBloc = Provider.of<AuthBloc>(context, listen: false);
      loginStateSubscription = authBloc.currentUser.listen((user) {
        if (user == null) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LoginScreen()));
        }
      });
      super.initState();
    }
  }

  @override
  void dispose() {
    loginStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var authBloc = Provider.of<AuthBloc>(context);

    return Scaffold(
      body: Center(
        child: StreamBuilder<User>(
            stream: authBloc.currentUser,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return CircularProgressIndicator();
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    snapshot.data.displayName,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber),
                  ),
                  SizedBox(height: 20),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        snapshot.data.photoURL.replaceFirst('s96', 's400')),
                    radius: 60,
                  ),
                  SizedBox(height: 20),
                  FlatButton(
                    onPressed: () => {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => PayListPage()))
                    },
                    color: Colors.grey,
                    child: Text('장부입력'),
                  ),
                  FlatButton(
                    onPressed: () => {
                      authBloc.logout()
                    },
                    color: Colors.grey,
                    child: Text('로그아웃'),
                  ),
                  // SignInButton(Buttons.Google,
                  //     text: 'Sign out', onPressed: () => authBloc.logout()),
                ],
              );
            }),
      ),
    );
  }
}
