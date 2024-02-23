// File: home_page.dart

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:solution/pages/chat_list.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solution/components/categories.dart';
import 'package:solution/components/articles_section.dart';
import 'package:solution/services/auth/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:solution/pages/question.dart' as next;
import 'package:solution/components/profile.dart';
import 'package:solution/models/category_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solution/models/whats_new_model.dart';
import 'package:solution/components/whats_new.dart';
import 'package:solution/components/dash_app_bar.dart';
import 'package:solution/pages/job_page.dart' as job;

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<CategoryModel> list = [];
  late Future<List<WhatsNew>> info;
  List<WhatsNew> popularDiets = [];

  @override
  void initState() {
    super.initState();
    _getInitialInfo();
  }

  Future<void> _getInitialInfo() async {
    list = CategoryModel.getCategories();
    info = WhatsNew.getInfo();

    await Future.delayed(Duration(seconds: 1)); // Simulating delay for demo purposes

    setState(() {
      popularDiets = []; // Provide a default value if needed
    });
  }

  void signOut() {
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: FutureBuilder(
        future: info,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView(
              children: [
                Profile(displayName: FirebaseAuth.instance.currentUser?.displayName ?? ""),
                const SizedBox(height: 30),
                Categories(list: list),
                const SizedBox(height: 30),
                WhatIsNew(infoFuture: info),
                const SizedBox(height: 30),
                ArticlesSection(infoFuture: info)
              ],
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: SvgPicture.asset('assets/icons/button.svg'),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const next.QPage()));
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const job.JobPage(),
              ),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChatList(),
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
        ],
      ),
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
