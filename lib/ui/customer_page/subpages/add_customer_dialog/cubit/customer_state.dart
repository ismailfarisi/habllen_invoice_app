part of 'customer_cubit.dart';

enum Status { initial, loading, success, failure }

class CustomerState extends Equatable {
  const CustomerState._({required this.status});

  final Status status;
  const CustomerState.initial() : this._(status: Status.initial);
  const CustomerState.loading() : this._(status: Status.loading);
  const CustomerState.success() : this._(status: Status.success);
  const CustomerState.failure() : this._(status: Status.failure);

  @override
  List<Object> get props => [status];
}
