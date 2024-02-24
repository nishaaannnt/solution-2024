import 'package:flutter/material.dart';
import 'package:solution/models/whats_new_model.dart';

class ArticlesSection extends StatelessWidget {
  final Future<List<WhatsNew>> infoFuture;

  const ArticlesSection({Key? key, required this.infoFuture}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  var placeHolderImage="assets/icons/news4.png";
    return FutureBuilder<List<WhatsNew>>(
      future: infoFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Text("No data available"),
          );
        } else {
          List<WhatsNew> info = snapshot.data!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Articles',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 20), // Adjust spacing between title and articles
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: info.map((article) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Adjust margins according to your preference
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: Offset(0, 2),
                          blurRadius: 40,
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          child: article.iconPath == null ? Image.asset(placeHolderImage, fit: BoxFit.cover,
                            width: double.infinity,
                            height: 150,) : Image.network(
                            article.iconPath ?? "",
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 150, // Adjust height according to your preference
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(19.0),
                          child: Text(
                            article.content ?? "No content available",
                            style: const  TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          );
        }
      },
    );
  }
}
