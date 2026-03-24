import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  List<Task> tasks = [
    Task(title: "zrobic pranie ", deadline: "18:00"),
    Task(title: "wyjsc z psem ", deadline: "22:45"),
    Task(title: "nakarmic kota ", deadline: "23:00"),
    Task(title: "umyc naczynia", deadline: "24:00"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KrakFlow',
      home: Center(
        child: Column(
          children: [
            Text(
              "Dzisiejsze zadania",
              style: TextStyle(fontSize: 67, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return TaskCard(title: "${title}",);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Task {
  final String title;
  final String deadline;

  Task({required this.title, required this.deadline});
}

class TaskCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const TaskCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
