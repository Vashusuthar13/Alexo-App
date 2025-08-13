import 'package:alexo_app/constants/app_colors.dart';
import 'package:alexo_app/view/screens/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:alexo_app/view/screens/dashboard_screen/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});


  Future<void> _getCurrentLocation(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;


    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enable location services.')),
      );


      await Geolocator.openLocationSettings();


      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return;
      }
    }


    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location permissions are denied.')),
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Location permissions are permanently denied. Please enable them in settings.',
          ),
        ),
      );


      await Geolocator.openAppSettings();
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Lat: ${position.latitude}, Lng: ${position.longitude}')),
    );

    // ✅ Navigate to next page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DashboardScreen(),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.1,),
              Image.asset("assets/images/login/location_img.png",height: 200,),
              SizedBox(height: size.height * 0.1,),
              const Text(
                "Where is your Location?",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),
              const Text(
                "Enjoy a personalized selling and Buying experience by Telling us your Location",
                style: TextStyle(color: Colors.grey,fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: ()  => _getCurrentLocation(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors().primary,
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: const Text("Find my location",style: TextStyle(color: Colors.white),),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Other Location",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, decoration: TextDecoration.underline,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
