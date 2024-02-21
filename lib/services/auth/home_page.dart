import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solution/components/categories.dart';
import 'package:solution/components/pop_section.dart';
import 'package:solution/services/auth/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:solution/pages/question.dart' as next;
import 'package:solution/components/profile.dart';
import 'package:solution/models/category_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solution/models/diet_model.dart';
import 'package:solution/models/popular_model.dart';
import 'package:solution/components/diet_section.dart';
import 'package:solution/components/dash_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;
  List<CategoryModel> list = [];
  List<DietModel> diets = [];
  List<PopularDietsModel> popularDiets = [];

  Color leadingButtonColor = const Color(0xffF7F8F8);
  int clickCount = 0;

  void _getInitialInfo() {
    list = CategoryModel.getCategories();
    diets = DietModel.getDiets();
    popularDiets = PopularDietsModel.getPopularDiets();
  }
    void signOut() {
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {

     _getInitialInfo();
    
    return Scaffold(
      appBar: const CustomAppBar(),
      body: ListView(
        children: [
          Profile(),
          const SizedBox(height: 30),
          Categories(list: list),
          const SizedBox(height: 30),
          DietSection(diets: diets),
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
                builder: (context) => const next.QPage()
                )
              );
            }
        },
        items: [
        BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/Arrow - Left 2.svg'),
            label: 'Left'),
        BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/Arrow - Left 2.svg'),
            label: 'Center'),
        BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/Arrow - Left 2.svg'),
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
