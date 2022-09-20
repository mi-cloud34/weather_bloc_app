// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/block/weather/bloc/weather_bloc.dart';

class LatestUpdateWidget extends StatelessWidget {
  const LatestUpdateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder(
      bloc: _weatherBloc,
      builder: (context, WeatherState state) {
        final _newTime = (state as WeatherLoadState).weather.time!.toLocal();
        return Text(
          'Son Güncelleme:' + TimeOfDay.fromDateTime(_newTime).format(context),
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        );
      },
    );
  }
}
