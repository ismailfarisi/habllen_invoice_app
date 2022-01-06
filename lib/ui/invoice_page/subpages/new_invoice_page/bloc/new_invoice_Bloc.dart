import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habllen/model/company.dart';
import 'package:habllen/model/invoice.dart';
import 'package:habllen/model/invoice_product.dart';
import 'package:habllen/model/product.dart';
import 'package:habllen/repository/repository.dart';

part 'new_invoice_event.dart';
part 'new_invoice_state.dart';

class NewInvoiceBloc extends Bloc<NewInvoiceEvent, NewInvoiceState> {
  NewInvoiceBloc(this.repository) : super(NewInvoiceState()) {
    on<ProductAddedToInvoice>(_onProductAddedToInvoice);
    on<FetchProducts>(_onFetchProducts);
    on<FetchCompanies>(_onFetchCompanies);
    on<OnStepContinue>(onOnStepContinue);
    on<CompanySelected>(_onCompanySelected);
    on<DateSelected>(_onDateSelected);
    on<CreateDraftInvoice>(_onCreateDraftInvoice);
  }

  final Repository repository;

  FutureOr<void> _onProductAddedToInvoice(
      ProductAddedToInvoice event, Emitter<NewInvoiceState> emit) {
    final ep = event.invoiceProduct;
    final double price = (ep.price == null) ? ep.product.price : ep.price!;
    final totalPrice = price * ep.quantity;
    final ip = InvoiceProduct(
        quantity: ep.quantity,
        product: ep.product,
        price: price,
        totalPrice: totalPrice);

    final list = List.of(state.invoiceProductList)..add(ip);

    emit(state.copywith(invoiceProductList: list));
  }

  FutureOr<void> _onFetchProducts(
      FetchProducts event, Emitter<NewInvoiceState> emit) async {
    final result = await repository.getProducts();
    result.when(
        success: (data) => emit(state.copywith(productList: data)),
        error: (e) => emit(state.copywith(status: Status.failure)));
  }

  FutureOr<void> _onFetchCompanies(
      FetchCompanies event, Emitter<NewInvoiceState> emit) async {
    final result = await repository.getCustomers();
    result.when(
        success: (data) => emit(state.copywith(companylist: data)),
        error: (e) => emit(state.copywith(status: Status.failure)));
  }

  FutureOr<void> onOnStepContinue(
      OnStepContinue event, Emitter<NewInvoiceState> emit) {
    final index = (event.step != null)
        ? ((event.step! < state.currentIndex) ? event.step : state.currentIndex)
        : state.currentIndex + 1;
    emit(state.copywith(currentIndex: index));
  }

  FutureOr<void> _onCompanySelected(
      CompanySelected event, Emitter<NewInvoiceState> emit) {
    emit(state.copywith(company: event.company));
  }

  FutureOr<void> _onDateSelected(
      DateSelected event, Emitter<NewInvoiceState> emit) {
    emit(state.copywith(date: event.date));
  }

  FutureOr<void> _onCreateDraftInvoice(
      CreateDraftInvoice event, Emitter<NewInvoiceState> emit) async {
    final lastInvoiceNoResult = await repository.getLastInvoiceNo();
    int invoiceNo = 0;
    lastInvoiceNoResult.when(
        success: (number) {
          invoiceNo = number + 1;
          emit(state.copywith(invoiceNoFetchStatus: Status.success));
        },
        error: (e) =>
            emit(state.copywith(invoiceNoFetchStatus: Status.failure)));

    final Company? company = state.company;
    final DateTime? date = state.date;
    if (state.invoiceProductList.isNotEmpty &&
        state.invoiceNoFetchStatus == Status.success &&
        company != null &&
        date != null) {
      final invoiceProducts = state.invoiceProductList;
      final isIGST = checkIsIGST(company.gst);
      final double price = calcPrice(invoiceProducts);
      final double iGST = calcIGST(isIGST, price);
      final double cGST = calcCSGST(isIGST, price);
      final double sGST = calcCSGST(isIGST, price);
      final double totalPriceNotRounded = price + iGST + cGST + sGST;
      final double totalPrice =
          double.parse(totalPriceNotRounded.toStringAsFixed(2));

      final invoice = Invoice(
          invoiceNo: invoiceNo,
          company: company,
          date: date,
          product: invoiceProducts,
          price: price,
          iGST: iGST,
          cGST: cGST,
          sGST: sGST,
          totalPrice: totalPrice,
          paymentStatus: PaymentStatus.open);
      print(invoice);
      emit(state.copywith(invoice: invoice));
    }
  }
}

double calcCSGST(bool isIGST, double price) {
  if (!isIGST) {
    final csgst = price * 0.06;
    return double.parse(csgst.toStringAsFixed(2));
  } else {
    return 0;
  }
}

double calcPrice(List<InvoiceProduct> invoiceProducts) {
  double price = 0;
  for (var invoiceProduct in invoiceProducts) {
    price += invoiceProduct.totalPrice!;
  }
  return double.parse(price.toStringAsFixed(2));
}

double calcIGST(bool isIGST, double price) {
  if (isIGST) {
    final igst = price * 0.12;
    return double.parse(igst.toStringAsFixed(2));
  } else {
    return 0;
  }
}

bool checkIsIGST(String gst) {
  return (gst.substring(1, 2) != "32") ? true : false;
}
