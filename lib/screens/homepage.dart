// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_import, use_key_in_widget_constructors, must_be_immutable, unused_field, prefer_final_fields, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_todo/database_helper.dart';
import 'package:flutter_todo/screens/taskpage.dart';
import 'package:flutter_todo/screens/widgets.dart';

class homepage extends StatefulWidget {
 

  DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    var _dbHelper;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(
                        bottom: 32.0,
                      ),
                      child:
                          Image(image: AssetImage('assets/images/logo.png'))),
                  Flexible(
                    child: FutureBuilder(
                      future: _dbHelper.getTasks(),
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 24.0,
                right: 0.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TaskPage()));
                  },
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                        color: Color(0xFF7349FE),
                        borderRadius: BorderRadius.circular(20)),
                    child: Image(
                      image: AssetImage(
                        "assets/images/add_icon.png",
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
