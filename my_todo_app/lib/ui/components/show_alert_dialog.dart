import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_app/ui/cubits/main_cubit.dart';

showAlertDialog(BuildContext context, dynamic toDo) {
  AlertDialog alert = AlertDialog(
    title: Text("DELETE"),
    content: Text("Do you want to delete ${toDo.name}?"),
    actions: [
      TextButton(
        child: Text("Cancel"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      TextButton(
        child: Text("OK"),
        onPressed: () {
          context.read<MainCubit>().delete(toDo.id);
          Navigator.pop(context);
        },
      ),
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
