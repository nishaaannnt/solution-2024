import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solution/models/expert_model.dart';

class ContactCard extends StatelessWidget {
  final List<ExpertModel> contact;

  const ContactCard({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 1.1,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            height: 164.0,
            padding: const EdgeInsets.fromLTRB(5, 10, 10, 5),
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
                  padding: const EdgeInsets.all(15),
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
                      child: SvgPicture.asset(
                        contact[index].imagePath,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
                // Title, Description, and Button
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: ,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          contact[index].title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          contact[index].description,
                          style: const TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                            
                            onPressed: () {},
                            child: const Row(
                              children: [
                                Icon(Icons.phone),
                                SizedBox(width: 10,),
                                Text("Contact"),
                              ],
                            ),
                          ),
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
        itemCount: contact.length,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 20),
      ),
    );
  }
}
