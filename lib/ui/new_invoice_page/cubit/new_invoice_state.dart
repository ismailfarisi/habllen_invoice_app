part of 'new_invoice_cubit.dart';

enum ScreenStage { stage1, stage2, stage3 }

class NewInvoiceState extends Equatable {
  const NewInvoiceState({this.screenStage = ScreenStage.stage1});

  final ScreenStage screenStage;

  @override
  List<Object> get props => [screenStage];
}
