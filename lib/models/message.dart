import 'package:cloud_firestore/cloud_firestore.dart';

class Message{
  final String senderId;
  final String senderEmail;
  final String receiverId;
  final String message;
  final Timestamp timestamp;

  Message({
    required this.senderEmail,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.timestamp,
  });


  Map<String,dynamic> toMap(){
    return{
      'senderEmail':senderEmail,
      'senderId':senderId,
      'receiverId':receiverId,
      'message':message,
      'timestamp':timestamp,
    };
  }
}