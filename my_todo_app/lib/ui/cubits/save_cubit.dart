import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_app/data/repo/todos_dao_repository.dart';

class SaveCubit extends Cubit<void> {
  SaveCubit():super(0);
  var todosDaoRepository = TodosDaoRepository();

  Future<void> save(String name, String details) async {
    await todosDaoRepository.save(name, details);
  }
}