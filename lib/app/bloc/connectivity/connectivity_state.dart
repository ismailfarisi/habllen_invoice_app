part of 'connectivity_bloc.dart';

class ConnectivityState extends Equatable {
  const ConnectivityState({this.hasConnection = false});

  final bool hasConnection;

  @override
  List<Object> get props => [hasConnection];

  ConnectivityState copyWith({bool? hasConnection}) {
    return ConnectivityState(
        hasConnection: hasConnection ?? this.hasConnection);
  }
}
