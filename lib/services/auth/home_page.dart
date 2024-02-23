import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:solution/pages/chat_list.dart';
import 'package:solution/pages/chat_page.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solution/components/categories.dart';
import 'package:solution/components/pop_section.dart';
import 'package:solution/services/auth/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:solution/pages/question.dart' as next;
import 'package:solution/components/profile.dart';
import 'package:solution/models/category_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solution/models/whats_new_model.dart';
import 'package:solution/models/popular_model.dart';
import 'package:solution/components/whats_new.dart';
import 'package:solution/components/dash_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;
  List<CategoryModel> list = [];
  late Future<List<WhatsNew>> info;
  List<PopularDietsModel> popularDiets = [];

  Color leadingButtonColor = const Color(0xffF7F8F8);
  int clickCount = 0;

  Future<void> _getInitialInfo() async {
    list = CategoryModel.getCategories();
    info = WhatsNew.getInfo();
    popularDiets = PopularDietsModel.getPopularDiets();
  }
    void signOut() {
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.signOut();
  }

    String? disName = FirebaseAuth.instance.currentUser?.displayName;

  @override
  Widget build(BuildContext context) {

     _getInitialInfo();
    
    return Scaffold(
      appBar: const CustomAppBar(),
      body: ListView(
        children: [
          Profile(displayName: disName ?? ""),
          const SizedBox(height: 30),
          Categories(list: list),
          const SizedBox(height: 30),
          WhatIsNew(infoFuture: info),
          const SizedBox(height: 30),
          PopSection(popularDiets: popularDiets)
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: SvgPicture.asset('assets/icons/button.svg'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const next.QPage()
                )
              );
          }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
            if(index == 2){
                Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChatList()
                )
              );
            }
        },
         items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Center'),
        BottomNavigationBarItem(
             icon: Icon(Icons.message),
            label: 'Right'),
      ]),
      drawer: Drawer(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          child: const Text(
            'Drawer',
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
