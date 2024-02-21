import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solution/components/my_button.dart';
import 'package:solution/components/my_text_field.dart';
import 'package:solution/services/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key,required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  // text controllers

  final emailController =TextEditingController();
  final passwordController =TextEditingController();
  final confirmPasswordController =TextEditingController();

  // sign up user

  void signUp()async {
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signUpUserWithEmailandPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

   @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                const Icon(
                  Icons.child_care,
                  size: 80,
                ),

                const SizedBox(height:20),
                // welcome back message
                const Text(
                  'Sign Up with us!',
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),

                const SizedBox(height:20),
                // email field
                MyTextField(controller: emailController, hintText: 'Enter your Email', obscuretext: false),
                // password field
                const SizedBox(height:10),
                MyTextField(controller: passwordController, hintText: 'Enter your Password', obscuretext: true),
                // submit button
                const SizedBox(height:10),
                MyTextField(controller: confirmPasswordController, hintText: 'Confirm your Password', obscuretext: true),
                const SizedBox(height:20),
                Mybutton(onTap: signUp, text: 'Sign Up'),
                const SizedBox(height:20),

                // New Account
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already a member?'),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: 
                  const Text('Sign in',
                  style: TextStyle(
                    fontWeight:FontWeight.bold,
                  ),),),
                ],
               ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}