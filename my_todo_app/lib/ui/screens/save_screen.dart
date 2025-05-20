import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_app/ui/components/my_app_bar.dart';
import 'package:my_todo_app/ui/cubits/main_cubit.dart';
import 'package:my_todo_app/ui/cubits/save_cubit.dart';
import 'package:my_todo_app/ui/screens/main_screen.dart';
import 'package:my_todo_app/ui/tools/app_color.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({super.key});

  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  var tfName = TextEditingController();
  var tfDetails = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final double screenHeight = screenInfo.size.height;
    final double screenWidth = screenInfo.size.width;

    return Scaffold(
      appBar: MyAppBar(title: "Add New"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tfName,
                decoration: const InputDecoration(hintText: "ToDo name?"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tfDetails,
                decoration: const InputDecoration(hintText: "Details..."),
              ),
            ),
            SizedBox(
              width: screenWidth / 2,
              height: screenHeight / 15,
              child: ElevatedButton(
                onPressed: () {
                  context.read<SaveCubit>().save(tfName.text, tfDetails.text);
                  Navigator.pop(context, MaterialPageRoute (builder: (context) => MainScreen(),));
                },
                style: ElevatedButton.styleFrom(backgroundColor: mainColor),
                child: Text("SAVE", style: TextStyle(color: textColor2)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
