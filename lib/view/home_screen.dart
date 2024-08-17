import 'package:craft_plate/view/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import flutter_svg package

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Stack(
        children: [
          // Bottom Navigation Bar
          BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: onTap,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color(0xFF6318AF),
            unselectedItemColor: const Color(0xFF60666C),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2_rounded),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.dining_rounded),
                label: 'orders',
              ),
            ],
          ),
          // Center SVG Icon
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  onTap(1);
                },
                child: SvgPicture.asset(
                  'assets/icon/Logoo.svg',
                  height: 60, // Set height of the icon
                  width: 60, // Set width of the icon
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State {
  int _currentIndex = 0;
  final List _screens = [
    const HomeScreen(),
    const PersonScreen(),
    const WalletScreen(),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: CustomBottomNavBar(
            currentIndex: _currentIndex,
            onTap: _onTap,
          ),
        ),
      ),
    );
  }
}

class PersonScreen extends StatelessWidget {
  const PersonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Person Screen'));
  }
}

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Wallet Screen'));
  }
}
