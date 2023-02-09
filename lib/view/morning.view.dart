import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:task_manager/widgets/card.dart';

class MorningTasks extends StatefulWidget {
  const MorningTasks({super.key});

  @override
  State<MorningTasks> createState() => _MorningTasksState();
}

class _MorningTasksState extends State<MorningTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [CardTask()],
        ),
      ),
    );
  }
}
