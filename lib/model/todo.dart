class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Complete Task 1', isDone: true),
      ToDo(id: '02', todoText: 'Upload Task 1', isDone: false),
      ToDo(id: '03', todoText: 'Complete Task 2', isDone: false),
      ToDo(id: '04', todoText: 'Update Resume', isDone: true),
      ToDo(id: '05', todoText: 'Weekend Trip', isDone: false),
      ToDo(id: '06', todoText: 'Call Mom', isDone: false),
    ];
  }
}

