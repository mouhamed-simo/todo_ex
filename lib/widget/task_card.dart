import 'package:flutter/material.dart';
import 'package:todo_list/core/enums/task_category.dart';
import 'package:todo_list/core/utils/categroy_helper.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final TaskCategory? category;
  final bool isCompleted;

  const TaskCard({
    super.key,
    required this.title,
    required this.category,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3)),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Checkbox(
                shape: CircleBorder(),
                value: isCompleted,
                onChanged: (value) {},
              ),
              SizedBox(width: 6),
              Expanded(
                child: Text(
                  title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,

                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          ),
          if(category != null)
          Padding(
            
            padding: const EdgeInsets.only(left: 50),
            child: Chip(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              label: Text(CategroyHelper.getName(category!), style: TextStyle(color: CategroyHelper.getColor(category!))),
              backgroundColor: CategroyHelper.getColor(category!).withOpacity(0.1),
              side: BorderSide.none,
            ),
          ),
        ],
      ),
    );
  }
}
