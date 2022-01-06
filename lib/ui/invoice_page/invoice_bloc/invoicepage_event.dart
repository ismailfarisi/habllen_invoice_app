part of 'invoicepage_bloc.dart';

class InvoiceEvent extends Equatable {
  const InvoiceEvent();

  @override
  List<Object?> get props => [];
}

class FilesFetched extends InvoiceEvent {}

class CreateNewInvoicwBtnPressed extends InvoiceEvent {}

class KeywordChanged extends InvoiceEvent {
  final String keyword;

  const KeywordChanged(this.keyword);

  @override
  List<Object?> get props => [keyword];
}
