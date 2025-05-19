import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_app/data/entity/todos.dart';
import 'package:my_todo_app/data/repo/todos_dao_repository.dart';

class MainCubit extends Cubit<List<ToDos>> {
  MainCubit():super(<ToDos>[]);
  var todosDaoRepository = TodosDaoRepository();

  Future<void> loadToDos() async {
    var list = await todosDaoRepository.loadToDos();
    emit(list);
  }

  Future<void> search(String searchText) async {
    var list = await todosDaoRepository.search(searchText);
    emit(list);
  }

  Future<void> delete(int id) async {
    await todosDaoRepository.delete(id);
    await loadToDos();
  }
}