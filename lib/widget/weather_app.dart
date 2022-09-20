// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/block/tema/bloc/tema_bloc.dart';
import 'package:weather_bloc_app/block/weather/bloc/weather_bloc.dart';
import 'package:weather_bloc_app/widget/gecisli_arkaplan_renk.dart';
import 'package:weather_bloc_app/widget/selected_city.dart';
import 'latest_update_widget.dart';
import 'location_widget.dart';
import 'max_min_widget.dart';
import 'weather_image_widget.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    Completer<void> _refreshCompleter = Completer<void>();
    late String _selectedCity;
    return Scaffold(
        appBar: AppBar(
          title: Text("Weather App"),
          actions: [
            IconButton(
                onPressed: () async {
                  _selectedCity = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SelectedCity()));
                  if (_selectedCity != null) {
                    _weatherBloc.add(FetchWeather(cityName: _selectedCity));
                  }
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: Center(
          child: BlocBuilder(
              bloc: _weatherBloc,
              builder: (context, WeatherState state) {
                if (state is WeatherInitial) {
                  return Center(
                    child: Text("Sehir Ekleyin"),
                  );
                }
                if (state is WeatherLoadingState) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is WeatherLoadState) {
                  final _getWeather = state.weather;
                  final havaDurumuKisaltma =
                      _getWeather.consolidatedWeather![0].weatherStateAbbr;
                  _selectedCity = _getWeather.title.toString();
                  BlocProvider.of<TemaBloc>(context).add(TemaDegistirEvent(
                      havaDurumuKisaltma: havaDurumuKisaltma.toString()));
                  _refreshCompleter.complete();
                  _refreshCompleter = Completer();
                  // _getWeather.consolidatedWeather![0];
                  return BlocBuilder(
                    bloc: BlocProvider.of<TemaBloc>(context),
                    builder: (context,TemaState temaState) {
                      return GecisliRenkContainer(
                        renk: (temaState as UygulamaTemasi).renk,
                        child: RefreshIndicator(
                          onRefresh: () {
                            _weatherBloc
                                .add(RefreshWeather(cityName: _selectedCity));
                            return _refreshCompleter.future;
                          },
                          child: ListView(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                    child: LocationWidget(
                                        selectedCity:
                                            _getWeather.title.toString())),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: LatestUpdateWidget()),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: WeatherImageWidget()),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: MaxMinWidget()),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                if (state is WeatherErrorState) {
                  return Text("Hata cıkıt");
                }
                return SizedBox();
              }),
        ));
  }
}
