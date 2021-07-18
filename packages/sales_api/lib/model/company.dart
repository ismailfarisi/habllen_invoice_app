import 'package:equatable/equatable.dart';

class Company extends Equatable {
  const Company(
      {this.companyId,
      this.companyName,
      this.companyAdd1,
      this.companyAdd2,
      this.companyGst});

  final String? companyId;
  final String? companyName;
  final String? companyAdd1;
  final String? companyAdd2;
  final String? companyGst;

  @override
  List<Object?> get props =>
      [companyId, companyName, companyAdd1, companyAdd2, companyGst];
}
