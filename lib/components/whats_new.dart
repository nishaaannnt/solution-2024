// what's new
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:solution/models/whats_new_model.dart';

class WhatIsNew extends StatelessWidget {
  final Future<List<WhatsNew>> infoFuture;

  const WhatIsNew({super.key, required this.infoFuture});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<WhatsNew>>(
      future: infoFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // or any other loading indicator
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text("No data available");
        } else {
          List<WhatsNew> info = snapshot.data!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "What's New",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 350,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 4,
                      surfaceTintColor: Colors.white,
                      child: Container(
                        width: 210,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.network(
                                info[index].iconPath ?? "placeholder_image_path",
                                height: 150,
                                width: 150,
                            ),
                            Column(
                              children: [
                                Text(
                                    info[index].content ?? "No content available",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Container(
                              height: 45,
                              width: 130,
                              decoration: BoxDecoration(
                                color: Colors.purple.shade200,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: ElevatedButton(
                                onPressed: () => _launchUrl(url: info[index].url ?? ""),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.purple.shade200,
                                ),
                                child: const Text(
                                  'View',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 25),
                  itemCount: info.length,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                ),
              ),
            ],
          );
        }
      },
    );
  }

  _launchUrl({required String url}) async {
    final Uri link = Uri.parse(url);
    if (!await launchUrl(link)) {
      throw Exception('Could not launch');
    }
  }
}
