import 'dart:async';
<<<<<<< HEAD
import 'dart:io';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/transformers.dart';
import 'package:sales_api/model/invoice_details.dart';
import 'package:sales_api/sales_api.dart';
=======

import 'package:authentication_repository/authentication_repository.dart';
import 'package:drive_api/drive_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/transformers.dart';
>>>>>>> refs/remotes/origin/master

part 'drive_state.dart';
part 'drive_event.dart';

class DriveBloc extends Bloc<DriveEvent, DriveState> {
  DriveBloc(this._authenticationRepository)
      : super(const DriveState(listdata: []));
  final AuthenticationRepository _authenticationRepository;

<<<<<<< HEAD
  Future<List<InvoiceDetails>> getInvoiceDetailsList() async {
    Map<String, String> _authHeaders =
        await _authenticationRepository.authHeaders;
    final DriveApiLocal driveApiLocal =
        DriveApiLocal(GDriveClient(_authHeaders));
    final list = await driveApiLocal.getInvoiceDetailListFromSheets;
    return list;
  }

  Future<int> getpdf() async {
    try {
      Map<String, String> _authHeaders =
          await _authenticationRepository.authHeaders;
      final DriveApiLocal driveApiLocal =
          DriveApiLocal(GDriveClient(_authHeaders));
      String appDocPath;
      if (kIsWeb) {
        appDocPath = '~/Document/';
      } else if (Platform.isAndroid) {
        var status = await Permission.storage.status;
        if (status.isDenied) {
          await Permission.storage.request();
        }
        Directory? appDocDir = await getExternalStorageDirectory();
        appDocPath = appDocDir!.path;
      } else {
        appDocPath = "";
      }
      print(appDocPath);
      final Stream<List<int>> pdfData =
          await driveApiLocal.getInvoicePDFFromDrive("100001", appDocPath);
      final file = File('$appDocPath/100001.pdf');
      List<int> data = [];
      pdfData.listen((event) {
        data += event;
        print('main : $event');
      }, onDone: () {
        file.writeAsBytes(data);
        print('saving pdf done');
      });
      return 0;
    } on Exception catch (e) {
      throw Exception(e);
    }
=======
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
>>>>>>> refs/remotes/origin/master
  }

  @override
  Stream<DriveState> mapEventToState(DriveEvent event) async* {
    if (event is FilesFetched) {
      yield await _mapPostFetchedToState(state);
    }
    if (event is KeywordChanged) {
      print("key word changed: ${event.keyword}");
<<<<<<< HEAD
      final files = await getInvoiceDetailsList();
      yield state.copywith(listdata: files);
    }
    if (event is CreateNewInvoicwBtnPressed) {
      await getpdf();
      yield state.copywith();
=======
      final files = await getFiles(null, event.keyword);
      yield state.copywith(listdata: files.list);
>>>>>>> refs/remotes/origin/master
    }
  }

  Future<DriveState> _mapPostFetchedToState(DriveState state) async {
    if (state.hasReachedMax) return state.copywith(hasReachedMax: true);
    try {
<<<<<<< HEAD
      final files = await getInvoiceDetailsList();
      assert(files.isNotEmpty, "initial fetching files empty");
      return state.copywith(
        status: FileFetchStatus.success,
        listdata: files,
        hasReachedMax: true,
      );
=======
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
>>>>>>> refs/remotes/origin/master
    } on Exception {
      return state.copywith(status: FileFetchStatus.failure);
    }
  }

<<<<<<< HEAD
=======
  // @override
  // Future<void> close() {
  //   keywordStream.close();
  //   return super.close();
  // }
>>>>>>> refs/remotes/origin/master
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
