import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_store/functions/function.dart';
import 'package:hive_store/model/class.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState(){
    super.initState();
    getData();
  }
  TextEditingController titleController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HOME'),centerTitle: true,backgroundColor: Colors.red,),
      body:ValueListenableBuilder(
        valueListenable: valueNotifier, 
        builder:(context, value, child) {
          return ListView.builder(
            itemCount:value.length ,
            itemBuilder: (context,index){
              final data=value[index];
                  return SizedBox(
                    height: 100,
                    child: ListTile(
                      title: Text(data.title),  
                      trailing: Column(
                        children: [
                          InkWell(child: Icon(Icons.delete,color: Colors.red,),onTap: () {
                            deleteData(index);
                          },)
                        ],
                      ),
                    ),
                  );
            });
        }, ),
      floatingActionButton: FloatingActionButton(onPressed: (){showTask();},child: Icon(Icons.add),),
    );
  }
  Future showTask() async{
    return showDialog(
      context: context, 
      builder: (context)=>AlertDialog(
        title: Text('ADD NOTES'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'title')),
              SizedBox(height: 20,),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'description')),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: (){Navigator.pop(context);}, child: Text('cancel')),
          TextButton(onPressed: (){
            if(titleController.text.isNotEmpty || descriptionController.text.isNotEmpty){
                  final save =Data(title: titleController.text, description: descriptionController.text);
                  addData(save);
                  titleController.clear();
                  descriptionController.clear();
                  Navigator.pop(context);
                  setState(() {
                    
                  });
            }
          }, child: Text('Add')),
        ],
      )
      );
  }
}