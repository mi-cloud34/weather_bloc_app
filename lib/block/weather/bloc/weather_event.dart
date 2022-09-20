// ignore_for_file: prefer_const_constructors_in_immutables

part of 'weather_bloc.dart';
@immutable
abstract class WeatherEvent extends Equatable {
   WeatherEvent([List<String> props=const[]]):super();

  @override
  List<Object> get props => [];
}

class FetchWeather extends WeatherEvent {
  final String cityName;
  FetchWeather({required this.cityName}):super([cityName]);
}
class RefreshWeather extends WeatherEvent {
  final String cityName;
  RefreshWeather({required this.cityName}):super([cityName]);
}
