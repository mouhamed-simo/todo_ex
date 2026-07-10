import 'package:flutter/material.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/screens/add_tasks_screen.dart';
import 'package:todo_list/screens/calendar_screen.dart';
import 'package:todo_list/screens/home_screen.dart';
import 'package:todo_list/screens/setting_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int currentIndex = 0;
  final List<Widget> pages = const [
    HomeScreen(),
    CalendarScreen(),
    ArchiveScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, size: 30, color: AppColors.primary),
        ),
        centerTitle: true,
        title: const Text(
          'Focus',
          style: TextStyle(
            color: AppColors.primary,
            fontFamily: 'Inter',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings, size: 30, color: AppColors.primary),
          ),
        ],
      ),
      body: pages[currentIndex],
      bottomNavigationBar: NavigationBar(
        height: 70,
        backgroundColor: Colors.white,
        indicatorColor: AppColors.primary,

        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.task, color: AppColors.neutral),
            label: 'Tasks',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_today_outlined, color: AppColors.neutral),
            label: 'Calendar',
          ),
          NavigationDestination(
            icon: Icon(Icons.archive_outlined, color: AppColors.neutral),
            label: 'Archive',
          ),
        ],
      ),

      // floating button add task
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 35),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddTasksScreen()),
            );
            // code
          },
          shape: const CircleBorder(),
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,

          child: const Icon(Icons.add),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      // bottomNavigationBar    (Menu
    );
  }
}
