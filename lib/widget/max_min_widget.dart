// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/block/weather/bloc/weather_bloc.dart';

class MaxMinWidget extends StatelessWidget {
  const MaxMinWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder(
      bloc: _weatherBloc,
      builder: (context, WeatherState state) {
        final _maxValue = (state as WeatherLoadState)
            .weather
            .consolidatedWeather![0]
            .maxTemp!
            .floor()
            .toString();
        final _minValue = (state as WeatherLoadState)
            .weather
            .consolidatedWeather![0]
            .minTemp!
            .floor()
            .toString();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // ignore: prefer_const_literals_to_create_immutables

          children: [
            Text("Max:" + _maxValue + " °C"),
            Text("Min:" + _minValue + " °C")
          ],
        );
      },
    );
  }
}
