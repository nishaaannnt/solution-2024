import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:solution/pages/chat_page.dart';
import 'package:solution/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void signOut() {
    final authService = Provider.of<AuthService>(context, listen: false);

    authService.signOut();
  }

    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(onPressed: signOut, icon: const Icon(Icons.logout))
        ],
      ),
      body: _buildUserList(),
    );
  }

  // build a list of users except for current user

  Widget _buildUserList(){
    return StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection('users').snapshots(),
    builder: (context,snapshot){
      if(snapshot.hasError){
        return const Text('error');
      }

      if(snapshot.connectionState==ConnectionState.waiting){
        return const Text('loading...');
      }

      return ListView(
        children: snapshot.data!.docs.map<Widget>((doc) => _buildUserListItem(doc)).toList()
      );  
    });
  }

  Widget _buildUserListItem(DocumentSnapshot document){
    Map<String,dynamic> data=document.data()! as Map<String,dynamic>;

    if(_firebaseAuth.currentUser!.email !=data['email']){
        return  ListTile(
          title: Text(data['email']),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatPage(receiverUserEmail:data['email'],receiverUserId:data['uid']),));
          },
        );
    }else{
      return const Text('');
    }
  }
}
