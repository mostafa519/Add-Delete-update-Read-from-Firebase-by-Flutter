import 'package:firebase/view/Pages/ReadData/ReadData.dart';
import 'package:flutter/material.dart';

class ShowData extends StatefulWidget {
  ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(child: ToDoPage()),
    );
  }
}
