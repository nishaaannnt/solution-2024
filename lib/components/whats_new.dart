import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:solution/models/whats_new_model.dart';

class WhatIsNew extends StatelessWidget {
  final Future<List<WhatsNew>> infoFuture;

  const WhatIsNew({Key? key, required this.infoFuture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<WhatsNew>>(
      future: infoFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text("No data available"),
          );
        } else {
          List<WhatsNew> info = snapshot.data!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
                child: Text(
                  "What's New",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 280,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 200,
                      child: Card(
                        elevation: 4,
                        surfaceTintColor: Colors.white,                
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  info[index].iconPath ?? "placeholder_image_path",
                                  height: 120,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                info[index].content ?? "No content available",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () => _launchUrl(url: info[index].url ?? ""),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple.shade200,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
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
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(width: 20),
                  itemCount: info.length,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
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
