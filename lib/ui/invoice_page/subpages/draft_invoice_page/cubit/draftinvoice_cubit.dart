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
    final String id = await repository.createInvoice(invoice);
    if (id != null) {
      emit(state.copyWith(status: Status.success));
    } else
      emit(state.copyWith(status: Status.failure));
  }
}
