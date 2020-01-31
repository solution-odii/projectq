
import 'package:flutter/material.dart';

import 'Navigators.dart';


/// this method collects a customized ui and pops it as an alert dialog
openDialog(Widget widget, BuildContext context){
  showDialog(
      context: context,
      builder: (BuildContext context){
        return widget;
      }
  );
}



void showAlertDialog(BuildContext context, String message, ) {
  showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Notification'),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text('Okay'),
            onPressed: () {
              navigateBack(context);

            },
          )
        ],
      ));
}



void successAlertDialog(BuildContext context, String message, ) {
  showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Notification'),
        content: Text(message),

      ));
}


