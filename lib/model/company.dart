import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Company extends Equatable {
  final int? id;
  final String name;
  final String addressOne;
  final String? addressTwo;
  final String gst;

  Company(
      {this.id,
      required this.name,
      required this.addressOne,
      this.addressTwo,
      required this.gst});

  @override
  List<Object?> get props => [id, name, addressOne, addressTwo, gst];

  factory Company.fromjson(Map<String, dynamic> json) {
    return Company(
        id: json["id"],
        name: json["companyName"],
        addressOne: json['companyAdd1'],
        addressTwo: json['companyAdd2'],
        gst: json['gstIn']);
  }
  Map<String, dynamic> toJson() => _companyToJson(this);
}

Map<String, dynamic> _companyToJson(Company company) {
  return <String, dynamic>{
    "id": company.id,
    "name": company.name,
    "addressOne": company.addressOne,
    "addressTwo": company.addressTwo,
    "gst": company.gst
  };
}

extension on Company {}
