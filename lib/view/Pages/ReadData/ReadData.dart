import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ToDoPage extends StatefulWidget {
  ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('Product').snapshots();
  CollectionReference _todo = FirebaseFirestore.instance.collection('Product');
  var _toDoName = TextEditingController();
  Future<void> DeleteProduct(Productname) {
    return _todo
        .doc("${Productname!}")
        .delete()
        .then((value) => print("Product Deleted"))
        .catchError((error) => print("Failed to delete Product: $error"));
  }

  Future<void> updateUser(Productname, toDoName) {
    return _todo
        .doc("${Productname!}")
        .update({'full_name': toDoName})
        .then((value) => print("Product Updated"))
        .catchError((error) => print("Failed to update Product: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              // print(document.id"]);
              return Center(
                  child: Row(children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Color.fromARGB(255, 29, 191, 219),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(
                        data['full_name'],
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            data['Title'],
                            textAlign: TextAlign.left,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )),
                          SizedBox(
                            width: 5,
                          ), 
                          IconButton(
                              onPressed: () => {DeleteProduct(document.id)},
                              icon: Icon(Icons.delete))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ]))
              ]));
            }).toList(),
          );
        });
  }
}
