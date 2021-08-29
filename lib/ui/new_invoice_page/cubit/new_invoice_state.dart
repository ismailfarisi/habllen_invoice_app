part of 'new_invoice_Bloc.dart';

enum ScreenStage { stage1, stage2, stage3 }

class NewInvoiceState extends Equatable {
  const NewInvoiceState._({this.screenStage = ScreenStage.stage1});

  const NewInvoiceState.stage1() : this._();
  const NewInvoiceState.stage2() : this._(screenStage: ScreenStage.stage2);
  const NewInvoiceState.stage3() : this._(screenStage: ScreenStage.stage3);

  final ScreenStage screenStage;

  @override
  List<Object> get props => [screenStage];
}
