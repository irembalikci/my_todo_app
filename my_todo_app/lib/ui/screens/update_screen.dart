import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_app/data/entity/todos.dart';
import 'package:my_todo_app/ui/components/my_app_bar.dart';
import 'package:my_todo_app/ui/cubits/update_cubit.dart';
import 'package:my_todo_app/ui/screens/main_screen.dart';
import 'package:my_todo_app/ui/tools/app_color.dart';

class UpdateScreen extends StatefulWidget {
  ToDos toDos;
  UpdateScreen({required this.toDos});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  var tfName = TextEditingController();
  var tfDetails = TextEditingController();

  @override
  void initState() {
    super.initState();
    tfName.text = widget.toDos.name;
    tfDetails.text =widget.toDos.details;
  }

  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final double screenHeight = screenInfo.size.height;
    final double screenWidth = screenInfo.size.width;

    return Scaffold(
      appBar: MyAppBar(title: "Update"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tfName,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tfDetails,
              ),
            ),
            SizedBox(
              width: screenWidth/2, height: screenHeight/15,
              child: ElevatedButton(onPressed: (){
                context.read<UpdateCubit>().update(widget.toDos.id, tfName.text, tfDetails.text);
                Navigator.pop(context, MaterialPageRoute (builder: (context) => MainScreen(),));
              },style: ElevatedButton.styleFrom(backgroundColor: mainColor), 
              child: Text("UPDATE",style: TextStyle(color: textColor2),)),    
            )
          ],
        ),
      ),
      
    );
  }
}
