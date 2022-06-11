// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class TaskCardWidget extends StatelessWidget {
  final String? title;
  final String? desc;
  TaskCardWidget({this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 20.0,
      ),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 32.0,
        horizontal: 24.0,
      ),
      decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          borderRadius: BorderRadius.circular(20.0)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          title ?? "(Unnamed Task)",
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 10.0,
          ),
          child: Text(
            desc ?? 'Add description',
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 18.0,
              height: 1.5,
            ),
          ),
        )
      ]),
    );
  }
}

class Todowidget extends StatelessWidget {
  final String? text;
  final bool? isDone;
  Todowidget({this.text,@required this.isDone});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 8.0,
      ),
      child: Row(
        children: [
          Container(
            width: 20.0,
            height: 20.0,
            margin: EdgeInsets.only(
              right: 12.0,
            ),
            decoration: BoxDecoration(
              color:  Color(0xFF7349FE) ,
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Image(image: AssetImage('assets/images/check_icon.png')),
          ),
          Text(
            text ?? "Unnamed Todo",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
