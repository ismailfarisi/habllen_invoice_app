part of 'new_invoice_Bloc.dart';

enum Status { initial, success, failure }

class NewInvoiceState extends Equatable {
  final int currentIndex;
  final List<Company> companylist;
  final List<Product> productList;
  final List<InvoiceProduct> invoiceProductList;
  final Invoice? invoice;
  final Company? company;
  final DateTime? date;
  final Status status;
  final Status invoiceNoFetchStatus;

  const NewInvoiceState(
      {this.invoiceProductList = const [],
      this.company,
      this.date,
      this.companylist = const [],
      this.currentIndex = 0,
      this.productList = const [],
      this.invoice,
      this.status = Status.initial,
      this.invoiceNoFetchStatus = Status.initial});
  @override
  List<Object?> get props => [
        currentIndex,
        productList,
        companylist,
        company,
        date,
        invoice,
        invoiceProductList,
        status,
        invoiceNoFetchStatus
      ];

  NewInvoiceState copywith(
      {int? currentIndex,
      List<Company>? companylist,
      List<Product>? productList,
      List<InvoiceProduct>? invoiceProductList,
      Invoice? invoice,
      Company? company,
      DateTime? date,
      Status? status,
      Status? invoiceNoFetchStatus}) {
    return NewInvoiceState(
        company: company ?? this.company,
        date: date ?? this.date,
        invoice: invoice ?? this.invoice,
        invoiceProductList: invoiceProductList ?? this.invoiceProductList,
        companylist: companylist ?? this.companylist,
        currentIndex: currentIndex ?? this.currentIndex,
        productList: productList ?? this.productList,
        status: status ?? this.status,
        invoiceNoFetchStatus:
            invoiceNoFetchStatus ?? this.invoiceNoFetchStatus);
  }
}
