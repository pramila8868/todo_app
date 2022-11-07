// ignore_for_file: prefer_typing_uninitialized_variables

class AllTodo {
  bool? success;
  String? message;
  List<Todo>? todo;

  AllTodo({this.success, this.message, this.todo});

  AllTodo.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      // ignore: deprecated_member_use, unnecessary_new
      todo = <Todo>[];
      json['data'].forEach((v) {
        todo?.add(Todo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    // ignore: unnecessary_null_comparison
    if (todo != null) {
      data['data'] = todo?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Todo {
  String? todolistId;
  String? userId;
  String? title;
  String? todoNote;
  String? createdDate;

  Todo(
      {this.todolistId,
      this.userId,
      this.title,
      this.todoNote,
      this.createdDate});

  Todo.fromJson(Map<String, dynamic> json) {
    todolistId = json['todolist_id'];
    userId = json['user_id'];
    title = json['title'];
    todoNote = json['todo_note'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['todolist_id'] = todolistId;
    data['user_id'] = userId;
    data['title'] = title;
    data['todo_note'] = todoNote;
    data['created_date'] = createdDate;
    return data;
  }
}
