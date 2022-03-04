import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habllen/model/company.dart';
import 'package:habllen/model/invoice.dart';
import 'package:habllen/model/invoice_product.dart';
import 'package:habllen/shared/forms_validator/validator.dart';

part 'invoice_detail_event.dart';
part 'invoice_detail_state.dart';
part 'invoice_detail_bloc.freezed.dart';

class InvoiceDetailBloc extends Bloc<InvoiceDetailEvent, InvoiceDetailState> {
  InvoiceDetailBloc({Invoice? invoice})
      : super(InvoiceDetailState.initial(invoice)) {
    on<_DateChanged>(_dateChanged);
    on<_CompanyAdded>(_companyAdded);
    on<_NewProductAdded>(_newProductAdded);
    on<_ProductEdited>(_productEdited);
    on<_ProductDeleted>(_productDeleted);
  }

  FutureOr<void> _dateChanged(
      _DateChanged event, Emitter<InvoiceDetailState> emit) {
    final date = event.date;
    final invoice = state.inputInvoice.value.changeDate(date: date);
    final inputInvoice = InputInvoice.dirty(invoice);
    emit(state.copyWith(
        inputInvoice: inputInvoice,
        invoiceStatus: Formz.validate([inputInvoice])));
  }

  FutureOr<void> _companyAdded(
      _CompanyAdded event, Emitter<InvoiceDetailState> emit) {
    final company = event.company;
    final invoice = state.inputInvoice.value.addCustomer(company: company);
    final inputInvoice = InputInvoice.dirty(invoice);
    emit(state.copyWith(
        inputInvoice: inputInvoice,
        invoiceStatus: Formz.validate([inputInvoice])));
  }

  FutureOr<void> _newProductAdded(
      _NewProductAdded event, Emitter<InvoiceDetailState> emit) {
    final invoiceProduct = event.product;
    final invoice =
        state.inputInvoice.value.addProduct(product: invoiceProduct);
    final inputInvoice = InputInvoice.dirty(invoice);
    emit(state.copyWith(
        inputInvoice: inputInvoice,
        invoiceStatus: Formz.validate([inputInvoice])));
  }

  FutureOr<void> _productEdited(
      _ProductEdited event, Emitter<InvoiceDetailState> emit) {
    final invoiceProduct = event.product;
    final invoice =
        state.inputInvoice.value.editProduct(product: invoiceProduct);
    final inputInvoice = InputInvoice.dirty(invoice);
    emit(state.copyWith(
        inputInvoice: inputInvoice,
        invoiceStatus: Formz.validate([inputInvoice])));
  }

  FutureOr<void> _productDeleted(
      _ProductDeleted event, Emitter<InvoiceDetailState> emit) {
    final invoiceProduct = event.product;
    final invoice =
        state.inputInvoice.value.deleteProduct(product: invoiceProduct);
    final inputInvoice = InputInvoice.dirty(invoice);
    emit(state.copyWith(
        inputInvoice: inputInvoice,
        invoiceStatus: Formz.validate([inputInvoice])));
  }
}
