part of 'invoicepage_bloc.dart';

class InvoiceEvent extends Equatable {
  const InvoiceEvent();

  @override
  List<Object?> get props => [];
}

class FilesFetched extends InvoiceEvent {}

class LoadMore extends InvoiceEvent {}
