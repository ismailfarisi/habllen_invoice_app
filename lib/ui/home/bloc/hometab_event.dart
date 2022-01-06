part of 'hometab_bloc.dart';

abstract class HometabEvent extends Equatable {
  const HometabEvent();

  @override
  List<Object> get props => [];
}

class TabChanged extends HometabEvent {
  TabChanged(this.index);
  final int index;

  @override
  List<Object> get props => [index];
}
