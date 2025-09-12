

import 'package:flutter/material.dart';
import 'package:flutter_tech_task/l10n/app_localizations.dart';
import 'package:flutter_tech_task/utils/app_exceptions.dart';

class ErrorMessage extends StatelessWidget {
  String? message;
  Function? callback;
  ErrorMessage({super.key,this.message, this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, color: Colors.red, size: 50),
          SizedBox(height: 10),
          Text(message ?? AppLocalizations.of(context)!.defaultErrorMessage, style: TextStyle(fontSize: 18)),
          SizedBox(height: 10),
          callback != null ? TextButton(
            onPressed: () {
              callback!();
            },
            child: Text('Retry'),
          ) : SizedBox.shrink(),
        ],
      ),
    );
  }
}