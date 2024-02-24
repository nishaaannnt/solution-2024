import 'package:flutter/material.dart';
import 'package:solution/models/job_model.dart';

class JobCard extends StatelessWidget {
  final List<JobModel> jobs;

  const JobCard({super.key, required this.jobs});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 1,
      child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              height: 164.0,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Image
                  Container(
                    width: 144.0,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(6)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          jobs[index].imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  // Title, Description, and Button
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            jobs[index].title,
                            style:const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            jobs[index].description,
                            style: const TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                        // Apply Now Button
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                            onPressed:() {},
                            child: const Text('Apply Now'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 25),
          itemCount: jobs.length,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          ),
    );
  }
}
