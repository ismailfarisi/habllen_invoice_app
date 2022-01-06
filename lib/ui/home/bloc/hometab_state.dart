part of 'hometab_bloc.dart';

class HometabState extends Equatable {
  const HometabState({this.currentIndex = 0});

  final currentIndex;

  @override
  List<Object> get props => [currentIndex];

  HometabState copyWith({currentIndex}) {
    return HometabState(currentIndex: currentIndex);
  }
}
