import 'package:firebase/view/Pages/Login/login.dart';
import 'package:firebase/view/Pages/authData/authData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Registration extends StatefulWidget {
  Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  var _passwdVisible = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        // Color(0xffe64674)
        // centerTitle: true,
        title: const Text(
          "Sing up",
          style:
              // Theme.of(context).textTheme.labelSmall,
              TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                print("account");
              },
              icon: Icon(Icons.account_box)),
          IconButton(
              onPressed: () {
                print("phone");
              },
              icon: Icon(Icons.phone)),
          IconButton(
              onPressed: () {
                print("account");
              },
              icon: Icon(Icons.account_box)),
          IconButton(
              onPressed: () {
                print("phone");
              },
              icon: Icon(Icons.phone)),
        ],
        foregroundColor: Colors.teal,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Image(
                    width: 120,
                    height: 200,
                    image: NetworkImage(
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
                    controller: _emailController,
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
                  controller: _passwordController,
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                          Get.to(AuthData());
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                          }
                        } catch (e) {
                          print(e);
                        }
                      }
                    },
                    child: Text("Sign Up")),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () {
                    Get.to(logIn());
                  },
                  child: Text("sign In"),
                  color: Colors.amber,
                  hoverColor: Colors.green,
                  minWidth: double.infinity,
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
