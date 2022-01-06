import 'package:equatable/equatable.dart';

class Company extends Equatable {
  final String? id;
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
        name: json["name"].toString().toUpperCase(),
        addressOne: json['addressOne'],
        addressTwo: json['addressTwo'],
        gst: json['gst']);
  }
  Map<String, dynamic> toJson({String? id}) => _companyToJson(this, id);

  Company update(
      {String? name, String? addressOne, String? addressTwo, String? gst}) {
    return Company(
        name: name ?? this.name,
        addressOne: addressOne ?? this.addressOne,
        addressTwo: addressTwo ?? this.addressTwo,
        gst: gst ?? this.gst);
  }
}

Map<String, dynamic> _companyToJson(Company company, String? id) {
  return <String, dynamic>{
    "id": id,
    "name": company.name.toLowerCase(),
    "addressOne": company.addressOne,
    "addressTwo": company.addressTwo,
    "gst": company.gst
  };
}

extension on Company {}
