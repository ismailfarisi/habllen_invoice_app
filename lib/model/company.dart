import 'package:equatable/equatable.dart';

class Company extends Equatable {
  final String companyId;
  final String companyName;
  final String addOne;
  final String addTwo;
  final String gst;

  Company(
      {required this.companyId,
      required this.companyName,
      required this.addOne,
      required this.addTwo,
      required this.gst});

  @override
  List<Object?> get props => [];

  factory Company.fromjson(Map<String, dynamic> json) {
    return Company(
        companyId: json["id"],
        companyName: json["companyName"],
        addOne: json['companyAdd1'],
        addTwo: json['companyAdd2'],
        gst: json['gstIn']);
  }
}
