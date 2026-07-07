import 'package:flutter/material.dart';
import 'package:todo_list/core/enums/task_category.dart';

class CategroyHelper {
  static Color getColor(TaskCategory category) {
    switch (category) {
      case TaskCategory.personel:
        return Colors.deepPurple;
      case TaskCategory.work:
        return Colors.brown;
      case TaskCategory.study:
        return Colors.deepPurple;
      case TaskCategory.shopping:
        return Colors.brown;
    }
  }

  static String getName(TaskCategory category) {
    switch (category) {
      case TaskCategory.personel:
        return "Personel";
      case TaskCategory.work:
        return "Work";
      case TaskCategory.study:
        return "Study";
      case TaskCategory.shopping:
        return "Shopping";
    }
  }
}
