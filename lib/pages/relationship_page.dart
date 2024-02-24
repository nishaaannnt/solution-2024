import 'package:flutter/material.dart';
import 'package:solution/pages/register_page.dart';

class RoleSelectionPage extends StatefulWidget {
  final void Function() onTap;

  const RoleSelectionPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<RoleSelectionPage> createState() => _RoleSelectionPageState();
}

class _RoleSelectionPageState extends State<RoleSelectionPage> {

  void togglePages(void Function() onTapFunction) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterPage(onTap: onTapFunction),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Your Role'),
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed:widget.onTap),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding:  EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'How will you describe your relationship with the champ?',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'Please select the role that best describes your relationship with the individual:',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                children: [
                  RoleCard(
                    role: 'NGO',
                    onTap: () => togglePages(widget.onTap),
                  ),
                  RoleCard(
                    role: 'Therapist',
                    onTap: () => togglePages(widget.onTap),
                  ),
                  RoleCard(
                    role: 'Guardian',
                    onTap: () => togglePages(widget.onTap),
                  ),
                  RoleCard(
                    role: 'Special School',
                    onTap: () => togglePages(widget.onTap),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class RoleCard extends StatelessWidget {
  final String role;
  final VoidCallback onTap;

  const RoleCard({Key? key, required this.role, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.purple.shade200,
                Colors.purple.shade400,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.person,
                  size: 36.0,
                  color: Colors.white,
                ),
                const SizedBox(height: 10.0),
                Text(
                  role,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18.0, color: Colors.white),
                  
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
