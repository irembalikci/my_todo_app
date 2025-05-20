import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_app/data/repo/todos_dao_repository.dart';

class UpdateCubit extends Cubit<void> {
  UpdateCubit():super(0);
  var todosDaoRepository = TodosDaoRepository();

  Future<void> update(int id,String name, String details) async {
    await todosDaoRepository.update(id, name, details);
  }
}