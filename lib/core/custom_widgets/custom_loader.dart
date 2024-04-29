

import 'package:flutter/material.dart';

class CustomCircleLoader extends StatelessWidget {
  Color color;
  CustomCircleLoader({Key? key, this.color = Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: CircularProgressIndicator(
            color: color,
            strokeWidth: 2,
          ),
        ));;
  }
}
