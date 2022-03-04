part of 'new_invoice_Bloc.dart';

enum Status { initial, loading, success, failure }

class NewInvoiceState extends Equatable {
  final Status createInvoiceStatus;

  const NewInvoiceState({this.createInvoiceStatus = Status.initial});
  @override
  List<Object?> get props => [createInvoiceStatus];

  NewInvoiceState copywith({Status? createInvoiceStatus}) {
    return NewInvoiceState(
        createInvoiceStatus: createInvoiceStatus ?? this.createInvoiceStatus);
  }
}
