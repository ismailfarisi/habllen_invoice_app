import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habllen/model/company.dart';
import 'package:habllen/model/invoice.dart';
import 'package:habllen/model/invoice_product.dart';
import 'package:habllen/model/product.dart';
import 'package:habllen/repository/repository.dart';

part 'new_invoice_event.dart';
part 'new_invoice_state.dart';

class NewInvoiceBloc extends Bloc<NewInvoiceEvent, ScreenStage> {
  NewInvoiceBloc(this.repository) : super(ScreenStage());

  static const MAX_STEPPER_INDEX = 2;

  final Repository repository;

  @override
  Stream<ScreenStage> mapEventToState(event) async* {
    ;
    List<InvoiceProduct> list;
    if (state.invoiceProductList.isEmpty) {
      list = [];
    }
    if (event is ProductAddedToInvoice) {
      final ep = event.invoiceProduct;
      final double price = (ep.price == null) ? ep.product.price : ep.price!;
      final totalPrice = price * ep.quantity;
      final ip = InvoiceProduct(
          quantity: ep.quantity,
          product: ep.product,
          price: price,
          totalPrice: totalPrice);

      list = List.of(state.invoiceProductList)..add(ip);

      yield state.copywith(invoiceProductList: list);
    }
    if (event is FetchProducts) {
      final products = await repository.getProducts();
      print(products);
      yield state.copywith(productList: products);
    }
    if (event is FirstStarted) {
      final customers = await repository.getCustomers();
      print(customers);
      yield state.copywith(companylist: customers);
    }
    if (event is OnStepContinue) {
      yield state.copywith(
          currentIndex: (event.step != null)
              ? (event.step! < state.currentIndex)
                  ? event.step
                  : state.currentIndex
              : state.currentIndex + 1);
    }
    if (event is CreateDraftInvoice) {
      final Company? company = state.company;
      final DateTime? date = state.date;
      print("create draft invoice $company $date");
      if (state.invoiceProductList.isNotEmpty &&
          company != null &&
          date != null) {
        final lastInvoiceNo = await repository.getLastInvoiceNo();
        print("last invoice no :$lastInvoiceNo");
        final int invoiceNo = lastInvoiceNo + 1;
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
        yield state.copywith(invoice: invoice);
      }
    }
    if (event is CompanySelected) {
      yield state.copywith(company: event.company);
    }
    if (event is DateSelected) {
      yield state.copywith(date: event.date);
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
