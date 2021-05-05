import 'package:authentication_repository/authentication_repository.dart';
import 'package:drive_api/drive_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'drive_state.dart';
part 'drive_event.dart';

class DriveBloc extends Bloc<DriveEvent, DriveState> {
  DriveBloc(this._authenticationRepository)
      : super(const DriveState(listdata: []));
  final AuthenticationRepository _authenticationRepository;
  static String? nextPageToken;

  Future<List<DriveFileList>> getFiles() async {
    Map<String, String> _authHeaders =
        await _authenticationRepository.authHeaders;
    final DriveApiLocal driveApiLocal = DriveApiLocal(_authHeaders);
    DriveFile data = await driveApiLocal.listInvoiceFromDrive();
    List<DriveFileList> list = data.list;
    nextPageToken = data.nextPageToken;
    return list;
  }

  @override
  Stream<DriveState> mapEventToState(DriveEvent event) async* {
    if (event is FilesFetched) {
      yield await _mapPostFetchedToState(state);
    }
  }

  Future<DriveState> _mapPostFetchedToState(DriveState state) async {
    if (state.hasReachedMax) return state;
    try {
      if (state.status == FileFetchStatus.initial) {
        final files = await getFiles();
        return state.copywith(
          status: FileFetchStatus.success,
          listdata: files,
          hasReachedMax: false,
        );
      }
      final files = await getFiles();
      return files.isEmpty
          ? state.copywith(hasReachedMax: true)
          : state.copywith(
              status: FileFetchStatus.success,
              listdata: List.of(state.listdata)..addAll(files),
              hasReachedMax: false,
            );
    } on Exception {
      return state.copywith(status: FileFetchStatus.failure);
    }
  }
}
