import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 40, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home\n' + FirebaseAuth.instance.currentUser!.email.toString(),
      style: optionStyle,
    ),
    Text(
      'Index 1: Place',
      style: optionStyle,
    ),
    Text(
      'Index 2: Brand',
      style: optionStyle,
    ),
    Text(
      'Index 3: Trend',
      style: optionStyle,
    ),
    Text(
      'Index 4: My Page',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white38,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'HOME',
            backgroundColor: Colors.grey,
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: 'PLACE',
            icon: Icon(Icons.place_outlined),
          ),
          BottomNavigationBarItem(
            label: 'BRAND',
            icon: Icon(Icons.bakery_dining_outlined),
          ),
          BottomNavigationBarItem(
            label: 'TREND',
            icon: Icon(Icons.tag_faces),
          ),
          BottomNavigationBarItem(
            label: 'MY PAGE',
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    //해당 클래스가 호출되었을떄
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
