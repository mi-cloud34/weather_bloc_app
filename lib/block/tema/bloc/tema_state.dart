part of 'tema_bloc.dart';

abstract class TemaState extends Equatable {
  const TemaState([List props=const[]]):super();

  @override
  List<Object> get props => [];
}

class UygulamaTemasi extends TemaState {
  final ThemeData thema;
  final MaterialColor renk;
  UygulamaTemasi({required this.renk, required this.thema})
      : super([renk, thema]);
}
