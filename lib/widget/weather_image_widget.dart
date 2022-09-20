// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/block/weather/bloc/weather_bloc.dart';

class WeatherImageWidget extends StatelessWidget {
  const WeatherImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return BlocBuilder(
        bloc: _weatherBloc,
        builder: (context, WeatherState state){
          final _newCelcius= (state as WeatherLoadState)
                        .weather
                        .consolidatedWeather![0]
                        .theTemp
                        ?.floor()
                        .toString();
       final _newImage= (state as WeatherLoadState)
                        .weather
                        .consolidatedWeather![0]
                        .weatherStateAbbr;
         return Column(
            children: <Widget>[
              Text(
                _newCelcius!+
                    " ℃",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              Image.network(
                "https://www.metaweather.com/static/img/weather/png/" +
                    _newImage!+
                    ".png",
                width: 150,
                height: 150,
              )
            ],
          );
        });
  }
}
