import 'package:equatable/equatable.dart';

class Company extends Equatable {
  final String companyId;
  final String companyName;
  final String addOne;
  final String addTwo;
  final String gst;

  Company(this.companyId, this.companyName, this.addOne, this.addTwo, this.gst);

  @override
  List<Object?> get props => [];
}
