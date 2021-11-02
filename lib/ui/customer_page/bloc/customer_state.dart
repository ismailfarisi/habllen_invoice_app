part of 'customer_bloc.dart';

enum Status { filesFetched, filesFetchingFailed, loading }

class CustomerState extends Equatable {
  const CustomerState(
      {this.customerList = const [],
      this.status = Status.loading,
      this.hasReachedMax = false});

  final List<Company> customerList;
  final Status status;
  final bool hasReachedMax;
  @override
  List<Object> get props => [customerList, status, hasReachedMax];

  CustomerState copywith(
      {List<Company>? customerList, Status? status, bool? hasReachedMax}) {
    return CustomerState(
        customerList: customerList ?? this.customerList,
        status: status ?? this.status,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }
}

class CustomerInitial extends CustomerState {}
