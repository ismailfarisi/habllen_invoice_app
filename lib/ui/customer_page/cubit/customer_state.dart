part of 'customer_cubit.dart';

abstract class CustomerState extends Equatable {
  const CustomerState();

  @override
  List<Object> get props => [];
}

class InitialState extends CustomerState{}

class Loading extends CustomerState {}

class SubmissionSuccess extends CustomerState {}

class SubmissionFailed extends CustomerState {}
