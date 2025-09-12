

import 'package:flutter/material.dart';
import 'package:flutter_tech_task/utils/app_exceptions.dart';

class ErrorMessage extends StatelessWidget {
  String message;
  ErrorMessage({super.key,this.message = "Something went wrong"});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, color: Colors.red, size: 50),
          SizedBox(height: 10),
          Text(message, style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}