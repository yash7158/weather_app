import 'package:flutter/material.dart';


// search
void showInputPopup(BuildContext context, Function f) {
  TextEditingController _textFieldController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text('Enter name of City'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Enter something here"),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  f(_textFieldController.text);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    },
  );
}
