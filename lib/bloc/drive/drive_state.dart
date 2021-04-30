import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:googleapis/androiddeviceprovisioning/v1.dart';

class DriveState extends Equatable{
  const DriveState({this.status});

  final status;
  @override
  List<Object?> get props => [status];
}