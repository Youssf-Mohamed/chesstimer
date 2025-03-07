import 'package:flutter/material.dart';


Widget CircleButtton({required int time, fun})=>GestureDetector(
  onTap: () {
    fun();
  },
  child: Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(
      color: Colors.white,
      shape: BoxShape.circle,
      border: Border.all(
        color: Colors.black,
        width: 2,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black,
          spreadRadius: 1,
          blurRadius: 1,
          offset: Offset(0, 3),
        ),
      ],
    ),
    alignment: Alignment.center,
    child: Text(
      '${time}',
      style: TextStyle(fontSize: 22, color: Colors.black),
    ),
  ),
);
