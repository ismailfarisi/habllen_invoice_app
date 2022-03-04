part of 'hometab_bloc.dart';

abstract class HometabEvent extends Equatable {
  const HometabEvent();

  @override
  List<Object> get props => [];
}

class TabChanged extends HometabEvent {
  TabChanged(this.tab);
  final HomeTab tab;

  @override
  List<Object> get props => [tab];
}
