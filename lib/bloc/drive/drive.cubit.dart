import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habllen/bloc/drive/drive_state.dart';

class DriveCubit extends Cubit<DriveState>{
  DriveCubit(this._authenticationRepository, this._driveApi) : super(const DriveState());
  final AuthenticationRepository _authenticationRepository;
  final DriveApi _driveApi;
}