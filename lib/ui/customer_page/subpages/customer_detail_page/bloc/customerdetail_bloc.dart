import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habllen/model/customer.dart';
import 'package:habllen/model/invoice.dart';
import 'package:habllen/model/payment.dart';
import 'package:habllen/repository/repository.dart';

part 'customerdetail_event.dart';
part 'customerdetail_state.dart';
part 'customerdetail_bloc.freezed.dart';

const int INVOICE_TAB = 0;
const int PAYMENT_TAB = 1;

class CustomerDetailBloc
    extends Bloc<CustomerDetailEvent, CustomerDetailState> {
  CustomerDetailBloc({required this.repository, required this.company})
      : super(CustomerDetailState.initial(company)) {
    on<_FetchInvoiceList>(_onFetchInvoiceList);
    on<_FetchPaymentList>(_onFetchPaymentList);
    on<_TabChanged>(_onTabChanged);
    on<_FilterModeChanged>(_onFilterModeChanged);
    on<_Started>(_onStarted);
  }

  final Repository repository;
  final Customer company;

  FutureOr<void> _onFetchInvoiceList(
      _FetchInvoiceList event, Emitter<CustomerDetailState> emit) async {
    emit(state.copyWith(invoiceListFetchStatus: Status.loading));
    try {
      final dateRange = state.dateRange;
      if (state.companyId != null) {
        final result =
            await repository.getCompanyInvoice(state.companyId!, dateRange);
        result.when(success: (invoices) {
          emit(state.copyWith(
              invoiceList: invoices, invoiceListFetchStatus: Status.success));
        }, error: (e) {
          print("error: $e");
        });
      }
    } on Exception {}
  }

  FutureOr<void> _onTabChanged(event, Emitter<CustomerDetailState> emit) {
    emit(state.copyWith(tab: event.index));
    if (event.index == INVOICE_TAB) {
      if (state.invoiceListFetchStatus == Status.initial) {
        add(CustomerDetailEvent.fetchInvoiceList());
      }
    }
    if (event.index == PAYMENT_TAB) {
      if (state.paymentListFetchStatus == Status.initial) {
        add(CustomerDetailEvent.fetchPaymentList());
      }
    }
  }

  FutureOr<void> _onFetchPaymentList(
      _FetchPaymentList event, Emitter<CustomerDetailState> emit) async {
    emit(state.copyWith(paymentListFetchStatus: Status.loading));
    final result = await repository.getCompanyPayments(state.companyId!);
    result.when(success: (payments) {
      emit(state.copyWith(
          paymentList: payments, paymentListFetchStatus: Status.success));
    }, error: (e) {
      print("error: $e");
    });
  }

  FutureOr<void> _onFilterModeChanged(
      _FilterModeChanged event, Emitter<CustomerDetailState> emit) async {
    DateTimeRange dateRange;
    Status invoiceListFetchStatus = Status.loading;
    Status paymentListFetchStatus = Status.loading;
    List<Invoice>? invoiceList;
    List<Payment>? paymentList;

    switch (event.mode) {
      case FilterMode.lastMonth:
        dateRange = DateTimeRange(
            start: DateTime.now().subtract(Duration(days: 30)),
            end: DateTime.now());
        break;
      case FilterMode.lastThreeMonths:
        dateRange = DateTimeRange(
            start: DateTime.now().subtract(Duration(days: 90)),
            end: DateTime.now());
        break;
      case FilterMode.lastYear:
        dateRange = DateTimeRange(
            start: DateTime.now().subtract(Duration(days: 365)),
            end: DateTime.now());
        break;
      case FilterMode.custom:
        dateRange = event.dateRange!;
        break;
    }
    emit(state.copyWith(
        dateRange: dateRange,
        invoiceListFetchStatus: invoiceListFetchStatus,
        paymentListFetchStatus: paymentListFetchStatus,
        filterMode: event.mode));
    final invoieResult =
        await repository.getCompanyInvoice(state.companyId!, dateRange);
    final paymentResult = await repository.getCompanyPayments(state.companyId!);
    invoieResult.when(success: (invoices) {
      invoiceList = invoices;
      invoiceListFetchStatus = Status.success;
    }, error: (e) {
      invoiceListFetchStatus = Status.failed;
    });
    paymentResult.when(success: (payments) {
      paymentList = payments;
      paymentListFetchStatus = Status.success;
    }, error: (e) {
      paymentListFetchStatus = Status.failed;
    });
    emit(state.copyWith(
        invoiceList: invoiceList ?? state.invoiceList,
        invoiceListFetchStatus: invoiceListFetchStatus,
        paymentList: paymentList ?? state.paymentList,
        paymentListFetchStatus: paymentListFetchStatus));
  }

  FutureOr<void> _onStarted(_Started event, Emitter<CustomerDetailState> emit) {
    add(CustomerDetailEvent.fetchInvoiceList());
    add(CustomerDetailEvent.fetchPaymentList());
  }
}
