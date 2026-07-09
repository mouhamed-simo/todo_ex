import 'package:flutter/material.dart';
import 'package:todo_list/screens/calendar_screen.dart';
import 'package:todo_list/screens/home_screen.dart';
import 'package:todo_list/screens/setting_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavogationState();
}

class _MainNavogationState extends State<MainNavigation> {
  int currentIndex = 0;
  final List<Widget> pages = [
    HomeScreen(),
    CalendarScreen(), 
    ArchiveScreen()
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.task), label: 'Tasks'),
          NavigationDestination(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Calendar',
          ),
          NavigationDestination(
            icon: Icon(Icons.archive_outlined),
            label: 'Archive',
          ),
        ],
      ),
    );
  }
}
