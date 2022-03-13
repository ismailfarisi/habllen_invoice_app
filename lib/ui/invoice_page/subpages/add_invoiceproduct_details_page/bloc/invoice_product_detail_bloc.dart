import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habllen/model/invoice_product.dart';
import 'package:habllen/model/product.dart';
import 'package:habllen/shared/forms_validator/validator.dart';
import 'package:habllen/ui/invoice_page/subpages/add_invoice_product_dialog/bloc/addinvoiceproductform_bloc.dart';

part 'invoice_product_detail_state.dart';
part 'invoice_product_detail_event.dart';
part 'invoice_product_detail_bloc.freezed.dart';

class InvoiceProductDetailBloc
    extends Bloc<InvoiceProductDetailEvent, InvoiceProductDetailState> {
  InvoiceProductDetailBloc(
      {this.addinvoiceproductformBloc, this.invoiceProduct})
      : super(InvoiceProductDetailState.initial(
            invoiceProduct, addinvoiceproductformBloc)) {
    on<_QuantityChanged>(_onQuantityChanged);
    on<_PriceChanged>(_onPriceChanged);
    on<_SaveInvoiceProductDetail>(_onSaveInvoiceProduct);
    if (invoiceProduct != null) {}
  }
  final AddinvoiceproductformBloc? addinvoiceproductformBloc;
  final InvoiceProduct? invoiceProduct;
  FutureOr<void> _onQuantityChanged(
      _QuantityChanged event, Emitter<InvoiceProductDetailState> emit) {
    final quantity = InputAccounts.dirty(double.tryParse(event.quantity));
    emit(state.copyWith(
        quantity: quantity, status: Formz.validate([quantity, state.price])));
  }

  FutureOr<void> _onPriceChanged(
      _PriceChanged event, Emitter<InvoiceProductDetailState> emit) {
    final price = InputAccounts.dirty(double.tryParse(event.price));
    emit(state.copyWith(
        price: price, status: Formz.validate([state.quantity, price])));
  }

  FutureOr<void> _onSaveInvoiceProduct(
      event, Emitter<InvoiceProductDetailState> emit) {
    if (state.status.isValid) {
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
      addinvoiceproductformBloc?.add(InvoiceProductCreated());
    }
  }
}
