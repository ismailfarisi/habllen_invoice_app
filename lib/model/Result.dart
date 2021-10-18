import 'package:equatable/equatable.dart';

class Result<T> extends Equatable {
  const Result._();
  factory Result.success(T data) => Success(data);
  factory Result.error(Exception e) => Error(e);
  static const loading = const Loading();

  @override
  List<Object?> get props => [];
}

class Success<T> extends Result<T> {
  final T data;

  const Success(this.data) : super._();
  @override
  List<Object?> get props => [data];
}

class Error<T> extends Result<T> {
  final Exception exception;

  Error(this.exception) : super._();
  @override
  List<Object?> get props => [exception];
}

class Loading extends Result {
  const Loading() : super._();
  @override
  List<Object?> get props => [];
}
