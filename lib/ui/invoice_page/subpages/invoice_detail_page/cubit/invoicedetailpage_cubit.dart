import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'invoicedetailpage_state.dart';

class InvoicedetailpageCubit extends Cubit<InvoicedetailpageState> {
  InvoicedetailpageCubit() : super(InvoicedetailpageInitial());
}
