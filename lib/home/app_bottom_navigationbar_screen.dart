import 'package:flutter/material.dart';
import 'package:flutter_webview_app/calender_screen.dart';
import 'package:flutter_webview_app/google_map_screen.dart';
import 'package:flutter_webview_app/group_screen.dart';
import 'package:flutter_webview_app/renew_screen.dart';
import 'package:flutter_webview_app/unarmed_screen.dart';
import 'package:flutter_webview_app/upgrade_screen.dart';
import 'package:flutter_webview_app/website_screen.dart';
import 'home_screen.dart';

class AppBottomNavigationBar extends StatefulWidget {
  AppBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _AppBottomNavigationBarState createState() =>
      _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState
    extends State<AppBottomNavigationBar> {
  int _selectedIndex = 2;
  final List<Widget> _pages = [
    GoogleScreen(),
    GroupScreen(),
    HomeScreen(),
    WebsiteScreen(),
    CalenderScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          height: 70,
          //  color: Colors.white,
          child: SizedBox(
            height: 70,
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              //unselectedItemColor: Colors.blue,
              unselectedFontSize: 11,
              backgroundColor: Colors.white,
              selectedFontSize: 12,
              selectedIconTheme: const IconThemeData(
                color:Color(0xff3c54b4),
                size: 28,
              ),
              type: BottomNavigationBarType.fixed,
              selectedItemColor: const Color(0xff3c54b4),
              onTap: _onItemTapped,
              // showSelectedLabels: false,
              // showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.map,
                    size: 25,
                  ),
                  label: 'Map',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.store,
                    size: 25,
                  ),
                  label: 'Store',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_filled,
                    size: 25,
                  ),
                  // ignore: deprecated_member_use
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.web,
                    size: 25,
                  ),
                  // ignore: deprecated_member_use
                  label: 'Website',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.calendar_today_outlined,
                    size: 20,
                  ),
                  // ignore: deprecated_member_use
                  label: 'Calender',
                ),
              ],
            ),
          ),
        ),
        //   ],
        // ),
      ),
    );
  }
}
