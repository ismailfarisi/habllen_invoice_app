import 'package:equatable/equatable.dart';

class Customer extends Equatable {
  final String? id;
  final String name;
  final String addressOne;
  final String? addressTwo;
  final String gst;
  final double? totalPaymentsReceived;
  final double? totalInvoicesAmount;

  Customer(
      {this.totalPaymentsReceived = 0.0,
      this.totalInvoicesAmount = 0.0,
      this.id,
      required this.name,
      required this.addressOne,
      this.addressTwo,
      required this.gst});

  @override
  List<Object?> get props => [
        id,
        name,
        addressOne,
        addressTwo,
        gst,
        totalPaymentsReceived,
        totalInvoicesAmount
      ];

  factory Customer.fromjson(Map<String, dynamic> json) {
    return Customer(
        id: json["id"],
        name: json["name"].toString().toUpperCase(),
        addressOne: json['addressOne'],
        addressTwo: json['addressTwo'],
        gst: json['gst'],
        totalPaymentsReceived:
            (json['totalPaymentsReceived'] as num?)?.toDouble() ?? 0.0,
        totalInvoicesAmount:
            (json['totalInvoicesAmount'] as num?)?.toDouble() ?? 0.0);
  }
  Map<String, dynamic> toJson() => _companyToJson(this);

  Customer copyWith(
      {String? name,
      String? addressOne,
      String? addressTwo,
      String? gst,
      String? id}) {
    return Customer(
        id: id ?? this.id,
        name: name ?? this.name,
        addressOne: addressOne ?? this.addressOne,
        addressTwo: addressTwo ?? this.addressTwo,
        gst: gst ?? this.gst,
        totalPaymentsReceived: this.totalPaymentsReceived,
        totalInvoicesAmount: this.totalInvoicesAmount);
  }
}

Map<String, dynamic> _companyToJson(Customer company) {
  return <String, dynamic>{
    "id": company.id,
    "name": company.name.toLowerCase(),
    "addressOne": company.addressOne,
    "addressTwo": company.addressTwo,
    "gst": company.gst,
    "totalPaymentsReceived": company.totalPaymentsReceived,
    "totalInvoicesAmount": company.totalInvoicesAmount,
  };
}

extension on Customer {}
