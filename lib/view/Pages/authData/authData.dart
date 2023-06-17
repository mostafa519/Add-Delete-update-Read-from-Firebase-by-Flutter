import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthData extends StatefulWidget {
  AuthData({super.key});

  @override
  State<AuthData> createState() => _AuthDataState();
}

class _AuthDataState extends State<AuthData> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
            child: Column(children: [Text("${auth.currentUser}")])),
      ),
    );
  }
}
