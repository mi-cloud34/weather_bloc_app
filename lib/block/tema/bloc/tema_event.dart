part of 'tema_bloc.dart';

abstract class TemaEvent extends Equatable {
  const TemaEvent([List<String> props = const []]) : super();

  @override
  List<Object> get props => [];
}

class TemaDegistirEvent extends TemaEvent {
  final String havaDurumuKisaltma;
  TemaDegistirEvent({required this.havaDurumuKisaltma})
      : super([havaDurumuKisaltma]);
}
