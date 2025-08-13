import 'package:alexo_app/common/widgets/common_text_field.dart';
import 'package:alexo_app/constants/app_colors.dart';
import 'package:alexo_app/view/screens/location_permission_screen/location_permission_screen.dart';
import 'package:alexo_app/view/screens/sign_up_screen/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  Future<void> loginUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );


      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LocationScreen(),
        ),
      );

    } on FirebaseAuthException catch (e) {
      final msg = switch (e.code) {
        'wrong-password' => 'Incorrect password.',
        'invalid-credential' => 'Incorrect email or password.',
        'user-not-found' => 'No user found with this email.',
        'invalid-email' => 'Invalid email.',
        _ => 'Login failed. Please try again.',
      };
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.05),
                Center(
                  child: Image.asset(
                    'assets/logos/alexo_logo.png',
                    height: 50,
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  "Login",
                  style: TextStyle(fontSize: 33, fontWeight: FontWeight.w500),
                ),
                const Text(
                  "Enter your Credentials to access your account",
                  style: TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 40),
                const Text("Email address", style: TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                CommonTextField(
                  hint: "Enter your email",
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text("Password", style: TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                CommonTextField(
                  hint: "Enter your password",
                  controller: passwordController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: AppColors().primary, fontSize: 13),
                  ),
                ),
                SizedBox(height: size.height * 0.06),
                ElevatedButton(
                  onPressed: isLoading ? null : loginUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors().primary,
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Get Started", style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 15),
                Row(
                  children: const [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text("OR", style: TextStyle(color: Colors.grey)),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 15),
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                  icon: SvgPicture.asset('assets/svg_icons/google_icon.svg', height: 20),
                  label: const Text("Sign in with Google", style: TextStyle(color: Colors.black)),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    minimumSize: const Size(double.infinity, 48),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'If you continue, you are accepting Alexo ',
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                          TextSpan(
                            text: 'Terms and Conditions ',
                            style: TextStyle(fontSize: 12, color: AppColors().primary),
                          ),
                          TextSpan(
                            text: 'And ',
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(fontSize: 12, color: AppColors().primary, height: 1.8),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
