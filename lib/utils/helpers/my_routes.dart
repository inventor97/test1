
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Route myMaterialPageRoute(dynamic t) {
  if (Platform.isIOS) {
    return CupertinoPageRoute(builder: (_) => t);
  } else {
    return MaterialPageRoute(builder: (_) => t);
  }
}

Route myAnimatedRoute(dynamic t) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => t,
    transitionDuration: const Duration(milliseconds: 400),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1, 0);
      const end = Offset.zero;
      const curve = Curves.linear;

      final tween = Tween(begin: begin, end: end);
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      );
    },
  );
}
