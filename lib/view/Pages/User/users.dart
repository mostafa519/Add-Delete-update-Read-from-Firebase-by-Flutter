import 'package:firebase/model/Chats/chat.dart';
import 'package:firebase/view/Pages/Login/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class chat extends StatefulWidget {
  chat({super.key});

  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
  List<SampleChatMassage> chatMessags = [
    SampleChatMassage(time: "10:00:00", message: "Hello", userName: "mustafa"),
    SampleChatMassage(time: "11:00:00", message: "Hello", userName: "ahmed"),
    SampleChatMassage(time: "12:00:00", message: "Hello", userName: "mahmoud"),
    SampleChatMassage(time: "1:00:00", message: "Hello", userName: "sallah"),
    SampleChatMassage(time: "2:00:00", message: "Hello", userName: "mohamed"),
    SampleChatMassage(time: "4:00:00", message: "Hello", userName: "saad"),
    SampleChatMassage(time: "5:00:00", message: "Hello", userName: "hmada"),
    SampleChatMassage(time: "7:00:00", message: "Hello", userName: "hossam"),
    SampleChatMassage(time: "9:00:00", message: "Hello", userName: "abdo"),
    SampleChatMassage(time: "2:00:00", message: "Hello", userName: "maha"),
    SampleChatMassage(time: "9:00:00", message: "Hello", userName: "marwaa"),
    SampleChatMassage(time: "12:00:00", message: "Hello", userName: "salma"),
    SampleChatMassage(time: "10:00:00", message: "Hello", userName: "mustafa"),
    SampleChatMassage(time: "11:00:00", message: "Hello", userName: "ahmed"),
    SampleChatMassage(time: "12:00:00", message: "Hello", userName: "mahmoud"),
    SampleChatMassage(time: "1:00:00", message: "Hello", userName: "sallah"),
    SampleChatMassage(time: "2:00:00", message: "Hello", userName: "mohamed"),
    SampleChatMassage(time: "4:00:00", message: "Hello", userName: "saad"),
    SampleChatMassage(time: "5:00:00", message: "Hello", userName: "hmada"),
    SampleChatMassage(time: "7:00:00", message: "Hello", userName: "hossam"),
    SampleChatMassage(time: "9:00:00", message: "Hello", userName: "abdo"),
    SampleChatMassage(time: "2:00:00", message: "Hello", userName: "maha"),
    SampleChatMassage(time: "9:00:00", message: "Hello", userName: "marwaa"),
    SampleChatMassage(time: "12:00:00", message: "Hello", userName: "salma"),
    SampleChatMassage(time: "10:00:00", message: "Hello", userName: "mustafa"),
    SampleChatMassage(time: "11:00:00", message: "Hello", userName: "ahmed"),
    SampleChatMassage(time: "12:00:00", message: "Hello", userName: "mahmoud"),
    SampleChatMassage(time: "1:00:00", message: "Hello", userName: "sallah"),
    SampleChatMassage(time: "2:00:00", message: "Hello", userName: "mohamed"),
    SampleChatMassage(time: "4:00:00", message: "Hello", userName: "saad"),
    SampleChatMassage(time: "5:00:00", message: "Hello", userName: "hmada"),
    SampleChatMassage(time: "7:00:00", message: "Hello", userName: "hossam"),
    SampleChatMassage(time: "9:00:00", message: "Hello", userName: "abdo"),
    SampleChatMassage(time: "2:00:00", message: "Hello", userName: "maha"),
    SampleChatMassage(time: "9:00:00", message: "Hello", userName: "marwaa"),
    SampleChatMassage(time: "12:00:00", message: "Hello", userName: "salma"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shadowColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    "https://thumbs.dreamstime.com/b/sun-flower-transparent-background-additional-png-file-greeting-cards-holiday-wishes-sun-flower-transparent-129371261.jpg")),
            SizedBox(
              width: 10,
            ),
            Text("Chat"),
            SizedBox(
              width: 5,
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            radius: 20,
            child: IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Get.to(logIn());
                },
                icon: Icon(Icons.logout_rounded)),
          ),
          SizedBox(
            width: 10,
          ),
          CircleAvatar(
            radius: 20,
            child: IconButton(
                onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),
          ),
          SizedBox(
            width: 10,
          ),
          CircleAvatar(
            radius: 20,
            child: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          top: 20,
          start: 20,
          end: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: EdgeInsetsDirectional.symmetric(
                        horizontal: 10, vertical: 10),
                    child: SingleChildScrollView(
                      child: Row(
                        children: [Icon(Icons.search), Text("Search")],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 80,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ActiveUser(userName: chatMessags[index].userName);
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: chatMessags.length,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ListView.separated(
                itemBuilder: (context, index) {
                  return MoreData(context1: context, chatMessags[index]);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 15);
                },
                itemCount: chatMessags.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget MoreData(SampleChatMassage chats, {required BuildContext context1}) {
  return Row(
    children: [
      CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(
              "https://thumbs.dreamstime.com/b/sun-flower-transparent-background-additional-png-file-greeting-cards-holiday-wishes-sun-flower-transparent-129371261.jpg"),
          child: Stack(children: [
            Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                    radius: 5,
                    backgroundColor: Colors.white,
                    child:
                        CircleAvatar(radius: 4, backgroundColor: Colors.green)))
          ])),
      SizedBox(
        width: 15,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
                child: Text(
                  "${chats.userName}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                onTap: () {}),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  chats.message,
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "${chats.time} ",
                  textAlign: TextAlign.right,
                ),
              ],
            )
          ],
        ),
      )
    ],
  );
}

Widget ActiveUser({String userName = "user activation"}) {
  return Container(
    width: 70,
    child: Column(children: [
      CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(
              "https://thumbs.dreamstime.com/b/sun-flower-transparent-background-additional-png-file-greeting-cards-holiday-wishes-sun-flower-transparent-129371261.jpg"),
          child: Stack(children: [
            Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                    radius: 5,
                    backgroundColor: Colors.white,
                    child:
                        CircleAvatar(radius: 4, backgroundColor: Colors.blue)))
          ])),
      SizedBox(
        height: 5,
      ),
      Text(
        " ${userName} ",
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    ]),
  );
}
