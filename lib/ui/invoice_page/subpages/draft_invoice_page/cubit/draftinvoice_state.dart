part of 'draftinvoice_cubit.dart';

enum Status { initial, loading, success, failure }

class DraftinvoiceState extends Equatable {
  const DraftinvoiceState({this.status = Status.initial});

  final Status status;

  @override
  List<Object> get props => [status];

  DraftinvoiceState copyWith({Status? status}) {
    return DraftinvoiceState(status: status ?? this.status);
  }
}
