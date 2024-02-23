import 'package:flutter/material.dart';
import 'package:solution/models/whats_new_model.dart';

class ArticlesSection extends StatelessWidget {
  final Future<List<WhatsNew>> infoFuture;

  const ArticlesSection({Key? key, required this.infoFuture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<WhatsNew>>(
      future: infoFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text("No data available");
        } else {
          List<WhatsNew> info = snapshot.data!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: const Text(
                    'Articles',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(1),
                    margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                    height: 115,
                    width: 110,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          offset: Offset(0, 10),
                          blurRadius: 40,
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                         ClipRRect(
                          borderRadius: BorderRadius.circular(20.0), // Adjust border radius here
                          child: Image.network(
                            info[index].iconPath ?? "placeholder_image_path",
                            width: 70,
                            height: 70,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              info[index].content ?? "No content available",
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 25),
                itemCount: info.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 20, right: 20),
              ),
            ],
          );
        }
      },
    );
  }
}

