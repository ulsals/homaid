import 'package:flutter/material.dart';
import 'package:homaid/user/chat.dart';
import 'package:homaid/user/home.dart';
import 'package:homaid/user/profile.dart';
import 'package:homaid/user/riwayat.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  //membuat icon bottom
  int _bottomNavCurrentIndex = 0;
  List<Widget> _container = [
    HomePage(),
    RiwayatPage(),
    ChatPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottom
      body: _container[_bottomNavCurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _bottomNavCurrentIndex = index;
          });
        },
        currentIndex: _bottomNavCurrentIndex,

        //pembuatan buttom home
        items: [
          BottomNavigationBarItem(
              activeIcon: new Icon(
                Icons.home,
              ),
              icon: new Icon(
                Icons.home,
              ),
              label: 'Home'),

          //pembuatan buttom riwayat
          BottomNavigationBarItem(
              activeIcon: new Icon(
                Icons.article,
              ),
              icon: new Icon(
                Icons.article,
              ),
              label: 'History'),

              //pembuatan buttom chat 
              BottomNavigationBarItem(
            activeIcon: new Icon(
              Icons.message,
            ),
            icon: new Icon(
              Icons.message,
             ),
             label: 'Chat'
          ),

          //pembuatan buttom profile
          BottomNavigationBarItem(
            activeIcon: new Icon(
              Icons.account_circle,
            ),
            icon: new Icon(
              Icons.account_circle,
             ),
             label: 'Profile'
          ),


        ],
      ),
    );
  }
}
