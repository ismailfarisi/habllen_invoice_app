import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habllen/model/invoice.dart';
import 'package:habllen/repository/repository.dart';

part 'draftinvoice_state.dart';

class DraftinvoiceCubit extends Cubit<DraftinvoiceState> {
  DraftinvoiceCubit({required this.repository}) : super(DraftinvoiceState());

  final Repository repository;

  void postInvoice(Invoice invoice) async {
    emit(state.copyWith(status: Status.loading));
    try {
      await repository.createInvoice(invoice);

      emit(state.copyWith(status: Status.success));
    } on Exception {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
