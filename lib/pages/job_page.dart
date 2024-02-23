import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solution/components/search_box.dart';
import 'package:solution/components/job_card.dart';
import 'package:solution/models/job_model.dart';

class JobPage extends StatefulWidget {
  const JobPage({super.key});

  @override
  State<JobPage> createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  List<JobModel> jobs = [];

  @override
  void initState() {
    super.initState();
    _getInfo();
  }

  void _getInfo() {
    jobs = JobModel.getJobs();
  }

  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Find a Job',
                    style: GoogleFonts.getFont(
                      'Poppins',
                      textStyle: const TextStyle(
                          fontSize: 32, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 80,
                    child: SearchBox(
                        controller: searchController,
                        hintText: 'Seach for Jobs',
                        obscuretext: false),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(child: JobCard(jobs: jobs))
                ],
              ),
            ),
          ),
        );
  }
}
