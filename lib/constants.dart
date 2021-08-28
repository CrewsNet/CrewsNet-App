import 'package:flutter/material.dart';

const AuthTextFieldDecoration = InputDecoration(
  hintText: "Enter your email",
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(20.0),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(20.0),
    ),
    borderSide: BorderSide(
      color: Colors.lightBlue,
      width: 1.5,
    ),
  ),
);

