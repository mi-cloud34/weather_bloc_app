import 'package:flutter/material.dart';

class GecisliRenkContainer extends StatelessWidget {
  final Widget child;
  final MaterialColor renk;

  const GecisliRenkContainer({Key? key, required this.child, required this.renk}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [renk[700]!, renk[500]!, renk[200]!],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.6, 0.8, 1])),
    );
  }
}