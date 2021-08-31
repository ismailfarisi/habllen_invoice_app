part of 'new_invoice_Bloc.dart';

class ScreenStage extends Equatable {
  final int currentIndex;

  ScreenStage({this.currentIndex = 1});
  @override
  List<Object?> get props => [currentIndex];

  ScreenStage copywith(int currentIndex) {
    return ScreenStage(currentIndex: currentIndex);
  }
}
