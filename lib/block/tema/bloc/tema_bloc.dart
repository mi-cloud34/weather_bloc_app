// ignore_for_file: unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'tema_event.dart';
part 'tema_state.dart';

class TemaBloc extends Bloc<TemaEvent, TemaState> {
  TemaBloc()
      : super(UygulamaTemasi(renk: Colors.blue, thema: ThemeData.light())) {
    // ignore: void_checks
    on<TemaEvent>((event, emit) async* {
      UygulamaTemasi? uygulamaTemasi;
      if (event is TemaDegistirEvent) {
        switch (event.havaDurumuKisaltma) {
          case "sn":
          case "sl":
          case "h":
          case "t":
          case "hc":
            uygulamaTemasi = UygulamaTemasi(
                renk: Colors.grey,
                thema: ThemeData(primaryColor: Colors.brown));
            break;
          case "hr":
          case "lr":
          case "s":
            uygulamaTemasi = UygulamaTemasi(
                renk: Colors.indigo,
                thema: ThemeData(primaryColor: Colors.indigoAccent));
            break;
          case "lc":
          case "c":
            uygulamaTemasi = UygulamaTemasi(
                renk: Colors.yellow,
                thema: ThemeData(primaryColor: Colors.orangeAccent));
            break;
        }
        yield uygulamaTemasi;
      }
    });
  }
}
