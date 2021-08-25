import 'package:flutter/material.dart';

AppBar header(context, {bool isAppTitle = false, String titletext}) {
  return AppBar(
    title: Text(
      isAppTitle ? "FlutterShare" : titletext,
      style: TextStyle(
          color: Colors.white,
          fontFamily: isAppTitle? "Signatra": "",
          fontSize: isAppTitle? 50.0: 22.0),
    ),
    centerTitle: true,
    backgroundColor: Theme.of(context).accentColor,
  );
}
