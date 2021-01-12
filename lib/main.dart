import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:how_much_flutter/auth/auth_bloc.dart';
import 'package:how_much_flutter/constants.dart';
import 'package:how_much_flutter/login_main/login.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: PrimaryColor,
          brightness: Brightness.dark,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
