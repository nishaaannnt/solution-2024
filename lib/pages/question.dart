import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solution/models/qwidget.dart';
import 'package:solution/pages/test_answers.dart' as next;

class QPage extends StatefulWidget {
  const QPage({super.key});

  @override
  State<QPage> createState() => _QPageState();
}

class _QPageState extends State<QPage> {
  Color leadingButtonColor = Colors.purple.shade200;
  List<QWidget> questions = [];
  List<int> answers = List<int>.filled(10, -1);

  List<Color> yesColor = List<Color>.filled(10, Colors.purple.shade300);
  List<Color> noColor = List<Color>.filled(10, Colors.grey.shade400);

  void getProps() {
    questions = QWidget.getAll();
  }

  bool isYes = true;
  bool isNo = false;

  @override
  Widget build(BuildContext context) {
    getProps();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            margin: const EdgeInsets.all(0),
            padding: const EdgeInsets.all(0),
            child: ListView.builder(
              physics:
                  const NeverScrollableScrollPhysics(), // Disable scrolling for the inner ListView
              shrinkWrap:
                  true, // Allow the inner ListView to take only the necessary space
              itemCount: questions.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(20),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade50.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            questions[index].question,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      answers[index] = 1;

                                      questions[index].isNo = false;
                                      questions[index].isYes = true;
                                    });
                                    if (answers[index] == 1) {
                                      setState(() {
                                        yesColor[index] = Colors.green.shade400;
                                        noColor[index] = Colors.grey.shade400;
                                        questions[index].isYes = true;
                                      });
                                    } else {
                                      setState(() {
                                        yesColor[index] =
                                            Colors.purple.shade300;
                                        noColor[index] = Colors.grey.shade400;
                                      });
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: yesColor[index],
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(11)),
                                      padding: const EdgeInsets.only(
                                          left: 40,
                                          right: 40,
                                          top: 15,
                                          bottom: 15)),
                                  child: Wrap(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    alignment: WrapAlignment.spaceAround,
                                    children: [
                                      Row(
                                        children: [
                                          const Text(
                                            'Yes',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          answers[index] == 1  ? const Icon(Icons.check) : const Text("") 
                                        ],
                                      )
                                    ],
                                  )),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    answers[index] = 0;

                                    questions[index].isNo = true;
                                    questions[index].isYes = false;
                                  });
                                  if (answers[index] == 1) {
                                    setState(() {
                                      yesColor[index] = Colors.purple.shade300;
                                      noColor[index] = Colors.grey.shade400;
                                    });
                                  } else {
                                    setState(() {
                                      yesColor[index] = Colors.purple.shade300;
                                      noColor[index] = Colors.green.shade400;
                                    });
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: noColor[index],
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(11)),
                                    padding: const EdgeInsets.only(
                                        left: 40,
                                        right: 40,
                                        top: 15,
                                        bottom: 15)),
                                child: Row(
                                        children: [
                                          const Text(
                                            'No',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          answers[index] == 0  ? const Icon(Icons.check) : const Text("") 
                                        ],
                                      )
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/Arrow - Left 2.svg'),
            label: 'Previous'),
        BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/Arrow - Left 2.svg'),
            label: 'Next'),
      ]),
      floatingActionButton: FloatingActionButton(
          child: SvgPicture.asset('assets/icons/button.svg'),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => next.Page(answers: answers)));
          }),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Questions',
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.purple.shade200,
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
