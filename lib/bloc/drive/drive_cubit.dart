import 'package:authentication_repository/authentication_repository.dart';
import 'package:drive_api/drive_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'drive_state.dart';

class DriveCubit extends Cubit<DriveState> {
  DriveCubit(this._authenticationRepository) : super(const DriveState());
  final AuthenticationRepository _authenticationRepository;

  void getFiles() async {
    Map<String, String> _authHeaders =
        await _authenticationRepository.authHeaders;
    final DriveApiLocal driveApiLocal = DriveApiLocal(_authHeaders);
    await driveApiLocal.listInvoiceFromDrive();
  }
}
