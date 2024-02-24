import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solution/components/contact_card.dart';
import 'package:solution/components/search_box.dart';
import 'package:solution/models/expert_model.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  List<ExpertModel> contacts = [];

  @override
  void initState() {
    super.initState();
    _getInfo();
  }

  void _getInfo() {
    contacts = ExpertModel.getcontact();
  }

  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Connect an Expert',
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
                        hintText: 'Seach for contacts',
                        obscuretext: false),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(child: ContactCard(contact: contacts)),
                  const SizedBox(height: 20)
                ],
              ),
            ),
          ),
        ),
      );
  }
}
