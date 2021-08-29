import 'dart:async';
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

part 'drive_state.dart';
part 'drive_event.dart';

class DriveBloc extends Bloc<DriveEvent, DriveState> {
  DriveBloc(this._authenticationRepository)
      : super(const DriveState(listdata: []));
  final AuthenticationRepository _authenticationRepository;

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
  }

  @override
  Stream<DriveState> mapEventToState(DriveEvent event) async* {
    if (event is FilesFetched) {
      yield await _mapPostFetchedToState(state);
    }
    if (event is KeywordChanged) {
      print("key word changed: ${event.keyword}");
      final files = await getInvoiceDetailsList();
      yield state.copywith(listdata: files);
    }
    if (event is CreateNewInvoicwBtnPressed) {
      await getpdf();
      yield state.copywith();
    }
  }

  Future<DriveState> _mapPostFetchedToState(DriveState state) async {
    if (state.hasReachedMax) return state.copywith(hasReachedMax: true);
    try {
      final files = await getInvoiceDetailsList();
      assert(files.isNotEmpty, "initial fetching files empty");
      return state.copywith(
        status: FileFetchStatus.success,
        listdata: files,
        hasReachedMax: true,
      );
    } on Exception {
      return state.copywith(status: FileFetchStatus.failure);
    }
  }

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
