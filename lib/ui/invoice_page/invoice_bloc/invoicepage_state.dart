part of 'invoicepage_bloc.dart';

enum FileFetchStatus { initial, loading, success, failure }

class InvoiceState extends Equatable {
  const InvoiceState(
      {this.lastDocument,
      this.hasReachedMax = false,
      this.listdata = const <Invoice>[],
      this.status = FileFetchStatus.initial});
  final FileFetchStatus status;
  final List<Invoice> listdata;

  final bool hasReachedMax;
  final QueryDocumentSnapshot? lastDocument;
  @override
  List<Object?> get props => [status, listdata, hasReachedMax, lastDocument];

  InvoiceState copywith(
      {List<Invoice>? listdata,
      bool? hasReachedMax,
      FileFetchStatus? status,
      QueryDocumentSnapshot? lastDocument}) {
    return InvoiceState(
        listdata: listdata ?? this.listdata,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        status: status ?? this.status,
        lastDocument: lastDocument ?? this.lastDocument);
  }
}
