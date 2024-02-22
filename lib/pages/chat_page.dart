import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:solution/components/my_text_field.dart';
import 'package:solution/services/chat/chat_service.dart';


class ChatPage extends StatefulWidget {
  final String  receiverUserEmail;
  final String receiverUserId;
  
  const ChatPage({super.key,required this.receiverUserEmail, required this.receiverUserId});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  void sendMessage() async{
    if(_messageController.text.isNotEmpty){
      await _chatService.sendMessage(widget.receiverUserId, _messageController.text);
      _messageController.clear();
    }
  } 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.receiverUserEmail),),
      body: Column(children: [Expanded(child: _buildMessageList()),_buildMessageInput()],),
    );
  }

  // build message list
    Widget _buildMessageList() {
      return StreamBuilder(stream: _chatService.getMessages(_firebaseAuth.currentUser!.uid,widget.receiverUserId), 
      builder: (context,snapshot){
        if(snapshot.hasError){
          return Text('Error ' + snapshot.error.toString());
        }

        if(snapshot.connectionState == ConnectionState.waiting){
          return const Text('Loading...');
        }

        return  ListView(
          children: snapshot.data!.docs.map((document) => _buildMessageItem(document)).toList(),
        );
      });
    }

  // build message item

  Widget _buildMessageItem(DocumentSnapshot document) {
      Map <String,dynamic> data=document.data() as Map<String,dynamic>;
      var alignment = (data['senderId']==_firebaseAuth.currentUser!.uid)?Alignment.centerRight:Alignment.centerLeft;

      return Container(
        alignment: alignment,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: data['senderId']==_firebaseAuth.currentUser!.uid? CrossAxisAlignment.end: CrossAxisAlignment.start ,
            children: [
              Text(data['senderEmail']),
              Text(data['senderEmail']),
            ],
          ),
        ),
      );
  }
  // build message input

  Widget _buildMessageInput(){
    return Row(children: [
      // textField
      Expanded(child: MyTextField(controller: _messageController, hintText: 'Enter Message', obscuretext: false)),
      IconButton(onPressed: sendMessage, icon: const Icon(Icons.arrow_upward,size: 40,),),
      // send button
    ],);
  }
}