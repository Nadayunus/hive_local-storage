import 'package:flutter/material.dart';
import 'package:hive_store/functions/function.dart';
import 'package:hive_store/model/class.dart';

class Edit extends StatefulWidget { // WIDGET CLASS
  String title;
  String description;
  int index;
  Edit({required this.title,required this.description,required this.index});

  @override
  State<Edit> createState() => _EditState();
}
class _EditState extends State<Edit> {   //state class
  @override
  void initState(){
   titleController=TextEditingController(text:widget.title);
   descriptionController=TextEditingController(text: widget.description);
   super.initState();
  }

  TextEditingController titleController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EDIT PAGE'),centerTitle: true,backgroundColor: Colors.red,),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(border:OutlineInputBorder()),),
            SizedBox(height: 10,),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(border:OutlineInputBorder()),),
            ElevatedButton(onPressed: (){
              final edit=Data(title: titleController.text, description: descriptionController.text);
              updateData(widget.index, edit);
              Navigator.pop(context);
            }, child: Text('update')),
          ],
        ),
      ),
    );
  }
}

