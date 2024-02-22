import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:solution/models/message.dart';

class ChatService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // SEND MESSAGE
  Future<void> sendMessage(String receiverId, String message) async {
    // get current user Info
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();
    // create a new message

    Message newMessage = Message(
        senderEmail: currentUserEmail,
        senderId: currentUserId,
        receiverId: receiverId,
        message: message,
        timestamp: timestamp);

    // construct chat room id from current user id and receiver id (sorted to ensure uniqueness)
    List<String> ids = [currentUserId, receiverId];
    ids.sort();

    String chatRoomId = ids.join("_");
    // add new message to database

    await _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  // GET MESSAGE

   Stream<QuerySnapshot> getMessages(String userId, String receiverId) {
      // construct chat room id from user and receiver
      List<String> ids=[userId,receiverId];
      ids.sort();

      String chatRoomId = ids.join("_");

      return _firestore.collection('chat_rooms').doc(chatRoomId).collection('messages').orderBy('timestamp').orderBy('timestamp',descending: false).snapshots();

   }
}
