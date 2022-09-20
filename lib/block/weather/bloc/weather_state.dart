part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState([List<Weather> props=const[]]):super();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadState extends WeatherState {
  final Weather weather;
  WeatherLoadState({required this.weather}):super([weather]);
}
class WeatherErrorState extends WeatherState{}