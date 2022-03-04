part of 'hometab_bloc.dart';

enum HomeTab { Invoice, Customer, Product }

class HometabState extends Equatable {
  const HometabState({this.currentTab = HomeTab.Invoice});

  final HomeTab currentTab;

  @override
  List<Object> get props => [currentTab];

  HometabState copyWith({currentTab}) {
    return HometabState(currentTab: currentTab ?? this.currentTab);
  }
}
