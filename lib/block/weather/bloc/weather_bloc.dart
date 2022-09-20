import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_bloc_app/data/weather_repository.dart';
import 'package:weather_bloc_app/locator.dart';

import '../../../model/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
   WeatherRepository weatherRepository = locator();
  WeatherBloc() : super(WeatherInitial()) {
    // ignore: void_checks
    on<WeatherEvent>((event, emit) async* {
      if (event is FetchWeather) {
        yield WeatherLoadingState();
        try {
         
        final Weather _getWeather=await weatherRepository.getWeatherCity(event.cityName);
          yield WeatherLoadState(weather:_getWeather);
        } catch (_) {
          yield WeatherErrorState();
        }
      }
       if (event is RefreshWeather) {
        //yield WeatherLoadingState();
        try {
         
        final Weather _getWeather=await weatherRepository.getWeatherCity(event.cityName);
          yield WeatherLoadState(weather:_getWeather);
        } catch (_) {
          yield state;
        }
      }
    });
  }
}
