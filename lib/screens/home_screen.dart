import 'package:flutter/material.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/core/enums/task_category.dart';
import 'package:todo_list/widget/task_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12),
            Text(
              'My Tasks',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 12),

            // Two button activite / complete
            Row(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('8 active'),
                ),
                SizedBox(width: 12),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.secondary,
                    side: BorderSide.none,
                  ),

                  child: Text(' 3 completed '),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Today',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text('Feb 24', style: TextStyle(color: AppColors.secondary)),
              ],
            ),

            // tasks
            TaskCard(title: 'Morning meditation and focus session', category: TaskCategory.work, isCompleted: false),
            TaskCard(title: 'Review Zenith Ui system achitecteure', category: TaskCategory.personel, isCompleted: true),
            TaskCard(title: 'Review Zenith Ui system achitecteure', category:null, isCompleted: false),

          ],
        ),
      ),
    );
  }
}
