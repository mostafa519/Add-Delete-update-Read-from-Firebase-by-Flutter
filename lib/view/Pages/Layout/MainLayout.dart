import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/view/Pages/DeleteUser/DeleteUser.dart';
import 'package:firebase/view/Pages/Home/home_View.dart';
import 'package:firebase/view/Pages/ReadData/ShowData.dart';
import 'package:firebase/view/Pages/updateUser/update.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/controller.dart';

class MainLayot extends StatefulWidget {
  MainLayot({super.key});

  @override
  State<MainLayot> createState() => _MainLayotState();
}

class _MainLayotState extends State<MainLayot> {
  final Controller c = Get.put(Controller());
  int _currentIndex = 0;
  var toDoController = TextEditingController();
  List<Widget> pages = [HomePage(), UpdatePage(), DeletePage()];
  CollectionReference _todo = FirebaseFirestore.instance.collection('Product');
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> addTodo(String toDoTitle) {
    return _todo
        .add({
          'userId': auth.currentUser!.uid ?? "no user",
          'toDoTitle': toDoTitle
        })
        .then((value) => print("To Do Added"))
        .catchError((error) => print("Failed to add To Do: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.update), label: "update"),
          BottomNavigationBarItem(icon: Icon(Icons.delete), label: "delete"),
        ],
        onTap: (index) {
          _currentIndex = index;

          // print(_currentIndex);
          setState(() {});
        },
      ),
      body: pages[_currentIndex],
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Get.bottomSheet(Container(
      //       height: 150,
      //       color: Colors.white,
      //       width: double.infinity,
      //       child: Center(
      //         child: Column(
      //           children: [
      //             TextFormField(
      //               keyboardType: TextInputType.emailAddress,
      //               decoration: InputDecoration(
      //                 border: OutlineInputBorder(),
      //                 hintText: "To Do Title",
      //               ),
      //               controller: toDoController,
      //             ),
      //             SizedBox(
      //               height: 40,
      //             ),
      //             ElevatedButton(
      //                 onPressed: () {
      //                   addTodo(toDoController.text);
      //                 },
      //                 child: Icon(Icons.add)),
      //           ],
      //         ),
      //       ),
      //     ));
      //   },
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
