import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget_.dart';


class ToDoItemContent {
  ToDoItemContent({required this.description, required this.title, required this.priority});
  final String title;
  final String description;
  final String priority;
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ToDoItemContent> todoList = List.empty(growable: true);
  String title = "";
  String description = "";
  String priority="";
  final _formKey = GlobalKey<FormState>();
  void addToDo(String title, String description,String priority) {
    ToDoItemContent newItem =
        ToDoItemContent(description: description, title: title, priority: priority);
    todoList.add(newItem);
  }

  void removeToDo(String title, String description) {
    for (int i = 0; i < todoList.length; i++) {
      if (todoList[i].title == title &&
          todoList[i].description == description) {
        todoList.removeAt(i);
      }
    }
    setState(() {});
  }

  Widget alertDialog() {
    return SingleChildScrollView(
      child: AlertDialog(
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Add todo"),
              SizedBox(),
              TextFormField(
                validator: (value) {
                  if (value == "") {
                    return "Title cannot be empty";
                  }
                  return null;
                },
                decoration: InputDecoration(hintText: "Title"),
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  title = value.toString();
                },
              ),
              TextFormField(
                validator: (value) {
                  if (value == "") {
                    return "Description cannot be empty";
                  }
                  return null;
                },
                decoration: InputDecoration(hintText: "Description"),
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  description = value.toString();
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Time"),
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 18.h,
              ),
              Text("Select priority"),
              DropdownButton<String>(
                items: <String>['High', 'Normal'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                    
                  );
                }).toList(),
                onChanged: (value) {
                  priority=value.toString();
                },
              ),
              SizedBox(
                height: 18.h,
              ),
              ElevatedButton(
                  onPressed: () {
                    addToDo(title, description, priority);
                    Navigator.of(context).pop();
                    setState(() {});
                  },
                  child: Text(
                    "Add to list",
                    style: TextStyle(fontSize: 14.sp),
                  ))
            ],
          ),
        ),
      ),
    );
  }
@override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: myappBar(),
      body: Stack(
        children: [
          Container(
            height: height,
            width: width,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: todoList.map((item) {
                        return TodoItem(
                            item.title, item.description, item.priority, removeToDo);
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 30,
            child: Container(
              child: FloatingActionButton(
                backgroundColor: Colors.blue.shade900,
                onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alertDialog();
                  },
                  barrierDismissible: false,
                ),
                child: const Icon(Icons.add),
              ),
            ),
          )
        ],
      ),
    );
  }
}