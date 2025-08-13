import 'package:alexo_app/constants/app_colors.dart';
import 'package:alexo_app/view/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {


      "image": "assets/images/onboarding/onboarding_img1.png",
      "title": "Experience the perfect blend quality and affordability",
      "subtitle":
      "One-stop destination for all your required products in your budget",
      "buttonText": "Next"
    },
    {
      "image": "assets/images/onboarding/onboarding_img2.png",
      "title": "Sell your New or Used Products for instant cash",
      "subtitle":
      "One-stop destination for all old products selling and buying at one place in your budget",
      "buttonText": "Next"
    },
    {
      "image": "assets/images/onboarding/onboarding_img3.png",
      "title": "Work with us anytime online anytime and anywhere",
      "subtitle":
      "One-stop destination for all products at your time place and your budget",
      "buttonText": "Get Started"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: onboardingData.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.15,),
                Image.asset(
                  onboardingData[index]["image"]!,
                  height: 250,
                ),
                const SizedBox(height: 40),
                Text(
                  onboardingData[index]["title"]!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  onboardingData[index]["subtitle"]!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onboardingData.length,
                        (dotIndex) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 8,
                      width: _currentIndex == dotIndex ? 8 : 8,
                      decoration: BoxDecoration(
                        color: _currentIndex == dotIndex
                            ? AppColors().primary
                            : AppColors().grey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),

                 SizedBox(height: size.height * 0.1,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors().primary,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      if (_currentIndex < onboardingData.length - 1) {
                        _controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease);
                      } else {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      }
                    },
                    child: Text(onboardingData[_currentIndex]["buttonText"]!,style: TextStyle(color: Colors.white),),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    _controller.animateToPage(
                      onboardingData.length - 1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 20),

              ],
            ),
          );
        },
      ),
    );
  }
}
