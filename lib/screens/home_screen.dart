import 'package:flutter/material.dart';
import 'package:todo_list/core/constants/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {},
         icon: Icon(Icons.menu, size: 30, color: AppColors.primary, )),
        title: Center(child: const Text('Focus' , style: TextStyle( color:AppColors.primary , fontFamily: 'Inter',fontSize: 20,fontWeight: FontWeight.bold))),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings ,size: 30, color: AppColors.primary,))],
      ),


      body: Column(
        children: [
          Text('My Tasks',)
          
        ],
      ),
    );
  }
}
