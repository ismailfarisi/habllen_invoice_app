import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habllen/model/firestore_failure.dart';
import 'package:habllen/model/invoice.dart';
import 'package:habllen/model/result.dart';
import 'package:habllen/repository/remote/firestore.dart';
import 'package:habllen/repository/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/transformers.dart';

part 'invoicepage_state.dart';
part 'invoicepage_event.dart';

class InvoiceBloc extends Bloc<InvoiceEvent, InvoiceState> {
  InvoiceBloc({required this.repository})
      : super(const InvoiceState(listdata: [])) {
    on<LoadMore>(_loadMore);
    on<FilesFetched>(_onFilesFetched,
        transformer: _debounce(Duration(milliseconds: 400)));
  }
  final Repository repository;

  void _onFilesFetched(FilesFetched event, Emitter<InvoiceState> emit) async {
    if (state.hasReachedMax) emit(state.copywith(hasReachedMax: true));
    try {
      final result = await _getInvoiceDetailsList(repository);
      result.when(
          success: (data) => emit(state.copywith(
                status: FileFetchStatus.success,
                listdata: data.data,
                hasReachedMax: data.hasReachedMax,
                lastDocument: data.lastDocument,
              )),
          error: (e) => emit(state.copywith(status: FileFetchStatus.failure)));
    } on Exception {
      emit(state.copywith(status: FileFetchStatus.failure));
    }
  }

  FutureOr<void> _loadMore(LoadMore event, Emitter<InvoiceState> emit) async {
    if (state.hasReachedMax || state.status == FileFetchStatus.loading)
      return null;
    emit(state.copywith(status: FileFetchStatus.loading));
    await _getInvoiceDetailsList(repository, state.lastDocument).then((result) {
      result.when(
          success: (data) {
            final List<Invoice> listdata = List.from(state.listdata)
              ..addAll(data.data);
            emit(state.copywith(
              status: FileFetchStatus.success,
              listdata: listdata,
              hasReachedMax: data.hasReachedMax,
              lastDocument: data.lastDocument,
            ));
          },
          error: (e) => emit(state.copywith(status: FileFetchStatus.failure)));
    });
    return null;
  }

  Future<Result<FireStoreGetResult<Invoice>, FirestoreFailure>>
      _getInvoiceDetailsList(Repository repository,
          [QueryDocumentSnapshot? lastDocument]) async {
    try {
      final result = await repository.getInvoices(lastDocument);

      return result;
    } on Exception catch (e) {
      throw e;
    }
  }
}

Future<Result<List<Invoice>, FirestoreFailure>> _getSearchInvoiceDetailsList(
    Repository repository, String keyword) async {
  try {
    final result = await repository.getSearchInvoice(keyword);
    return result;
  } on Exception catch (e) {
    throw e;
  }
}

EventTransformer<MyEvent> _debounce<MyEvent>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
