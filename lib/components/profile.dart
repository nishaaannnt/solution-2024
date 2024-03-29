// File: profile.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profile extends StatefulWidget {
  final String displayName;

  const Profile({Key? key, required this.displayName}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late String name;

  @override
  void initState() {
    super.initState();
    name = widget.displayName;
  }

  @override
  void didUpdateWidget(Profile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.displayName != widget.displayName) {
      _updateDisplayName();
    }
  }

  _updateDisplayName() {
    setState(() {
      name = widget.displayName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.purple.shade100,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
      ),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            child: SvgPicture.asset(
              'assets/icons/boy.svg',
              height: 85,
              width: 85,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Hello, Om',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
