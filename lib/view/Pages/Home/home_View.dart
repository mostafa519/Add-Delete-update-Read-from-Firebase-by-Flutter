import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/view/Pages/ReadData/ShowData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/controller.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Controller c = Get.put(Controller());
  var _toDoTitle = TextEditingController();
  var _toDoCompany = TextEditingController();
  var _toDoName = TextEditingController();
  CollectionReference _todo = FirebaseFirestore.instance.collection('Product');
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> addTodo(String fullName, String company, String toDoTitle) {
    return _todo
        .add({
          'userId': auth.currentUser!.uid ?? "no user",
          // 'userId': _todo.doc()!.id ?? "no user",
          'Title': toDoTitle,
          'full_name': fullName,
          'company': company,
        })
        .then((value) => print("Done"))
        .catchError((error) => print("Failed to add To Do: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.amber,
        title: Text("Home"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "To Do Name",
              ),
              controller: _toDoName,
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "To Do Company",
              ),
              controller: _toDoCompany,
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "To Do Title",
              ),
              controller: _toDoTitle,
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  addTodo(_toDoName.text, _toDoCompany.text, _toDoTitle.text);
                },
                child: Icon(Icons.add)),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(ShowData());
                },
                child: Text("Todo")),
          ],
        ),
      ),
    );
  }
}
