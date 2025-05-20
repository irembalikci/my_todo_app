import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_app/data/entity/todos.dart';
import 'package:my_todo_app/ui/components/my_app_bar.dart';
import 'package:my_todo_app/ui/cubits/main_cubit.dart';
import 'package:my_todo_app/ui/screens/save_screen.dart';
import 'package:my_todo_app/ui/screens/update_screen.dart';
import 'package:my_todo_app/ui/tools/app_color.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MainCubit>().loadToDos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "ToDo"),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoSearchTextField(
                placeholder: "Search",
                onChanged: (searchText) {
                  context.read<MainCubit>().search(searchText);
                },
              ),
            ),
            BlocBuilder<MainCubit, List<ToDos>>(
              builder: (context, toDosList) {
                if (toDosList.isNotEmpty) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: toDosList.length,
                      itemBuilder: (context, index) {
                        var toDo = toDosList[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateScreen(toDos: toDo,)))
                          .then((_){
                            context.read<MainCubit>().loadToDos();
                          });
                          },
                          child: Card(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Icon(Icons.collections_bookmark),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      toDo.name,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Do you want to delete ${toDo.name}?",
                                          style: TextStyle(color: textColor2),
                                        ),
                                        action: SnackBarAction(
                                          label: "Yes",
                                          textColor: textColor2,
                                          onPressed: () {
                                            context.read<MainCubit>().delete(
                                              toDo.id,
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                  icon: Icon(Icons.close),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const Center();
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SaveScreen()),
          ).then((_) {
            context.read<MainCubit>().loadToDos();
          });
        },
        child: Icon(Icons.add, color: textColor1),
        backgroundColor: mainColor,
        shape: CircleBorder(),
      ),
    );
  }
}
