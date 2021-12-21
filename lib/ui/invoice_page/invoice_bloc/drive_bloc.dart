import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habllen/model/invoice.dart';
import 'package:habllen/repository/remote/firestore.dart';
import 'package:habllen/repository/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/transformers.dart';

part 'drive_state.dart';
part 'drive_event.dart';

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
    final files = await _getInvoiceDetailsList(repository);
    emit(state.copywith(listdata: files));
  }

  void _onFilesFetched(FilesFetched event, Emitter<InvoiceState> emit) async {
    if (state.hasReachedMax) emit(state.copywith(hasReachedMax: true));
    try {
      final files = await _getInvoiceDetailsList(repository);
      assert(files.isNotEmpty, "initial fetching files empty");
      emit(state.copywith(
        status: FileFetchStatus.success,
        listdata: files,
        hasReachedMax: true,
      ));
    } on Exception {
      emit(state.copywith(status: FileFetchStatus.failure));
    }
  }
}

EventTransformer<MyEvent> _debounce<MyEvent>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}

Future<List<Invoice>> _getInvoiceDetailsList(Repository repository) async {
  try {
    final list = await repository.getInvoices();
    print(list);

    return list;
  } on Exception catch (e) {
    throw e;
  }
}

// Future<int> _getpdf(AuthenticationRepository authenticationRepository) async {
//   try {
//     Map<String, String> _authHeaders =
//         await authenticationRepository.authHeaders;
//     final DriveApiLocal driveApiLocal =
//         DriveApiLocal(GDriveClient(_authHeaders));
//     String appDocPath;
//     // if (kIsWeb) {
//     //   appDocPath = '~/Document/';
//     // } else if (Platform.isAndroid) {
//     //   var status = await Permission.storage.status;
//     //   if (status.isDenied) {
//     //     await Permission.storage.request();
//     //   }
//     //   Directory? appDocDir = await getExternalStorageDirectory();
//     //   appDocPath = appDocDir!.path;
//     // } else {
//     //   appDocPath = "";
//     // }
//     appDocPath = '/';
//     print(appDocPath);
//     final Stream<List<int>> pdfData =
//         await driveApiLocal.getInvoicePDFFromDrive("100001", appDocPath);
//     final file = File('$appDocPath/100001.pdf');
//     List<int> data = [];
//     pdfData.listen((event) {
//       data += event;
//       print('main : $event');
//     }, onDone: () {
//       file.writeAsBytes(data);
//       print('saving pdf done');
//     });
//     return 0;
//   } on Exception catch (e) {
//     throw Exception(e);
//   }
// }
