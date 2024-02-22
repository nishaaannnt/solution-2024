import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:solution/pages/chat_page.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solution/services/auth/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:solution/pages/question.dart' as next;
// ignore_for_file: prefer_const_constructors
import 'package:solution/models/category_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solution/models/diet_model.dart';
import 'package:solution/models/popular_model.dart';


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

    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {

     _getInitialInfo();
    
    return Scaffold(
      appBar: appBar(),
      body: ListView(
        children: [
          profile(),
          const SizedBox(height: 40),
          categories(),
          const SizedBox(height: 40),
          _dietSection(),
          const SizedBox(height: 40),
          _popSection()
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: SvgPicture.asset('assets/icons/button.svg'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => next.QPage()
                )
              );
          }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {

            if(index == 0)
            {
               
            }
            else if(index == 1)
            {
                
            }
            else{
                Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => next.QPage()
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
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          child: Text(
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
  
  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Dashboard',
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.purple.shade100,
      elevation: 0,
      centerTitle: true,
      // Leading - Left
      actions: [
        // actions - Right
       IconButton(onPressed: signOut, icon: const Icon(Icons.logout)),
      ],
    );
  }

  Container profile() {
    return Container(
      color: Colors.purple.shade100,
      
      height: 100,
    );
  }

  Column categories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Category',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
            padding: EdgeInsets.only(right: 10, left: 10),
            height: 150,
            child: ListView.builder(
                itemCount: list.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                      width: 115,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: list[index].boxColor.withOpacity(0.75),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            // circle
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(list[index].iconPath),
                            ),
                          ),
                          Text(
                            list[index].name,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ));
                }))
      ],
    );
  }

  Column _dietSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Recommendation\nfor Diet',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 225,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                width: 210,
                decoration: BoxDecoration(
                    color: diets[index].boxColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(diets[index].iconPath),
                    Column(
                      children: [
                        Text(
                          diets[index].name,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 16),
                        ),
                        Text(
                          '${diets[index].level} | ${diets[index].duration} | ${diets[index].calorie}',
                          style: const TextStyle(
                              color: Color(0xff7B6F72),
                              fontSize: 13,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Container(
                      height: 45,
                      width: 130,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            diets[index].viewIsSelected
                                ? const Color(0xff9DCEFF)
                                : Colors.transparent,
                            diets[index].viewIsSelected
                                ? const Color(0xff92A3FD)
                                : Colors.transparent
                          ]),
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: Text(
                          'View',
                          style: TextStyle(
                              color: diets[index].viewIsSelected
                                  ? Colors.white
                                  : const Color(0xffC58BF2),
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 25),
            itemCount: diets.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
          ),
        )
      ],
    );
  }

  Column _popSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              'Popular',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(1),
              margin: EdgeInsets.only(left: 5, right: 5, bottom: 5),
              height: 115,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        offset: Offset(0, 10),
                        blurRadius: 40,
                        spreadRadius: 0)
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    popularDiets[index].iconPath,
                    width: 65,
                    height: 65,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        popularDiets[index].name,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      Text(
                        '${popularDiets[index].level}|${popularDiets[index].calorie}',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      )
                    ],
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 25),
          itemCount: popularDiets.length,
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 20, right: 20),
        ),
      ],
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
