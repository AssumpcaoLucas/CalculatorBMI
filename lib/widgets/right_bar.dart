import 'package:flutter/material.dart';

class rightBar extends StatelessWidget {
  
  final double barWidth;
  const rightBar({super.key, required this.barWidth});  

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 25,
          width: barWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20)
            ),
            color: Colors.blue
          ),
        )
      ],
    );
  }
}