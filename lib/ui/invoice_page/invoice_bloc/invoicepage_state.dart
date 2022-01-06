part of 'invoicepage_bloc.dart';

enum FileFetchStatus { initial, success, failure }

class InvoiceState extends Equatable {
  const InvoiceState(
      {this.nextPageToken = 'initial',
      this.hasReachedMax = false,
      this.listdata = const <Invoice>[],
      this.status = FileFetchStatus.initial});
  final FileFetchStatus status;
  final List<Invoice> listdata;
  final String? nextPageToken;
  final bool hasReachedMax;
  @override
  List<Object?> get props => [status, listdata, nextPageToken, hasReachedMax];

  InvoiceState copywith(
      {List<Invoice>? listdata,
      bool? hasReachedMax,
      FileFetchStatus? status,
      String? nextPageToken}) {
    return InvoiceState(
        listdata: listdata ?? this.listdata,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        status: status ?? this.status,
        nextPageToken: nextPageToken ?? this.nextPageToken);
  }
}
