// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_todo/database_helper.dart';
import 'package:flutter_todo/models/task.dart';
import 'package:flutter_todo/screens/widgets.dart';
import 'package:sqflite/sqflite.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 24.0,
                      bottom: 6,
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image(
                                image: AssetImage(
                                    'assets/images/back_arrow_icon.png')),
                          ),
                        ),
                        Expanded(
                            child: TextField(
                          onSubmitted: (value) async {
                            print('Field value : $value');

                            if (value != "") {
                              DatabaseHelper _dbHelper = DatabaseHelper();
                              Task _newTask = Task(title: value);
                              await _dbHelper.insertTask(_newTask);
                              print("New task has been created");
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Enter New Task Title",
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 12.0,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Add discription for the task",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 24.0,
                        ),
                      ),
                    ),
                  ),
                  Todowidget(
                    text: "Create your first Task",
                    isDone: true,
                  ),
                  Todowidget(
                    text: "Create your first Todo as well",
                    isDone: true,
                  ),
                  Todowidget(
                    isDone: false,
                  ),
                  Todowidget(
                    isDone: false,
                  ),
                ],
              ),
              Positioned(
                bottom: 24.0,
                right: 24.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TaskPage()));
                  },
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                        color: Color(0xFFFE3577),
                        borderRadius: BorderRadius.circular(20)),
                    child: Image(
                      image: AssetImage(
                        "assets/images/delete_icon.png",
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
