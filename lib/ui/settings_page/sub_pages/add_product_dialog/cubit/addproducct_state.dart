part of 'addproducct_cubit.dart';

enum Status { initial, loading, success, failed }

class AddproducctState extends Equatable {
  const AddproducctState({this.status = Status.initial});

  final Status status;

  @override
  List<Object> get props => [status];

  AddproducctState copyWith({Status? status}) {
    return AddproducctState(status: status ?? this.status);
  }
}
