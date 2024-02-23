import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solution/services/chat/chat_service.dart';

class ChatPage extends StatefulWidget {
  final String receiverUserName;
  final String receiverUserId;

  const ChatPage(
      {super.key,
      required this.receiverUserName,
      required this.receiverUserId});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
          widget.receiverUserId, _messageController.text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(widget.receiverUserName),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: Column(
          children: [
            Expanded(child: _buildMessageList()),
            _buildMessageInput()
          ],
        ),
      ),
    );
  }

  // build message list
  Widget _buildMessageList() {
    return StreamBuilder(
        stream: _chatService.getMessages(
            _firebaseAuth.currentUser!.uid, widget.receiverUserId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error ' + snapshot.error.toString());
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading...');
          }

          return ListView(
            children: snapshot.data!.docs
                .map((document) => _buildMessageItem(document))
                .toList(),
          );
        });
  }

  // build message item

  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    bool isCurrentUser = (data['senderId'] == _firebaseAuth.currentUser!.uid);
    Color backgroundColor = isCurrentUser ? Colors.blue : Colors.grey.shade300;
    Color textColor = isCurrentUser ? Colors.white : Colors.black;
    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment:
              isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(8.0)),
              padding: const EdgeInsets.all(10.0),
              child: Text(
                data['message'],
                style: TextStyle(color: textColor),
              ),
            )
          ],
        ),
      ),
    );
  }
  // build message input

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextField(
                  controller: _messageController,
                  decoration: const InputDecoration(
                    hintText: 'Enter Message',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          Material(
            color: Colors.transparent,
            child: IconButton(
              onPressed: sendMessage,
              icon: const Icon(
                Icons.send,
                size: 30,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar appBar(String userName) {
    return AppBar(
      backgroundColor: Colors.purple.shade100,
      title: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [SvgPicture.asset(
              'assets/icons/boy.svg',
              height: 20,
              width: 20,
            ), const SizedBox(width: 10.0),Text(userName,style: const TextStyle(fontSize: 18),)],
        ),
      elevation: 0,
      centerTitle: true,
    );
  }
}
