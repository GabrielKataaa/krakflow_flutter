import 'package:flutter/material.dart';
import 'task_repository.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});



  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'KrakFlow',
      home: ekranGlowny()
    );
  }
}


class ekranGlowny extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return stanglowny();
  }
}
class stanglowny extends State<ekranGlowny> {
  @override
  Widget build(BuildContext context){
    int completedTasks = TaskRepository.tasks.where((task) => task.done).length;
    return Scaffold(
      appBar: AppBar(
        title: Text("KrakFlow"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Masz dziś ${TaskRepository.tasks.length} zadania, wykonano: $completedTasks"),
            SizedBox(height: 16),

            Text(
              "Dzisiejsze zadania",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 16),

            Expanded(
              child: ListView.builder(
                itemCount: TaskRepository.tasks.length,
                itemBuilder: (context, index) {
                  final task = TaskRepository.tasks[index];

                  return TaskCard(
                    title: task.title,
                    subtitle: "termin: ${task.deadline} | priorytet: ${task.priority}",
                    icon: task.done ? Icons.check_circle : Icons.radio_button_unchecked,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen(),)
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddTaskScreen extends StatelessWidget{
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nowe zadanie"),
      ),
      body: Center(
        child: Text("Tutaj bedzie formularz dodawania taska"),
      )
    );
  }
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