// custom_app_bar.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solution/services/auth/auth_service.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void signOut(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Dashboard',
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.purple.shade100,
      elevation: 0,
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () => signOut(context),
          icon: const Icon(Icons.logout),
        ),
      ],
    );
  }
}
