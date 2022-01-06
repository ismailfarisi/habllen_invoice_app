import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habllen/model/invoice.dart';
import 'package:habllen/model/result.dart';
import 'package:habllen/repository/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/transformers.dart';

part 'invoicepage_state.dart';
part 'invoicepage_event.dart';

class InvoiceBloc extends Bloc<InvoiceEvent, InvoiceState> {
  InvoiceBloc({required this.repository})
      : super(const InvoiceState(listdata: [])) {
    on<KeywordChanged>(_onKeywordChanged);
    on<FilesFetched>(_onFilesFetched,
        transformer: _debounce(Duration(milliseconds: 400)));
  }
  final Repository repository;

  void _onKeywordChanged(
      KeywordChanged event, Emitter<InvoiceState> emit) async {
    final result =
        await _getSearchInvoiceDetailsList(repository, event.keyword);
    result.when(
        success: (data) => emit(state.copywith(listdata: data)),
        error: (e) => emit(state.copywith(status: FileFetchStatus.failure)));
  }

  void _onFilesFetched(FilesFetched event, Emitter<InvoiceState> emit) async {
    if (state.hasReachedMax) emit(state.copywith(hasReachedMax: true));
    try {
      final result = await _getInvoiceDetailsList(repository);
      result.when(
          success: (data) => emit(state.copywith(
                status: FileFetchStatus.success,
                listdata: data,
                hasReachedMax: true,
              )),
          error: (e) => emit(state.copywith(status: FileFetchStatus.failure)));
    } on Exception {
      emit(state.copywith(status: FileFetchStatus.failure));
    }
  }
}

Future<Result<List<Invoice>>> _getSearchInvoiceDetailsList(
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

Future<Result<List<Invoice>>> _getInvoiceDetailsList(
    Repository repository) async {
  try {
    final result = await repository.getInvoices();

    return result;
  } on Exception catch (e) {
    throw e;
  }
}
