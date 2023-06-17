import 'package:firebase/view/Pages/Home/home_View.dart';
import 'package:firebase/view/Pages/Layout/MainLayout.dart';
import 'package:firebase/view/Pages/SignIn/signin.dart';
import 'package:firebase/view/Pages/User/users.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/controller.dart';
import 'package:firebase_auth/firebase_auth.dart';

class logIn extends StatefulWidget {
  logIn({super.key});

  @override
  State<logIn> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<logIn> {
  var email = TextEditingController();
  var _password = TextEditingController();
  var _passwdVisible = true;
  final _formKey = GlobalKey<FormState>();
  final Controller c = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 206, 74, 74),
        title: Text(
          "Log In",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                print("Accunt Box");
              },
              icon: Icon(Icons.account_box)),
          IconButton(onPressed: () {}, icon: Icon(Icons.phone)),
          IconButton(onPressed: () {}, icon: Icon(Icons.wifi_rounded)),
        ],
        foregroundColor: Color.fromARGB(255, 38, 123, 221),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(
                    radius: 60, // Image radius
                    backgroundImage: NetworkImage(
                        "https://thumbs.dreamstime.com/b/sun-flower-transparent-background-additional-png-file-greeting-cards-holiday-wishes-sun-flower-transparent-129371261.jpg")),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "email",
                      prefixIcon: Icon(Icons.email),
                    ),
                    controller: email,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        // print('Please enter your Email ');
                        return 'Please enter your Email ';
                      } else {
                        return null;
                      }
                    }),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _passwdVisible,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      // print('Please enter your PassWord ');
                      return 'Please enter your PassWord ';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "password",
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(
                          () {
                            _passwdVisible = !_passwdVisible;
                          },
                        );
                      },
                      icon: Icon(_passwdVisible
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),
                  controller: _password,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: email.text, password: _password.text);
                        Get.to(MainLayot());
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                        }
                      }
                    }
                  },
                  child: const Text(
                    'Login',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {
                      Get.to(Registration());
                    },
                    child: Text("Sing Up")),
                SizedBox(
                  height: 20,
                ),
                // TextButton(
                //     onPressed: () {
                //       Get.to(MainLayot());
                //     },
                //     child: Text("Home")),
                // SizedBox(
                //   height: 20,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
