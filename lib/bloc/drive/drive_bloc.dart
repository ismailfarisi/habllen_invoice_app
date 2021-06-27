import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/transformers.dart';
import 'package:sales_api/sales_api.dart';

part 'drive_state.dart';
part 'drive_event.dart';

class DriveBloc extends Bloc<DriveEvent, DriveState> {
  DriveBloc(this._authenticationRepository)
      : super(const DriveState(listdata: []));
  final AuthenticationRepository _authenticationRepository;

  // final keywordStream = StreamController<String>();

  Future<DriveFile> getFiles([String? nextPageToken, String? contains]) async {
    Map<String, String> _authHeaders =
        await _authenticationRepository.authHeaders;
    final DriveApiLocal driveApiLocal = DriveApiLocal(_authHeaders);
    DriveFile data =
        await driveApiLocal.listInvoiceFromDrive(nextPageToken, contains);
    List<DriveFileList> list = data.list;
    assert(list.isNotEmpty, "list is empty");
    return DriveFile(list, data.nextPageToken);
  }

  @override
  Stream<DriveState> mapEventToState(DriveEvent event) async* {
    if (event is FilesFetched) {
      yield await _mapPostFetchedToState(state);
    }
    if (event is KeywordChanged) {
      print("key word changed: ${event.keyword}");
      final files = await getFiles(null, event.keyword);
      yield state.copywith(listdata: files.list);
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
      final files = await getFiles(state.nextPageToken, null);
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

  // @override
  // Future<void> close() {
  //   keywordStream.close();
  //   return super.close();
  // }
  @override
  Stream<Transition<DriveEvent, DriveState>> transformEvents(
      Stream<DriveEvent> events, transitionFn) {
    final nonDebounceStreams =
        events.where((event) => event is! KeywordChanged);
    final debounceStream = events
        .where((event) => event is KeywordChanged)
        .debounceTime(Duration(milliseconds: 400));
    return super.transformEvents(
        MergeStream([nonDebounceStreams, debounceStream]), transitionFn);
  }
}
