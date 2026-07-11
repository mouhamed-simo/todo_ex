import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/core/constants/app_colors.dart';

class AddTasksScreen extends StatefulWidget {
  const AddTasksScreen({super.key});

  @override
  State<AddTasksScreen> createState() => _AddTasksScreenState();
}

class _AddTasksScreenState extends State<AddTasksScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController taskController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  @override
  void dispose() {
    taskController.dispose();
    dateController.dispose();
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'New Task',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'CANCEL',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              const Text(
                'TASK TITLE',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: taskController,
                // form validation
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a task title';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'What needs to be done ?',
                  hintStyle: const TextStyle(
                    color: Color.fromARGB(255, 199, 200, 201),
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 165, 167, 170),
                    ),
                  ),
                ),
                keyboardType: TextInputType.text,
              ),

              const SizedBox(height: 30),
              // add date
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                ),

                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.date_range_outlined,
                          color: AppColors.primary,
                          size: 25,
                        ),
                        SizedBox(width: 10),
                        const Text(
                          'DUE DATE',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),

                    // date
                    TextFormField(
                      controller: dateController,
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'Today , Oct 24',
                        suffixIcon: Icon(Icons.arrow_downward_outlined),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: AppColors.secondary,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: AppColors.secondary,
                          ),
                        ),
                      ),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2030),
                        );
                        if (pickedDate != null) {
                          dateController.text = DateFormat(
                            'MMM d',
                          ).format(pickedDate);
                        }
                      },
                    ),
                    SizedBox(height: 12),

                    // time
                    TextFormField(
                      controller: timeController,
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: '9:00 AM',
                        suffixIcon: Icon(Icons.access_time),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: AppColors.secondary,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: AppColors.secondary,
                          ),
                        ),
                      ),
                      onTap: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (pickedTime != null) {
                          setState(() {
                            selectedTime = pickedTime;
                          });
                          timeController.text = pickedTime.format(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
