// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings
import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  final String selectedCity;
  const LocationWidget({Key? key, required this.selectedCity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(selectedCity,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),);
  }
}
