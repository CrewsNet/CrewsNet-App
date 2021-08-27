import 'package:flutter/material.dart';

const CTextFieldDecoration = InputDecoration(
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

const CTextStyle = TextStyle(
  fontSize: 15.0,
);

const CMainHeading = TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold);
const CMainSubHeading = TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold);

const CCopyrightStyle = TextStyle(fontSize: 10);
