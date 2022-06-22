import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function() onPressed;

  AdaptativeButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text('modelo'),
            onPressed: onPressed,
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 20),
          )
        : TextButton(
            style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.red,
                minimumSize: Size(150, 40),
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)))),
            child: Text(
              label,
              style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: onPressed,
          );
  }
}
