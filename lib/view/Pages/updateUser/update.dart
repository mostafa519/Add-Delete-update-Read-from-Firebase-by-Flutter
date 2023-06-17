import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/view/Pages/ReadData/ShowData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/controller.dart';

class UpdatePage extends StatefulWidget {
  UpdatePage({super.key});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final Controller c = Get.put(Controller());
  var _toDoController = TextEditingController();
  var _toid = TextEditingController();
  CollectionReference _todo = FirebaseFirestore.instance.collection('Product');
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> updateUser(Productname, toDoName) {
    return _todo
        .doc("${Productname!}")
        .update({'full_name': toDoName})
        .then((value) => print("Product Updated"))
        .catchError((error) => print("Failed to update Product: $error"));
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
                hintText: "To Do ID",
              ),
              controller: _toid,
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "To Do Name",
              ),
              controller: _toDoController,
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  updateUser(_toid.text, _toDoController.text);
                },
                child: Icon(Icons.add)),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(ShowData());
                },
                child: Text("Todo"))
          ],
        ),
      ),
    );
  }
}
