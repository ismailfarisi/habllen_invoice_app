part of 'new_invoice_Bloc.dart';

class ScreenStage extends Equatable {
  final int currentIndex;
  final List<Company> companylist;

  ScreenStage({this.companylist = const [], this.currentIndex = 0});
  @override
  List<Object?> get props => [currentIndex];

  ScreenStage copywith({int? currentIndex, List<Company>? companylist}) {
    return ScreenStage(
        companylist: companylist ?? this.companylist,
        currentIndex: currentIndex ?? this.currentIndex);
  }
}
