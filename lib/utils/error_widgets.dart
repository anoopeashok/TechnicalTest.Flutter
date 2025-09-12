

import 'package:flutter/material.dart';
import 'package:flutter_tech_task/utils/app_exceptions.dart';

class ErrorMessage extends StatelessWidget {
  Exception exception;
  ErrorMessage(this.exception,{super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, color: Colors.red, size: 50),
          SizedBox(height: 10),
          Text(switch(exception){
            NotFoundError()=>"Resource not found",
            Exception() => "Something went wrong",
          }, style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}