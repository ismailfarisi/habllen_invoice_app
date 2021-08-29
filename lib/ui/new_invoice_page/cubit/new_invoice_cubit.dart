import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'new_invoice_state.dart';

class NewInvoiceCubit extends Cubit<NewInvoiceState> {
  NewInvoiceCubit() : super(NewInvoiceState());
}
