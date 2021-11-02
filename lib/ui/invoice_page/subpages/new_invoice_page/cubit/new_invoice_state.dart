part of 'new_invoice_Bloc.dart';

class ScreenStage extends Equatable {
  final int currentIndex;
  final List<Company> companylist;
  final List<Product> productList;
  final List<InvoiceProduct> invoiceProductList;
  final Invoice? invoice;
  final Company? company;
  final DateTime? date;

  const ScreenStage(
      {this.invoiceProductList = const [],
      this.company,
      this.date,
      this.companylist = const [],
      this.currentIndex = 0,
      this.productList = const [],
      this.invoice});
  @override
  List<Object?> get props => [
        currentIndex,
        productList,
        companylist,
        company,
        date,
        invoice,
        invoiceProductList
      ];

  ScreenStage copywith(
      {int? currentIndex,
      List<Company>? companylist,
      List<Product>? productList,
      List<InvoiceProduct>? invoiceProductList,
      Invoice? invoice,
      Company? company,
      DateTime? date}) {
    return ScreenStage(
        company: company ?? this.company,
        date: date ?? this.date,
        invoice: invoice ?? this.invoice,
        invoiceProductList: invoiceProductList ?? this.invoiceProductList,
        companylist: companylist ?? this.companylist,
        currentIndex: currentIndex ?? this.currentIndex,
        productList: productList ?? this.productList);
  }
}
