class Task {
  final String title;
  final String deadline;
  final bool done;
  final String priority;

  Task({
    required this.title,
    required this.deadline,
    required this.done,
    required this.priority,
  });
}

class TaskRepository {
  static List<Task> tasks = [
    Task(title: "zrobic pranie", deadline: "18:00", done: false, priority: "średni"),
    Task(title: "wyjsc z psem", deadline: "22:45", done: false, priority: "wysoki"),
    Task(title: "nakarmic kota", deadline: "23:00", done: false, priority: "wysoki"),
    Task(title: "umyc naczynia", deadline: "24:00", done: false, priority: "niski"),
  ];
}
