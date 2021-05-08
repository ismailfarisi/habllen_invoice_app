import 'package:authentication_repository/authentication_repository.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:drive_api/drive_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'drive_state.dart';
part 'drive_event.dart';

class DriveBloc extends Bloc<DriveEvent, DriveState> {
  DriveBloc(this._authenticationRepository)
      : super(const DriveState(listdata: []));
  final AuthenticationRepository _authenticationRepository;

  Future<DriveFile> getFiles([String? nextPageToken]) async {
    Map<String, String> _authHeaders =
        await _authenticationRepository.authHeaders;
    final DriveApiLocal driveApiLocal = DriveApiLocal(_authHeaders);
    DriveFile data = await driveApiLocal.listInvoiceFromDrive(nextPageToken);
    List<DriveFileList> list = data.list;
    assert(list.isNotEmpty, "list is empty");
    return DriveFile(list, data.nextPageToken);
  }

  @override
  Stream<DriveState> mapEventToState(DriveEvent event) async* {
    if (event is FilesFetched) {
      yield await _mapPostFetchedToState(state);
    }
  }

  Future<DriveState> _mapPostFetchedToState(DriveState state) async {
    if (state.hasReachedMax) return state.copywith(hasReachedMax: true);
    try {
      if (state.status == FileFetchStatus.initial) {
        final files = await getFiles();
        assert(files.list.isNotEmpty, "initial fetching files empty");
        return state.copywith(
            status: FileFetchStatus.success,
            listdata: files.list,
            hasReachedMax: false,
            nextPageToken: files.nextPageToken);
      }
      final files = await getFiles(state.nextPageToken);
      return files.list.length < 10
          ? state.copywith(
              hasReachedMax: true,
              status: FileFetchStatus.success,
              listdata: List.of(state.listdata)..addAll(files.list),
            )
          : state.copywith(
              status: FileFetchStatus.success,
              listdata: List.of(state.listdata)..addAll(files.list),
              hasReachedMax: false,
              nextPageToken: files.nextPageToken);
    } on Exception {
      return state.copywith(status: FileFetchStatus.failure);
    }
  }
}
