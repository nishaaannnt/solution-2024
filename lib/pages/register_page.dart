import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solution/components/my_button.dart';
import 'package:solution/components/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text controllers

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // sign up user

  void signUp() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffbe4ff),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                Image.asset('assets/icons/autismlogo.png'),
                const SizedBox(height: 20),
                // welcome back message
                Text(
                  'Sign Up with Us!',
                  style: GoogleFonts.getFont(
                    'Poppins',
                    textStyle: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.w600),
                  ),
                ),

                const SizedBox(height: 20),
                // email field
                MyTextField(
                    controller: emailController,
                    hintText: 'Enter your Email',
                    obscuretext: false),
                // password field
                const SizedBox(height: 10),
                MyTextField(
                    controller: passwordController,
                    hintText: 'Enter your Password',
                    obscuretext: true),
                // submit button
                const SizedBox(height: 10),
                MyTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm your Password',
                    obscuretext: true),
                const SizedBox(height: 20),
                Mybutton(onTap: signUp, text: 'Sign Up'),
                const SizedBox(height: 20),

                // New Account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already a member?',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.5,
                        ),
                      ),
                    ),
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
