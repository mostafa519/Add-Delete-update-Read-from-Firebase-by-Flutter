import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/view/Pages/ReadData/ShowData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/controller.dart';

class DeletePage extends StatefulWidget {
  DeletePage({super.key});

  @override
  State<DeletePage> createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  final Controller c = Get.put(Controller());
  var _toDoController = TextEditingController();
  CollectionReference _todo = FirebaseFirestore.instance.collection('Product');
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> DeleteProduct(Productname) {
    return _todo
        .doc("${Productname!}")
        .delete()
        .then((value) => print("Product Deleted"))
        .catchError((error) => print("Failed to delete Product: $error"));
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
              controller: _toDoController,
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  DeleteProduct(_toDoController.text);
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
