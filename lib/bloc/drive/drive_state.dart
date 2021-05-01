part of 'drive_cubit.dart';

class DriveState extends Equatable {
  const DriveState({this.status});

  final status;
  @override
  List<Object?> get props => [status];
}
