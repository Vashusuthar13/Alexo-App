import 'package:alexo_app/common/widgets/common_text_field.dart';
import 'package:alexo_app/constants/app_colors.dart';
import 'package:alexo_app/view/screens/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
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
                "Signup",
                style: TextStyle(fontSize: 33, fontWeight: FontWeight.w500),
              ),
              const Text(
                "Enter your Credentials to access your account",
                style: TextStyle(color: Colors.grey,fontSize: 13, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 40),
              const Text(
                "Email address",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 10),
              CommonTextField(hint: "Enter your email", controller: emailController),
              const SizedBox(height: 20),
              const Text(
                "Password",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 10),
              CommonTextField(
                  hint: "Enter your password",
                  controller: passwordController,
                  obscureText: true),
              const SizedBox(height: 20),
              const Text(
                "Confirm Password",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 10),
              CommonTextField(
                  hint: "Enter your password",
                  controller: passwordController,
                  obscureText: true),
              const SizedBox(height: 10),
              SizedBox(height: size.height * 0.06),
              ElevatedButton(
                onPressed: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) => AppBottomBar()));

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors().primary,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("Get Started",style: TextStyle(color: Colors.white),),
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
                onPressed: () {},
                icon: SvgPicture.asset('assets/svg_icons/google_icon.svg', height: 20),
                label: const Text("Sign in with Google"),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                  ),
                  minimumSize: const Size(double.infinity, 48),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: const Text(
                  "If you continue, you are accepting Alexo Terms and Conditions and Privacy Policy",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
