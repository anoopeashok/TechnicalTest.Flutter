

import 'package:flutter/material.dart';

class ErrorWidget extends StatelessWidget {
  String message;
  ErrorWidget({super.key,this.message = 'An error occurred'});

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