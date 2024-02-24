import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:solution/pages/chat_page.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  Color leadingButtonColor = const Color(0xffF7F8F8);
  // instance of Auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Error');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Display a loading indicator
        }

        return ListView(
          children: snapshot.data!.docs
              .map<Widget>((docs) => _buildUserListItem(docs))
              .toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    // Ensure current user's email is not included in the list
    if (_auth.currentUser!.email != data['email']) {
      var intValue = Random().nextInt(10);
      return ListTile(
        title: Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.all(10.0),
          child:Row(children: [
            SvgPicture.asset(
              intValue > 5 ? 'assets/icons/boy.svg' : 'assets/icons/girl.svg' ,
              height: 20,
              width: 20,
            ),
            const SizedBox(width: 10),
            Text(
              data['displayName'],
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ]),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverUserName: data['displayName'],
                receiverUserId: data['uid'],
              ),
            ),
          );
        },
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Recent Messages',
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.purple.shade100,
      elevation: 0,
      centerTitle: true,
      // Leading - Left
      actions: [
        // actions - Right
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            decoration: BoxDecoration(
                color: leadingButtonColor,
                borderRadius: BorderRadius.circular(10)),
            child: SvgPicture.asset(
              'assets/icons/dots.svg',
              height: 5,
              width: 5,
            ),
          ),
        ),
      ],
    );
  }
}
