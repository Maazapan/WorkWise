import 'package:employments/home_page.dart';
import 'package:employments/models/screens/offers/offer_page.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNativationState();
}

class _BottomNativationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 25,
          ),
          label: ' ',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            size: 25,
          ),
          label: ' ',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            size: 25,
          ),
          label: ' ',
        ),
      ],
      unselectedItemColor: Colors.black26,
      selectedItemColor: Colors.black54,
      selectedFontSize: 0,
      currentIndex: _selectedIndex,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });

        if (index == 0) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const MyHomePage()));
        } else if (index == 1) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const OfferPage(homeSearch: "")));
        } else if (index == 2) {
          Navigator.pushNamed(context, '/profile');
        }
      },
    );
  }
}
