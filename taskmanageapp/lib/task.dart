class Task {
  String id;
  String title;
  String description;
  bool isCompleted;

  Task(
      {required this.id,
      required this.title,
      required this.description,
      this.isCompleted = false});

  factory Task.fromMap(Map<String, dynamic> data, String id) {
    return Task(
      id: id,
      title: data['title'],
      description: data['description'],
      isCompleted: data['isCompleted'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
    };
  }
}
