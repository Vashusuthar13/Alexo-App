import 'package:alexo_app/view/screens/dashboard_screen/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



class AppBottomBar extends StatefulWidget {
  const AppBottomBar({super.key});

  @override
  State<AppBottomBar> createState() => _AppBottomBar();
}

class _AppBottomBar extends State<AppBottomBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    DashboardScreen(),
    Center(child: Text("Chat Screen")),
    Center(child: Text("Wallet Screen")),
    Center(child: Text("User Profile")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 70,
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        decoration: BoxDecoration(
            borderRadius:  BorderRadius.circular(50
            ),
            border: Border.all(color: Colors.black)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _icons("assets/svg_icons/home.svg", 0),
            _icons("assets/svg_icons/chat.svg", 1),

            GestureDetector(
              onTap: () {
              },
              child: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.blue,
                child: Icon(Icons.add, color: Colors.white, size: 28),
              ),
            ),

            _icons("assets/svg_icons/wallet.svg", 2),
            _icons("assets/svg_icons/user.svg", 3),
          ],
        ),
      ),
    );
  }

  Widget _icons(String iconPath, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            color: _selectedIndex == index ? Colors.blue : Colors.black,
            width: 30,
            height: 30,
          ),
          const SizedBox(height: 4),
          Container(
            height: 2,
            width: 20,
            color: _selectedIndex == index ? Colors.blue : Colors.transparent,
          )
        ],
      ),
    );
  }
}
