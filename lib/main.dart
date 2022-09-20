import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/block/tema/bloc/tema_bloc.dart';
import 'package:weather_bloc_app/block/weather/bloc/weather_bloc.dart';
import 'package:weather_bloc_app/locator.dart';

import 'widget/weather_app.dart';

void main() {
  setupLocator();
  runApp(BlocProvider<TemaBloc>(
    create: (context) => TemaBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TemaBloc, TemaState>(
      bloc: BlocProvider.of<TemaBloc>(context),
      builder: (context,TemaState state) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: (state as UygulamaTemasi).thema,
          home: BlocProvider<WeatherBloc>(
            create: (context) => WeatherBloc(),
            child: WeatherApp(),
          ),
        );
      },
    );
  }
}
