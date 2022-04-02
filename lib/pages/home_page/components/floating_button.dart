import 'package:flutter/material.dart';
import 'package:test1/utils/utils.dart';

class MyFloatingButton extends StatelessWidget {
  const MyFloatingButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: MyColors.color800,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 7),
                color:  MyColors.color800.withOpacity(.4),
                spreadRadius: 0,
                blurRadius: 20,
              ),
            ]),
        child: const Center(
          child: Icon(
            Icons.settings_outlined,
            color: Colors.white,
            size: 35,
          ),
        ),
      ),
    );
  }
}
