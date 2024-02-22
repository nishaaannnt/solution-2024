import 'package:flutter/material.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {

  final int targetVal = 68;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Text(
                  targetVal.toString()+'%',
                  style: const TextStyle(
                    fontSize: 90,
                    fontWeight: FontWeight.bold
                  ),
          ),
          ),
        ],
      ),

      
    );
  }
}