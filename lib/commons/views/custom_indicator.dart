import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          Platform.isAndroid
              ? CircularProgressIndicator()
              : CupertinoActivityIndicator(radius: 16),
    );
  }
}
