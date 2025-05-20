import 'package:my_todo_app/data/entity/todos.dart';
import 'package:my_todo_app/data/sqlite/database_helper.dart';

class TodosDaoRepository {
  Future<void> save (String name, String details) async {
    var db = await DatabaseHelper.databaseConnection();
    var newToDo = Map<String,dynamic>();
    newToDo["name"] = name;
    newToDo["details"] = details;

    await db.insert("my_todo", newToDo);
  }

  Future<void> update (int id, String name, String details) async {
    var db = await DatabaseHelper.databaseConnection();
    var updatedToDo = Map<String, dynamic>();
    updatedToDo["name"] = name;
    updatedToDo["details"] = details;

    await db.update("my_todo", updatedToDo,where: "id=?",whereArgs: [id]);
  }

  Future<List<ToDos>> loadToDos() async {
    var db = await DatabaseHelper.databaseConnection();
    List<Map<String, dynamic>> list = await db.rawQuery("SELECT * FROM my_todo");
    
    return List.generate(list.length, (index){
      var row = list[index];
      var id = row["id"];
      var name = row["name"];
      var details = row["details"];

      return ToDos(id: id, name: name, details: details);
    });
  }

  Future<List<ToDos>> search (searchText) async {
    var db = await DatabaseHelper.databaseConnection();

    List<Map<String,dynamic>> list = await db.rawQuery("SELECT * FROM my_todo where name LIKE '%$searchText%'");

   return List.generate(list.length, (index){
      var row = list[index];
      var id = row["id"];
      var name = row["name"];
      var details = row["details"];

      return ToDos(id: id, name: name, details: details);
    });
  }

  Future<void> delete(int id) async {
    var db = await DatabaseHelper.databaseConnection();
    await db.delete("my_todo",where: "id=?",whereArgs: [id]);
  }
}