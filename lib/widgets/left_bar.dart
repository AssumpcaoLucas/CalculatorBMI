import 'package:flutter/material.dart';

class leftBar extends StatelessWidget {
  
  final double barWidth;
  const leftBar({super.key, required this.barWidth});
  

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 25,
          width: barWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20)
            ),
            color: Colors.blue
          ),
        )
      ],
    );
  }
}